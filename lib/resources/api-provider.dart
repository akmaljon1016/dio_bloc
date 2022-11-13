import 'package:dio/dio.dart';

import '../model/covid_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://api.covid19api.com/summary';

  Future<CovidModel> fetchCovidList() async {
    try {
      Response response = await _dio.get(_url);
      print(response.data);
      return CovidModel.fromJson(response.data);
    } catch (error, stackTrace) {
      return CovidModel.withError("Data Not found");
    }
  }
}
