import 'package:http/http.dart' as http;
import 'dart:io';

uploadImage(String DUID, File file) async {
  var request = http.MultipartRequest("POST",
      Uri.parse("https://dhwaniapi-uvi3.onrender.com/accounts/predict"));
  request.fields['title'] = "dummy";
  request.headers['Referer'] = "https://dhwaniapi-uvi3.onrender.com";
  request.fields['DUID'] = DUID;

  var picture = http.MultipartFile.fromBytes('img', file.readAsBytesSync(),
      filename: 'testimage.png');

  request.files.add(picture);
  var response = await request.send();

  var responseData = await response.stream.toBytes();
  var result = String.fromCharCodes(responseData);
  return result;
}
