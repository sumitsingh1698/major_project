import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:major_project/code/entity/ResultEntity.dart';

class SanketApi {
  String _baseUrl = "https://prediction-disease-api.herokuapp.com";

  Future<dynamic> getListofSymtoms() async {
    final url = "/api/predict";

    print(_baseUrl + url);

    var dio = Dio();

    print("$_baseUrl$url");

    var response = await dio.get(
      _baseUrl + url,
      options: Options(contentType: 'multipart/form-data'),
    );

    print("Response Data ${response.data}");

    print(response.data['status']);
    if (response.data['status'] == null) {
      throw "Can't able to Do now";
    }
    return response.data['data'];
  }

  Future<ResultEntity?> getDiseaseBySymtoms(List symtomsList) async {
    final url = "/api/predict";

    print(_baseUrl + url);

    var dio = Dio();
    print("$_baseUrl$url");
    var data = jsonEncode({"data": getSystomsInString(symtomsList)});
    print(data);
    var response = await dio.post(
      _baseUrl + url,
      data: data,
      options: Options(contentType: 'multipart/form-data'),
    );

    if (response.data == null) return null;
    print(response.data['data']);
    return ResultEntity(response.data['data']['predicted'],
        int.parse(response.data['data']['confidencescore']));
  }

  String getSystomsInString(List symtomsList) {
    String res = "";
    for (int i = 0; i < symtomsList.length; i++) {
      res += symtomsList[i];
      if (i < symtomsList.length - 1) res += ", ";
    }
    return res;
  }

  Future<dynamic> getSongs(String emotion) async {
    final url = "emotion_song/";

    print(_baseUrl + url);

    var dio = Dio();
    FormData formData = new FormData.fromMap({"emotion": "$emotion"});
    print("$_baseUrl$url");

    var response = await dio.post(
      _baseUrl + url,
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

    print("Response Data ${response.data}");

    print(response.statusCode);
    print(response.data);

    return response.data;
  }
}
