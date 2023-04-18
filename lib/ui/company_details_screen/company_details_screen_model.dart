import 'package:chart_flutter/service/model/company.dart';
import 'package:elementary/elementary.dart';

import '../../app_model.dart';

class CompanyDetailsScreenModel extends ElementaryModel {
  final AppModel _appModel;

  Company? get company => _appModel.company;

  CompanyDetailsScreenModel(this._appModel);
}
