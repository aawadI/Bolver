import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/select_lang_state.dart';
import '../../../../../../models/models.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../repository/repository.dart';
import '../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../riverpod/notifier/app_notifier.dart';

class SelectLangNotifier extends StateNotifier<SelectLangState> {
  final SettingsRepository _settingsRepository;

  SelectLangNotifier(this._settingsRepository) : super(const SelectLangState());

  Future<void> getLanguages(bool isRequired) async {
    state = state.copyWith(isLoading: true, languages: [], selectedIndex: 0);
    final response = await _settingsRepository.getLanguages();
    response.when(
      success: (data) {
        if (isRequired) {
          final List<LanguageData> languages = data.data ?? [];
          int index = 0;
          for (int i = 0; i < languages.length; i++) {
            if (languages[i].isDefault == 1) {
              index = i;
              break;
            }
          }
          state = state.copyWith(
            isLoading: false,
            languages: data.data ?? [],
            selectedIndex: index,
          );
        } else {
          final List<LanguageData> languages = data.data ?? [];
          final lang = LocalStorage.instance.getLanguage();
          int index = 0;
          for (int i = 0; i < languages.length; i++) {
            if (languages[i].id == lang?.id) {
              index = i;
              break;
            }
          }
          state = state.copyWith(
            isLoading: false,
            languages: data.data ?? [],
            selectedIndex: index,
          );
        }
      },
      failure: (failure) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> error with settings fetched');
      },
    );
  }

  void setLangIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  Future<void> makeSelectedLang(BuildContext context, bool isRequired) async {
    final storage = LocalStorage.instance;
    storage.setLangSelected(true);
    storage.setLanguageData(state.languages[state.selectedIndex]);
    storage.setLangLtr(state.languages[state.selectedIndex].backward);
    await getTranslations(context, isRequired);
  }

  Future<void> changeLang(
    BuildContext context,
    AppNotifier appNotifier,
    bool isRequired, {
    VoidCallback? afterUpdating,
  }) async {
    await LocalStorage.instance
        .setLanguageData(state.languages[state.selectedIndex]);
    await LocalStorage.instance
        .setLangLtr(state.languages[state.selectedIndex].backward);
    // ignore: use_build_context_synchronously
    await getTranslations(context, isRequired);
    await appNotifier.changeLocale(state.languages[state.selectedIndex]);
    afterUpdating?.call();
  }

  Future<void> getTranslations(BuildContext context, bool isRequired) async {
    final connect = await AppConnectivity.connectivity();
    if (connect) {
      state = state.copyWith(isSaving: true);
      final response = await _settingsRepository.getMobileTranslations();
      response.when(
        success: (data) {
          LocalStorage.instance.setTranslations(data.data);
          state = state.copyWith(isSaving: false);
          if (isRequired) {
            final storage = LocalStorage.instance;
            if (storage.getToken().isEmpty) {
              if (storage.getIsGuest()) {
                context.replaceRoute(const ShopMainRoute());
              } else {
                context.replaceRoute(const ShopMainRoute());
              }
            } else {
              if (!mounted) return;
              context.replaceRoute(const ShopMainRoute());
            }
          } else {
            context.popRoute();
          }
        },
        failure: (failure) {
          debugPrint('==> error with fetching translations $failure');
          state = state.copyWith(isSaving: false);
        },
      );
    } else {
      if (!mounted) return;
      context.replaceRoute(const NoConnectionRoute());
    }
  }
}
