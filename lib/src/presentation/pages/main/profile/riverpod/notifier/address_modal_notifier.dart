import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/address_modal_state.dart';
import '../../../../../../models/models.dart';
import '../../../../../../core/utils/utils.dart';

class AddressModalNotifier extends StateNotifier<AddressModalState> {
  AddressModalNotifier() : super(const AddressModalState());

  void fetchLocalAddresses() {
    state = state.copyWith(
      addresses: LocalStorage.instance.getNewAddresses(),
      activeAddress: LocalStorage.instance.getActiveAddressTitle(),
    );
  }

  Future<void> changeLocalAddress(int index) async {
    String title = '';
    final List<AddressData> newAddresses =
    LocalStorage.instance.getNewAddresses();
    for (int i = 0; i < newAddresses.length; i++) {
      if (i == index) {
        title = newAddresses[i].title ?? '';
        final updated = newAddresses[i].copyWith(active: true);
        newAddresses[i] = updated;
      } else if (newAddresses[i].active ?? false) {
        final updated = newAddresses[i].copyWith(active: false);
        newAddresses[i] = updated;
      }
    }
    LocalStorage.instance.setNewAddresses(newAddresses);
    LocalStorage.instance.setActiveAddressTile(title);
    fetchLocalAddresses();
  }
}
