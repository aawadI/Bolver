import 'app_helpers.dart';
import '../constants/constants.dart';

class AppValidators {
  static String? checkPassportNumberAZE(String? text) {
    if (text == null || text.trim().isEmpty) {
      return AppHelpers.getTranslation(TrKeys.cannotBeEmpty);
    }
    if (text.trim().length != 8) {
      return AppHelpers.getTranslation(
          TrKeys.passwordNumberShouldContain8Numbers);
    }
    return null;
  }

  static String? checkPassportNumberAA(String? text) {
    if (text == null || text.trim().isEmpty) {
      return AppHelpers.getTranslation(TrKeys.cannotBeEmpty);
    }
    if (text.trim().length != 7) {
      return AppHelpers.getTranslation(
          TrKeys.passwordNumberShouldContain7Numbers);
    }
    return null;
  }

  static String? checkPhoneNumber(String? text) {
    if (text == null || text.trim().isEmpty) {
      return AppHelpers.getTranslation(TrKeys.cannotBeEmpty);
    }
    if (int.tryParse(text.trim()) == null) {
      return AppHelpers.getTranslation(TrKeys.phoneNumberIsNotValid);
    }
    if (int.tryParse(text.trim())! < 994109999999 ||
        int.tryParse(text.trim())! > 994999999999) {
      return AppHelpers.getTranslation(TrKeys.phoneNumberIsNotValid);
    }
    return null;
  }

  static String? checkName(String? text) {
    if (text == null || text.trim().isEmpty) {
      return AppHelpers.getTranslation(TrKeys.cannotBeEmpty);
    }
    if (text.trim().length < 3) {
      return AppHelpers.getTranslation(
          TrKeys.nameShouldContainAtLeast3Characters);
    }
    if (text.contains(RegExp(r'\d'))) {
      return AppHelpers.getTranslation(TrKeys.nameShouldNotContainNumber);
    }
    if (text.contains(' ')) {
      return AppHelpers.getTranslation(TrKeys.nameShouldNotContainEmptySpace);
    }
    return null;
  }

  static String? checkPassportNumber(String? text) {
    if (text == null || text.trim().isEmpty) {
      return AppHelpers.getTranslation(TrKeys.cannotBeEmpty);
    }
    if (text.trim().length < 6) {
      return AppHelpers.getTranslation(
          TrKeys.passwordNumberShouldContainAtLeast6Characters);
    }
    return null;
  }

  static String? checkPassportSecret(String? text) {
    if (text == null || text.trim().isEmpty) {
      return AppHelpers.getTranslation(TrKeys.cannotBeEmpty);
    }
    if (text.trim().length != 7) {
      return AppHelpers.getTranslation(TrKeys.passwordSecretShouldBe7Chars);
    }
    return null;
  }

  static bool _isValidEmail(String email) => RegExp(
        "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$",
      ).hasMatch(email);

  static String? emailCheck(String? text) {
    if (text == null || text.trim().isEmpty) {
      return AppHelpers.getTranslation(TrKeys.cannotBeEmpty);
    }
    if (!_isValidEmail(text)) {
      return AppHelpers.getTranslation(TrKeys.emailIsNotValid);
    }
    return null;
  }

  static String? emptyCheck(String? text) {
    if (text == null || text.trim().isEmpty) {
      return AppHelpers.getTranslation(TrKeys.cannotBeEmpty);
    }
    return null;
  }

  static bool isValidEmail(String email) => RegExp(
        "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$",
      ).hasMatch(email);

  static bool isValidPassword(String password) => password.length > 7;

  static bool arePasswordsTheSame(String password, String confirmPassword) =>
      password == confirmPassword;
}
