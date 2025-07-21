import '../../../data/network/network_api_services.dart';
import '../../../res/urls/app_url.dart';

class PaymentMethodRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> paymentMethodListApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.paymentMethodListUrl);
    return response;
  }

  Future<dynamic> addPaymentMethodApi(var data) async {
    dynamic response = await _apiServices.postApi(
      data,
      AppUrl.addPaymentMethodUrl,
    );
    return response;
  }
}
