import 'package:http/http.dart' as http;



void main() async {

  var url = Uri.parse('http://ec2-54-180-27-169.ap-northeast-2.compute.amazonaws.com:8080/healthCheck');
  var response = await http.get(url);
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  var responseBody = response.body;

  print("statusCode: ${statusCode}");
  print("responseHeaders: ${responseHeaders}");
  print("responseBody: ${responseBody}");

  //runApp(MyApp());
}