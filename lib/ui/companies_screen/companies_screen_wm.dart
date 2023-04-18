import 'package:chart_flutter/service/companies_service.dart';
import 'package:chart_flutter/service/model/company.dart';
import 'package:chart_flutter/service/navigation_helper.dart';
import 'package:chart_flutter/ui/company_details_screen/company_details_screen.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../app_model.dart';
import '../../main.dart';
import 'companies_screen.dart';
import 'companies_screen_model.dart';

class CompaniesScreenWM
    extends WidgetModel<CompaniesScreen, CompaniesScreenModel>
    implements ICompaniesScreenWM {
  final NavigationHelper _navigator;

  @override
  ValueListenable<List<Company>> get predictions => model.predictions;

  CompaniesScreenWM(CompaniesScreenModel model, this._navigator) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    model.getCityPrediction();
  }

  @override
  void onTapCompany(Company company) {
    model.onCompanySelected(company);
    _navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => const CompanyDetailsScreen(),
      ),
    );
  }
}

abstract class ICompaniesScreenWM extends IWidgetModel {
  ValueListenable<List<Company>> get predictions;

  void onTapCompany(Company e);
}

CompaniesScreenWM createCompaniesScreenWM(BuildContext _) => CompaniesScreenWM(
      CompaniesScreenModel(CompaniesService(), getIt<AppModel>()),
      NavigationHelper(),
    );
