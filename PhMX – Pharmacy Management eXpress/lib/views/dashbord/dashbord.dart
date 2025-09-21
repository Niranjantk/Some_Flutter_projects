import 'package:flutter/material.dart';
import 'package:parmacy_billing_system/views/dashbord/widgets/no_of_medicin_and_no_of_suppliers.dart';
import 'package:parmacy_billing_system/views/dashbord/widgets/revenue_and_resently_billing.dart';
import 'package:parmacy_billing_system/views/dashbord/widgets/search_bar_and_add_button.dart';

class Dashbord extends StatelessWidget {
  const Dashbord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchBarAndAddButton(),
          RevenueAndRecentlyBilling(),
          NoofMedicinAndNoOfSuppliers(),
        ],
      ),
    );
  }
}
