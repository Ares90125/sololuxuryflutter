import 'dart:convert';

import 'package:solo_luxury/data/model/signup_response_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/signup_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

import '../../validator.dart';

class SignupAPIRepository implements ISignupRepository {

  final SignupAPIProvider signupAPIProvider;

  SignupAPIRepository({required this.signupAPIProvider});

  @override
  Future<dynamic> getSignupAPIResponse(String signupRequestJson) async {
    final signupResponseModel = await signupAPIProvider.getSignupResponseProvider(urlPath: AppConstants.signUp,  signupRequestJson:signupRequestJson);

    if(signupResponseModel.status.hasError) {
      Validators.apiResponseMessage(body: jsonEncode(signupResponseModel.body!), message: signupResponseModel.statusText);
      return null;
    } else {
      return signupResponseModel.body!;
    }
  }

}