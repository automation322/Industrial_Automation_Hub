import 'Package:http/http.dart' as http;
import 'Package:http/http.dart' as httpMethod;
class ApiServices {
    static Future getMethod(Uri url) async{
      return await http.get(url);

    }
}