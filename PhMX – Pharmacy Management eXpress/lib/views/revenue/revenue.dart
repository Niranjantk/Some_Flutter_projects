import 'package:flutter/material.dart';
import 'package:parmacy_billing_system/views/dashbord/widgets/search_bar_and_add_button.dart';
import 'package:parmacy_billing_system/views/revenue/widgets/pie_chart_and_redar_chart.dart';
import 'package:parmacy_billing_system/views/revenue/widgets/revenue_chart.dart';

class RevenuePage extends StatelessWidget {
  const RevenuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchBarAndAddButton(),
          RevenueChart(),
          PiChartRadarChart(),
        ],
      ),
    );
  }
}



