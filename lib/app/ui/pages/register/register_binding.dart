import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../../core/adapters/http_adapter.dart';
import '../../../core/network/network_info.dart';
import '../../../modules/auth/data/repositories/register_repository.dart';
import '../../../modules/auth/domain/usecases/register_with_credentials_usecase.dart';
import '../../../modules/sms/data/repositories/sms_repository.dart';
import '../../../modules/sms/domain/usecases/validade_phone_usecase.dart';
import '../../../modules/sms/domain/usecases/validate_confirmation_code_usecase.dart';
import 'register_presenter.dart';
import 'register_states.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    final HttpAdapter httpAdapter = HttpAdapter(Client());
    final DataConnectionChecker dataConnectionChecker = DataConnectionChecker();
    final NetworkInfo networkInfo = NetworkInfo(dataConnectionChecker);
    final SmsRepository smsRepository = SmsRepository(httpAdapter: httpAdapter, networkInfo: networkInfo);
    final RegisterRepository registerRepository =
        RegisterRepository(httpAdapter: httpAdapter, networkInfo: networkInfo);

    Get.lazyPut<RegisterStates>(() => RegisterStates(), fenix: false);
    Get.lazyPut<RegisterPresenter>(() => RegisterPresenter(), fenix: false);
    Get.lazyPut<ValidatePhoneUsecase>(() => ValidatePhoneUsecase(smsRepository));
    Get.lazyPut<ValidateConfirmationCodeUsecase>(() => ValidateConfirmationCodeUsecase(smsRepository));
    Get.lazyPut<RegisterWithCredentialsUsecase>(() => RegisterWithCredentialsUsecase(registerRepository));
  }
}
