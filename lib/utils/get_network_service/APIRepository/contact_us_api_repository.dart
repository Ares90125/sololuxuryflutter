import 'package:solo_luxury/data/model/contact_us_response_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/contact_us_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

class ContactUsAPIRepository implements IContactUsRepository {
  final ContactUsAPIProvider contactUsAPIProvider;

  ContactUsAPIRepository({required this.contactUsAPIProvider});

  @override
  Future<dynamic> getContactUsApiResponse(
      String contactusRequestJson,
      String orderNo,
      String country,
      String subject,
      String message,
      String sourceOfTicket,
      String phoneNumber,
      String typeOfEnquiry,
      String email,
      String name,
      String lastName) async {

    final contactUsResponseModel =
        await contactUsAPIProvider.getContactUsResponseProvider(
      urlPath: AppConstants.signUp,
      contactusRequestJson: contactusRequestJson,

      orderNo: orderNo,
      country: country,
      subject: subject,
      message: message,
      sourceOfTicket: sourceOfTicket,
      phoneNumber: phoneNumber,
      typeOfEnquiry: typeOfEnquiry,
      email: email,
      name: name,
      lastName: lastName,
    );
    print("Contact Us Response $contactUsResponseModel");

    // if (contactUsResponseMode.) {
    //   return Future.error(contactUsResponseModel.statusText!);
    // } else {
    return contactUsResponseModel;
    // }
  }
}
