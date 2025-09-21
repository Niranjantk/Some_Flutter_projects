import 'package:flutter/material.dart';
import 'package:parmacy_billing_system/views/common/custome_text.dart';
import 'package:fl_chart/fl_chart.dart';

class RevenueAndRecentlyBilling extends StatelessWidget {
  const RevenueAndRecentlyBilling({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RevenueContainer(),
        RecentlyBillContainer(),
      ],
    );
  }
}

class RecentlyBillContainer extends StatelessWidget {
  const RecentlyBillContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomeText(
                    label: "Recent Billing",
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  IconButton(
                    color: Colors.white,
                    onPressed: () {
                    
                  }, icon: Icon(Icons.read_more_outlined))
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              height: 500,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: ListView.separated(
                  itemCount: 10,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      color: Colors.grey[300],
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.teal.shade100,
                        child: Icon(
                          Icons.medical_services,
                          color: Colors.teal.shade800,
                        ),
                      ),
                      title: Text(
                        "Paracetamol 500mg",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Qty: 2 | Bill No: #00${index + 1}",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            "25 January 2025",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                      trailing: Text(
                        "\$228",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700,
                        ),
                      ),
                    );
                  },
                ),
                //MedicinListView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RevenueContainer extends StatelessWidget {
  const RevenueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(top: 16,right: 16,left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CustomeText(
                label: "Revenue",
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Container(
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Heading
                  
            
                  // Revenue amount
                  Text(
                    "\$12,450",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                    ),
                  ),
                  SizedBox(height: 16),
            
                  // Small stats cards
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Users",
                                style: TextStyle(color: Colors.black, fontSize: 14),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "1,245",
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Orders",
                                style: TextStyle(color: Colors.black, fontSize: 14),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "328",
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
            
                  // Chart
                  SizedBox(
                    height: 270,
                    width: 900, // fixed chart height
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: true,
                          horizontalInterval: 500,
                          verticalInterval: 1,
                          getDrawingHorizontalLine: (value) =>
                              FlLine(color: Colors.black, strokeWidth: 1),
                          getDrawingVerticalLine: (value) =>
                              FlLine(color: Colors.black, strokeWidth: 1),
                        ),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 40,
                              interval: 500,
                              getTitlesWidget: (value, meta) {
                                return Text("\$${value.toInt()}",
                                    style: TextStyle(color: Colors.black, fontSize: 10));
                              },
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: 1,
                              getTitlesWidget: (value, meta) {
                                const weekDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
                                return Text(weekDays[value.toInt() % 7],
                                    style: TextStyle(color: Colors.black, fontSize: 10));
                              },
                            ),
                          ),
                        ),
                        borderData: FlBorderData(show: false),
                        lineBarsData: [
                          LineChartBarData(
                            spots: const [
                              FlSpot(0, 1000),
                              FlSpot(1, 2000),
                              FlSpot(2, 1800),
                              FlSpot(3, 2200),
                              FlSpot(4, 2500),
                              FlSpot(5, 2000),
                              FlSpot(6, 2700),
                            ],
                            isCurved: true,
                            gradient: LinearGradient(
                              colors: [Colors.green, Colors.blue],
                            ),
                            barWidth: 3,
                            dotData: FlDotData(show: true),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}