import 'package:chart_flutter/ui/companies_screen/companies_screen.dart';
import 'package:flutter/material.dart';

class CompaniesApp extends StatelessWidget {
  const CompaniesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Companies',
      theme: ThemeData(),
      home: const CompaniesScreen(),
    );
  }
}
