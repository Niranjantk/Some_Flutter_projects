import 'package:flutter/material.dart';
import 'package:parmacy_billing_system/views/billing/billing.dart';
import 'package:parmacy_billing_system/views/common/common_color.dart';
import 'package:parmacy_billing_system/views/common/custome_text.dart';
import 'package:parmacy_billing_system/views/common/widgets/logo.dart';
import 'package:parmacy_billing_system/views/dashbord/dashbord.dart';
import 'package:parmacy_billing_system/views/login/screen_login.dart';
import 'package:parmacy_billing_system/views/medicin/medicin.dart';
import 'package:parmacy_billing_system/views/revenue/revenue.dart';
import 'package:parmacy_billing_system/views/settings/settings.dart';
import 'package:parmacy_billing_system/views/suppliers/suppliers.dart';
import 'package:parmacy_billing_system/views/users/user.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _Navigation();
}

class _Navigation extends State<Navigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    Dashbord(),
    RevenuePage(),
    BillingPage(),
    MedicinePage(),
    UsersPage(),
    SuppliersPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Vertical Navigation Bar (like BottomNavigationBar but left side)
          Container(
            width: 300,
            decoration: BoxDecoration(
              color: CmmonColors.navigationColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                CircleAvatar(child: Icon(Icons.person)),
                SizedBox(height: 10),
                TheSystemLogoContainer(),
                SizedBox(height: 10),
                _buildNavItem(Icons.home, 0, "DashBord"),
                const SizedBox(height: 30),
                _buildNavItem(Icons.attach_money, 1, "Revenue"),
                const SizedBox(height: 30),
                _buildNavItem(Icons.blinds_closed, 2, "Bills"),
                const SizedBox(height: 30),
                _buildNavItem(Icons.medical_information, 3, "Medicin"),
                const SizedBox(height: 30),
                _buildNavItem(Icons.verified_user_sharp, 4, "Users"),
                const SizedBox(height: 30),
                _buildNavItem(Icons.people, 5, "People"),
                const SizedBox(height: 30),
                _buildNavItem(Icons.settings, 6, "Settings"),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: CmmonColors.backgroundColor,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => ScreenLogin(),
                          ),
                          (route) => false,
                        );
                      },
                      icon: Icon(Icons.login_outlined),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Main content
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index, String label) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? const Color.fromARGB(6, 33, 149, 243)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: isSelected ? const Color(0xff1557FF) : Colors.black,
                size: 35,
              ),
              SizedBox(width: 30),

              CustomeText(
                fontWeight: FontWeight.bold,
                label: label,
                color: isSelected
                    ? Color.fromARGB(255, 76, 123, 240)
                    : Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
