import 'package:elementary/elementary.dart';
import 'package:flutter/widgets.dart';

import '../../app_model.dart';
import '../../main.dart';
import '../../service/model/company.dart';
import 'company_details_screen.dart';
import 'company_details_screen_model.dart';

class CompanyDetailsScreenWM
    extends WidgetModel<CompanyDetailsScreen, CompanyDetailsScreenModel>
    implements ICompanyDetailsScreenWM {
  @override
  Company? get company => model.company;

  CompanyDetailsScreenWM(CompanyDetailsScreenModel model) : super(model);
}

CompanyDetailsScreenWM createCompanyDetailsScreenWM(BuildContext _) =>
    CompanyDetailsScreenWM(CompanyDetailsScreenModel(getIt<AppModel>()));

abstract class ICompanyDetailsScreenWM extends IWidgetModel {
  Company? get company;
}
