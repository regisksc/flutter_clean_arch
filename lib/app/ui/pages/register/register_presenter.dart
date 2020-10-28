import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/app/modules/auth/domain/usecases/register_with_credentials_usecase.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/constants/base_url.dart';
import '../../../modules/sms/domain/usecases/validade_phone_usecase.dart';
import '../../../modules/sms/domain/usecases/validate_confirmation_code_usecase.dart';
import '../../widgets/organisms/loader/loader_widget.dart';
import 'register_states.dart';

class RegisterPresenter extends GetxController {
  final states = Get.find<RegisterStates>();

  final validatePhoneUsecase = Get.find<ValidatePhoneUsecase>();
  validatePhone() async {
    Get.dialog(LoaderWidget());
    final validatePhoneReturn = await validatePhoneUsecase(
      ValidatePhoneParams(
        endpoint: URL.endpoint('phone_verify'),
        body: {
          'countryCode': states.userCountryCode,
          'cellNumber': states.userPhone,
        },
      ),
    );
    Get.back();
    validatePhoneReturn.fold(
      (failure) {
        Get.dialog(
          Container(
            margin: EdgeInsets.all(10),
            color: Colors.red[100],
            child: Text("ERRO: $failure"),
          ),
        );
      },
      (success) {
        states.focusConfirmCode();
        if (!states.userHasSentCode) states.switchUserHasSentCode();
        if (!states.isConfirmingPhone) states.switchConfirmingPhone();
        states.increaseCurrentStep();
      },
    );
  }

  final validateConfirmationCodeUsecase = Get.find<ValidateConfirmationCodeUsecase>();
  validateConfirmationCode() async {
    Get.dialog(LoaderWidget());
    final validateConfirmationCodeReturn = await validateConfirmationCodeUsecase(
      ValidateConfirmationCodeParams(body: {
        'countryCode': states.userCountryCode,
        'cellNumber': states.userPhone,
        'codeNumber': states.confirmationCode,
      }),
    );
    Get.back();

    validateConfirmationCodeReturn.fold((failure) {}, (success) {
      print(success.toString());
      states.switchConfirmationCodeIsWrong();
      states.switchPhoneValidationStep();
      states.switchRegisterDataStep();
      states.increaseCurrentStep();
      states.update();
    });
  }

  final registerWithCredentialsUsecase = Get.find<RegisterWithCredentialsUsecase>();
  registerWithCredentials() async {
    Get.dialog(LoaderWidget());
    final registerWithCredentialsReturn = await registerWithCredentialsUsecase(
      RegisterWithCredentialsParams(
        {
          'identifier': 'email',
          'password': states.passwordField,
          'countryCode': states.userCountryCode,
          'cellNumber': states.userPhone,
          'codeNumber': states.userCountryCode,
        },
      ),
    );
    Get.back();

    registerWithCredentialsReturn.fold(
      (failure) => print(failure.message),
      (success) => /* Get.offAllNamed('/home') */ print("Foi Logado e cadastrado"),
    );
  }
}
