import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../models/data/address_data.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import 'riverpod/provider/new_address_provider.dart';
import 'widgets/gender_popup_button.dart';
import 'widgets/map_section.dart';
import 'widgets/passport_prefix_popup_button.dart';
import 'widgets/search_location_modal.dart';
import 'widgets/section_title.dart';

class NewAddressPage extends ConsumerStatefulWidget {
  final AddressData? addressData;

  const NewAddressPage({
    Key? key,
    this.addressData,
  }) : super(key: key);

  @override
  ConsumerState<NewAddressPage> createState() => _NewAddressPageState();
}

class _NewAddressPageState extends ConsumerState<NewAddressPage>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late AnimationController _animationController;
  late GoogleMapController _mapController;
  CameraPosition? _cameraPosition;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(newAddressProvider.notifier).setInitialInfo(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _mapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLtr = LocalStorage.instance.getLangLtr();
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: KeyboardDismisser(
        child: Scaffold(
          backgroundColor:
              isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
          appBar: CommonAppBar(
            title: AppHelpers.getTranslation(TrKeys.addNewAddress),
            onLeadingPressed: context.popRoute,
          ),
          body: Column(
            children: [
              Divider(thickness: 1.r, height: 1.r, color: AppColors.divider),
              Expanded(
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: _formKey,
                      child: Consumer(
                        builder: (context, ref, child) {
                          final event = ref.read(newAddressProvider.notifier);
                          final state = ref.watch(newAddressProvider);
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              24.verticalSpace,
                              SectionTitle(
                                title: AppHelpers.getTranslation(
                                    TrKeys.personalInformation),
                              ),
                              24.verticalSpace,
                              UnderlinedTextField(
                                label:
                                    '${AppHelpers.getTranslation(TrKeys.firstname)}*',
                                initialText: LocalStorage.instance
                                    .getUser()
                                    ?.firstname
                                    ?.replaceAll(" ", ""),
                                validator: AppValidators.checkName,
                                onChanged: event.setFirstname,
                                textInputAction: TextInputAction.next,
                              ),
                              24.verticalSpace,
                              UnderlinedTextField(
                                label:
                                    '${AppHelpers.getTranslation(TrKeys.lastname)}*',
                                initialText:
                                    LocalStorage.instance.getUser()?.lastname,
                                validator: AppValidators.checkName,
                                onChanged: event.setLastname,
                                textInputAction: TextInputAction.next,
                              ),
                              // if (widget.addressData?.birthDate != null)
                              Column(
                                children: [
                                  24.verticalSpace,
                                  OutlinedSelectButton(
                                    label:
                                        '${AppHelpers.getTranslation(TrKeys.dateOfBirth)}*',
                                    text: state.dob,
                                    trailingIconData:
                                        FlutterRemix.calendar_event_line,
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) =>
                                            CustomDatePickerModal(
                                          initialDate: state.dob,
                                          onDateSaved: event.setDob,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              24.verticalSpace,
                              UnderlinedTextField(
                                label:
                                    '${AppHelpers.getTranslation(TrKeys.email)}*',
                                initialText:
                                    LocalStorage.instance.getUser()?.email,
                                validator: AppValidators.emailCheck,
                                onChanged: event.setEmail,
                                inputType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                isError: state.isError,
                                descriptionText: state.isError
                                    ? AppHelpers.getTranslation(
                                        TrKeys.useDifferentEmail)
                                    : null,
                              ),
                              24.verticalSpace,
                              UnderlinedTextField(
                                label:
                                    '${AppHelpers.getTranslation(TrKeys.phone)}*',
                                initialText:
                                    LocalStorage.instance.getUser()?.phone,
                                validator: AppValidators.checkPhoneNumber,
                                onChanged: event.setPhone,
                                inputType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                isError: state.isError,
                                descriptionText: state.isError
                                    ? AppHelpers.getTranslation(
                                        TrKeys.useDifferentEmail)
                                    : null,
                              ),
                              24.verticalSpace,
                              UnderlinedTextField(
                                label: AppHelpers.getTranslation(
                                    TrKeys.companyName),
                                onChanged: event.setCompanyName,
                                textInputAction: TextInputAction.next,
                              ),
                              24.verticalSpace,
                              UnderlinedTextField(
                                label:
                                    '${AppHelpers.getTranslation(TrKeys.apartment)}*',
                                validator: AppValidators.emptyCheck,
                                onChanged: event.setApartment,
                                textInputAction: TextInputAction.next,
                              ),
                              24.verticalSpace,
                              UnderlinedTextField(
                                label:
                                    '${AppHelpers.getTranslation(TrKeys.townCity)}*',
                                validator: AppValidators.emptyCheck,
                                onChanged: event.setTownCity,
                                textInputAction: TextInputAction.next,
                              ),
                              24.verticalSpace,
                              UnderlinedTextField(
                                label: AppHelpers.getTranslation(
                                    TrKeys.stateProvince),
                                onChanged: event.setStateProvince,
                                textInputAction: TextInputAction.next,
                              ),
                              24.verticalSpace,
                              UnderlinedTextField(
                                label:
                                    "${AppHelpers.getTranslation(TrKeys.postcodeZip)}*",
                                onChanged: event.setPostcodeZip,
                                textInputAction: TextInputAction.next,
                                validator: AppValidators.emptyCheck,
                              ),
                              24.verticalSpace,
                              UnderlinedTextField(
                                label: AppHelpers.getTranslation(TrKeys.note),
                                onChanged: event.setNote,
                                textInputAction: TextInputAction.next,
                              ),
                              if (LocalStorage.instance
                                      .getUser()
                                      ?.passportNumber ==
                                  null)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    32.verticalSpace,
                                    SectionTitle(
                                      title: AppHelpers.getTranslation(
                                          TrKeys.passportInformation),
                                    ),
                                    24.verticalSpace,
                                    Row(
                                      children: [
                                        PassportPrefixPopupButton(
                                          initialValue: state.passportPrefix,
                                          onSelect: event.setPassportPrefix,
                                          value: state.passportPrefix,
                                        ),
                                        10.horizontalSpace,
                                        Expanded(
                                          child: UnderlinedTextField(
                                            label:
                                                '${AppHelpers.getTranslation(TrKeys.passportNumber)}*',
                                            validator: (text) => state
                                                        .passportPrefix ==
                                                    'AA'
                                                ? AppValidators
                                                    .checkPassportNumberAA(text)
                                                : AppValidators
                                                    .checkPassportNumberAZE(
                                                        text),
                                            onChanged: event.setPassportNumber,
                                            textInputAction:
                                                TextInputAction.next,
                                            inputType: TextInputType.number,
                                          ),
                                        ),
                                      ],
                                    ),
                                    24.verticalSpace,
                                    UnderlinedTextField(
                                      label:
                                          '${AppHelpers.getTranslation(TrKeys.passportJshshir)}*',
                                      validator:
                                          AppValidators.checkPassportSecret,
                                      onChanged: event.setPassportSecret,
                                      textInputAction: TextInputAction.next,
                                    ),
                                    24.verticalSpace,
                                    GenderPopupButton(
                                      initialValue: state.male,
                                      onSelect: event.setMale,
                                      value: state.male,
                                    ),
                                  ],
                                ),
                              32.verticalSpace,
                              Text(
                                AppHelpers.getTranslation(
                                    TrKeys.deliveryAddress),
                                style: GoogleFonts.cairo(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                  letterSpacing: -14 * 0.01,
                                ),
                              ),
                              24.verticalSpace,
                              UnderlinedTextField(
                                label:
                                    '${AppHelpers.getTranslation(TrKeys.addressName)}*',
                                validator: AppValidators.emptyCheck,
                                onChanged: event.setAddressName,
                                textInputAction: TextInputAction.done,
                              ),
                              24.verticalSpace,
                              UnderlinedTextField(
                                label:
                                    AppHelpers.getTranslation(TrKeys.address),
                                readOnly: true,
                                textController: state.addressController,
                              ),
                              24.verticalSpace,
                              MapSection(
                                animationController: _animationController,
                                onCameraMove: (CameraPosition position) {
                                  _cameraPosition = position;
                                },
                                onCameraIdle: () => event
                                    .fetchLocationName(_cameraPosition?.target),
                                onMyLocationTap: () =>
                                    event.findMyLocation(_mapController),
                                onMapCreated: (controller) {
                                  _mapController = controller;
                                },
                                onSearchTap: () {
                                  AppHelpers.showCustomModalBottomSheet(
                                    context: context,
                                    modal: SearchLocationModal(
                                      mapController: _mapController,
                                    ),
                                    isDarkMode: isDarkMode,
                                  );
                                },
                              ),
                              32.verticalSpace,
                              AccentLoginButton(
                                title: AppHelpers.getTranslation(TrKeys.save),
                                isLoading: state.isLoading,
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    // event.createNewAddress(
                                    //   _cameraPosition?.target,
                                    //   addressData: widget.addressData,
                                    //   success: () {
                                    //     context.popRoute();
                                    //     addressesModalEvent
                                    //         .fetchLocalAddresses();
                                    //     savedLocationsEvent
                                    //         .fetchSavedLocations();
                                    //     deliveryEvent.updateUi();
                                    //   },
                                    //   failed: () {
                                    //     AppHelpers.showCheckFlash(
                                    //         context,
                                    //         AppHelpers.getTranslation(
                                    //             TrKeys.useDifferentEmail));
                                    //   },
                                    // );
                                  }
                                },
                              ),
                              24.verticalSpace,
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
