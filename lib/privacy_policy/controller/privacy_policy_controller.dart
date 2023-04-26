import '../../api_services/api_services.dart';
import '../../api_services/environment.dart';

class PrivacyPolicyController {
  static Future privacyPolicy() async {
    String params = "?token=W8FKNkGKZi8yP2SyTz5BWD7NgoIE3Las";
    Uri ppUrl = Uri.parse(Environment.base_url + EndPoints.live + params);
    dynamic ppApiCall = await ApiServices.getMethod(ppUrl);
    return ppApiCall.body;
  }
}