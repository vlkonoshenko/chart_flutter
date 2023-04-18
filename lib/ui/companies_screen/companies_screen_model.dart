import 'package:chart_flutter/app_model.dart';
import 'package:chart_flutter/service/companies_service.dart';
import 'package:chart_flutter/service/model/company.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';

class CompaniesScreenModel extends ElementaryModel {
  final ValueNotifier<List<Company>> predictions = ValueNotifier([]);

  final CompaniesService _addressService;
  final AppModel _appModel;

  CompaniesScreenModel(this._addressService, this._appModel);

// ignore:use_setters_to_change_properties
  void onCompanySelected(Company company) {
    _appModel.company = company;
  }

  Future<void> getCityPrediction() async {
    final value = await _addressService.getCityPredictions();
    predictions.value = value;
  }
}
