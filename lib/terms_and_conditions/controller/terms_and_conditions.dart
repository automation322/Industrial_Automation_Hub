import 'package:automation_hub/api_services/api_services.dart';
import 'package:logger/logger.dart';
import '../../api_services/environment.dart';

class TermsAndConditionsController{
  static Future termsAndCondition() async{
    String params = "?token=7WyIvzkTPkoQCIIiLUV9JBh46pHId44B";
    Uri tcurl = Uri.parse(Environment.base_url + EndPoints.live + params);
    dynamic tcApicall =  await ApiServices.getMethod(tcurl);
    //print("apicall");
    //print("${tcApicall.body.toString()}");
    //Logger().v("apicall");
    //Logger().d(tcApicall.body);
    return tcApicall.body;

  }
}