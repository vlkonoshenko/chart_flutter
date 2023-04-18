import 'dart:math';

import 'package:chart_flutter/service/model/company.dart';
import 'package:elementary/elementary.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'companies_screen_wm.dart';

class CompaniesScreen extends ElementaryWidget<ICompaniesScreenWM> {
  const CompaniesScreen({
    Key? key,
    WidgetModelFactory wmFactory = createCompaniesScreenWM,
  }) : super(wmFactory, key: key);

  Color get _randomColor =>
      Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  @override
  Widget build(ICompaniesScreenWM wm) {
    return Scaffold(
      appBar: AppBar(title: const Text('Companies')),
      body: ValueListenableBuilder<List<Company>>(
        valueListenable: wm.predictions,
        builder: (_, data, __) {
          return data.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (event, pieTouchResponse) {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            return;
                          }
                          wm.onTapCompany(data[pieTouchResponse
                              .touchedSection!.touchedSectionIndex]);
                        },
                      ),
                      sections: data
                          .map((e) => PieChartSectionData(
                                color: _randomColor,
                                showTitle: true,
                                title: e.symbol,
                                value: double.tryParse(e.capitalization),
                              ))
                          .toList(),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
