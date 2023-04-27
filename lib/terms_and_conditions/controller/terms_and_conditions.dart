import 'package:automation_hub/api_services/api_services.dart';
import '../../api_services/environment.dart';

class TermsAndConditionController {
  static Future termsAndCondition() async {
    String params = "?token=7WyIvzkTPkoQCIIiLUV9JBh46pHId44B";
    Uri tcUrl = Uri.parse(Environment.base_url + EndPoints.live + params);
    dynamic tcApiCall = await ApiServices.getMethod(tcUrl);
    return tcApiCall.body;
  }
}

















