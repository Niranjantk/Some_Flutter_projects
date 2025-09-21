import 'package:flutter/material.dart';
class RevenueChart extends StatelessWidget {
  const RevenueChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Revenue chart"),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            height: 400,
            child: Center(child: Text('data hello')),
          ),
        ],
      ),
    );
  }
}
