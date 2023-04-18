import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'company_details_screen_wm.dart';

class CompanyDetailsScreen extends ElementaryWidget<ICompanyDetailsScreenWM> {
  const CompanyDetailsScreen({
    Key? key,
    WidgetModelFactory<CompanyDetailsScreenWM> wmFactory =
        createCompanyDetailsScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ICompanyDetailsScreenWM wm) {
    return Scaffold(
      appBar: AppBar(),
      body: wm.company == null
          ? const Text('Error data loading')
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(wm.company?.name ?? ''),
                Text(wm.company?.address ?? ''),
                Text(wm.company?.symbol ?? ''),
                Text(wm.company?.capitalization ?? ''),
              ],
            ),
    );
  }
}
