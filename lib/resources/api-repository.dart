import '../model/covid_model.dart';

class ApiRepository {
  final _provider = ApiRepository();

  Future<CovidModel> fetchCovidList() {
    return _provider.fetchCovidList();
  }
}

class NetworkError extends Error {}
