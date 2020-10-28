import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/app/ui/pages/register/register_presenter.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';

class RegisterStates extends GetxController {
  static get presenter => Get.find<RegisterPresenter>();
  bool isPhoneValidationStep = true;

  switchPhoneValidationStep() {
    isPhoneValidationStep = !isPhoneValidationStep;
    update();
  }

  bool get isReadyToRegister =>
      // * TODO: UNCOMMENT

      ((/* isRegisteringWithEmailAndPassword && */ emailIsValid && passwordsMatch && passwordIsValid) ||
          userIsAuthenticatedWithGoogle ||
          userIsAuthenticatedWithFacebook);

  //
  // PHONE SMS SENDING RELATED
  //

  bool sendSmsButtonIsEnabled = false;

  bool get showInvalidPhoneMessage {
    if (!(userPhone.length >= 11) && userTappedDisabledSmsButton) return true;
    return false;
  }

  bool userTappedDisabledSmsButton = false;

  // ignore: always_declare_return_types
  switchUserTappedDisabledSmsButton() {
    userTappedDisabledSmsButton = !userTappedDisabledSmsButton;
    update();
  }

  bool userHasSentCode = false;

  void switchUserHasSentCode() {
    userHasSentCode = !userHasSentCode;
    update();
  }

  MaskedTextController phoneController = MaskedTextController(mask: '(00) 00000-0000');
  String userPhone = '';
  void setUserPhone() {
    userPhone = phoneController.text.replaceAll("-", '').replaceAll('(', '').replaceAll(')', '').replaceAll(' ', '');
    if (userPhone.length == 11) sendSmsButtonIsEnabled = true;
    if (userPhone.length != 11) sendSmsButtonIsEnabled = false;
    update();
  }

  String lastlySentPhone = "";

  setLastlySentPhone(String value) => lastlySentPhone = value;

  String userCountryCode = '+55';

  setUserCountryCode(String value) => userCountryCode = value;

  String lastlySentUserCountryCode = '+55';

  setLastlySentUserCountryCode(String value) => lastlySentUserCountryCode = value;
  //
  // END OF PHONE SMS SENDING RELATED
  //

  //

  //
  // VERIFICATION CODE RELATED
  //

  FocusNode confirmCodeFocusNode = FocusNode(canRequestFocus: true);
  focusConfirmCode() {
    confirmCodeFocusNode.requestFocus();
    update();
  }

  bool isConfirmingPhone = false;

  switchConfirmingPhone() {
    isConfirmingPhone = !isConfirmingPhone;
    update();
  }

  bool confirmationCodeIsWrong = false;

  switchConfirmationCodeIsWrong() {
    confirmationCodeIsWrong = !confirmationCodeIsWrong;
    update();
  }

  bool confirmationCodeIsCorrect = false;

  switchConfirmationCodeIsCorrect() {
    confirmationCodeIsCorrect = !confirmationCodeIsCorrect;
    update();
  }

  bool phoneHasBeenValidated = false;

  switchPhoneHasBeenValidated() {
    phoneHasBeenValidated = !phoneHasBeenValidated;
    update();
  }

  bool awaitingConfirmationCode = false;

  switchAwaitingConfirmationCode() {
    awaitingConfirmationCode = !awaitingConfirmationCode;
    update();
  }

  String confirmationCode;

  setConfirmationCode(String value) {
    confirmationCode = value;
    update();
  }

  //
  // END OF VERIFICATION CODE RELATED
  //

  //
  // REGISTERING INFO RELATED
  //

  String userEmail = "";

  setUserEmail(String value) {
    userEmail = value;
    update();
  }

  String passwordField = "";

  setPasswordField(String value) {
    passwordField = value;
    update();
  }

  String confirmPasswordField = "";

  setConfirmPasswordField(String value) {
    confirmPasswordField = value;
    update();
  }

  bool isRegisterDataStep = false;

  switchRegisterDataStep() {
    isRegisterDataStep = !isRegisterDataStep;
    update();
  }

  bool isRegisteringWithEmailAndPassword = false;

  switchIsRegisteringWithEmailAndPassword() {
    isRegisteringWithEmailAndPassword = !isRegisteringWithEmailAndPassword;
    update();
  }

  bool passwordIsObscure = false;

  switchPasswordIsObscure() {
    passwordIsObscure = !passwordIsObscure;
    update();
  }

  bool get emailIsValid {
    const Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(userEmail);
  }

  bool get passwordIsValid {
    /* 
    r'^
      (?=.*[A-Z])       // should contain at least one upper case
      (?=.*[a-z])       // should contain at least one lower case
      (?=.*?[0-9])          // should contain at least one digit
      (?=.*?[!@#\$&*~]).{8,}  // should contain at least one Special character
    $ 
    */
    //! TODO
    /* Pattern pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(passwordField) && passwordField.length >= 8; */
    return passwordField.length >= 8;
  }

  bool get passwordsMatch {
    return passwordField == confirmPasswordField;
  }

  //
  // END OF REGISTERING INFO RELATED
  //

  bool userIsAuthenticatedWithGoogle = false;

  switchUserisAuthenticatedWithGoogle() {
    userIsAuthenticatedWithGoogle = !userIsAuthenticatedWithGoogle;
    update();
  }

  bool userIsAuthenticatedWithFacebook = false;

  switchUserIsAuthenticatedWithFacebook() {
    userIsAuthenticatedWithFacebook = !userIsAuthenticatedWithFacebook;
    update();
  }

  int currentStep = 1;

  decreaseCurrentStep() {
    if (currentStep != 1) currentStep--;
    update();
  }

  increaseCurrentStep() {
    if (currentStep != 3) currentStep++;
    update();
  }

  //
  // API CONSUMPTION
  //

  get validatePhone => presenter.validatePhone();
  get validateConfirmationCode => presenter.validateConfirmationCode();
  get registerWithCredentials => presenter.registerWithCredentials();

  Future sendUserDataToApi() async {}

  String responseMessage;

  setResponseMessage(String value) => responseMessage = value;

  sendGoogleUserDataToApi() async {}

  sendFacebookUserDataToApi() async {}
  //
  // END OF API CONSUMPTION
  //
}
