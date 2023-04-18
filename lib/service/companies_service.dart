import 'package:dio/dio.dart';

import 'model/company.dart';

const baseUrl = 'https://www.alphavantage.co';
const apiKey = 'DCKP6OODBOOV5RTS';

class CompaniesService {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<List<Company>> getCityPredictions() async {
    final symbols = ['IBM', 'FB', 'AMZN', 'MSFT'];

    final companies = <Company>[];

    for (final s in symbols) {
      final data = await dio.get<dynamic>(
        '/query?function=OVERVIEW&symbol=$s&apikey=$apiKey',
      );
      try {
        final company = Company.fromJson(data.data as Map<String, dynamic>);
        companies.add(company);
      } catch (_) {
        continue;
      }
    }

    return companies;
  }
}
