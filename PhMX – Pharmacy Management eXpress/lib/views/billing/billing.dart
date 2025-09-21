import 'package:flutter/material.dart';
import 'package:parmacy_billing_system/views/dashbord/dashbord.dart';
import 'package:parmacy_billing_system/views/dashbord/widgets/search_bar_and_add_button.dart';

class BillingPage extends StatelessWidget {
  const BillingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Top search + add button (fixed height)
            SearchBarAndAddButton(),

            const SizedBox(height: 16),

            // Content area that scrolls if overflow
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Recent Billing Section
                    Text("Recent Billing"),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      height: 400,
                      child: const Center(child: Text('list of billing')),
                    ),

                    const SizedBox(height: 24),

                    // Scatter Chart Section
                    Text("Scatter Chart"),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      height: 300,
                      child: const Center(child: Text('a chart')),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
