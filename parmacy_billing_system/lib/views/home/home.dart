import 'package:flutter/material.dart';
import 'package:parmacy_billing_system/shared/common_color.dart';
import 'package:parmacy_billing_system/views/Login_and_Signin/screen_login/screen_login.dart';
import 'package:parmacy_billing_system/views/billing/billing.dart';
import 'package:parmacy_billing_system/views/medicin/medicin.dart';
import 'package:parmacy_billing_system/views/revenue/revenue.dart';
import 'package:parmacy_billing_system/views/settings/settings.dart';
import 'package:parmacy_billing_system/views/suppliers/suppliers.dart';
import 'package:parmacy_billing_system/views/users/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MainArea(),
    const RevenuePage(),
    const BillingPage(),
    const MedicinePage(),
    const SuppliersPage(),
    const UsersPage(),
    const SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConnonColors.backgroundColor,
      body: Row(
        children: [
          // Left Navigation Bar
          Container(
            width: 250, // Fixed width, so it won’t minimize
            color: ConnonColors.navigationColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                // Logo or Profile
                CircleAvatar(
                  radius: 35,
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ConnonColors.backgroundColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/logo/Logo.png'),
                          Text("ThePharamaSystem"),
                        ],
                      ),
                    ),
                  ),
                ),
                _buildNavItem(Icons.home, "Dashboard", 0),
                _buildNavItem(Icons.attach_money_sharp, "Revenue", 1),
                _buildNavItem(Icons.blinds_closed, "Billing", 2),
                _buildNavItem(Icons.medical_information, "Medicine", 3),
                _buildNavItem(Icons.people, "Suppliers", 4),
                _buildNavItem(Icons.supervised_user_circle_sharp, "Users", 5),
                const Spacer(),
                _buildNavItem(Icons.settings, "Settings", 6),
                _buildNavItem(Icons.logout, "Logout", -1, logout: true),
              ],
            ),
          ),

          // Main Content Area
          // MainArea(),
          Expanded(
            child: IndexedStack(index: _selectedIndex, children: _pages),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String title,
    int index, {
    bool logout = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: TextButton(
        onPressed: () {
          if (logout) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => ScreenLogin()),
              (route) => false,
            );
          } else {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
        child: Row(
          children: [
            Icon(
              icon,
              color: _selectedIndex == index ? Colors.blue : Colors.white70,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                color: _selectedIndex == index ? Colors.blue : Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainArea extends StatelessWidget {
  const MainArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ConnonColors.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ✅ Top row: search + add button
            Row(
              children: [
                Expanded(
                  flex: 10,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search for anything here",
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 35,
                        horizontal: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _showMedicinePopup(context),
                    icon: const Icon(Icons.add),
                    label: const Text("Add"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 40,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ✅ Middle area: revenue + billing
            Expanded(
              child: Row(
                children: [
                  
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(child: Text("Revenue")),
                    ),
                  ),
                   const SizedBox(width: 20),
                  BillingBox(),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ✅ Bottom area: medicine + suppliers
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(child: Text("Medicine")),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(child: Text("Suppliers")),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ✅ Users full width
            UserBox(),
            
          ],
        ),
      ),
    );
  }

  void _showMedicinePopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // tap outside to close
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: Container(
            width: 1500,
            height: 900,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(child: Text("Add Medicine Form")),
          ),
        );
      },
    );
  }
}

class UserBox extends StatelessWidget {
  const UserBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            // List
            ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("username ${index + 1}"),
                  subtitle: Text("Details for item ${index + 1}"),
                  leading: CircleAvatar(child: Icon(Icons.person),),
                  trailing: Icon(Icons.medical_information_rounded),
                  
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            ),

            // FAB
            Positioned(
              bottom: 16,
              right: 16,
              child: FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: () {
                  // TODO: Add new revenue action
                 
                },
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class BillingBox extends StatelessWidget {
  const BillingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            // List
            ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Revenue Item ${index + 1}"),
                  subtitle: Text("Details for item ${index + 1}"),
                  leading: CircleAvatar(child: Icon(Icons.person),),
                  trailing: Icon(Icons.payment),

                );
              },
              separatorBuilder: (context, index) => const Divider(),
            ),

            // FAB
            Positioned(
              bottom: 16,
              right: 16,
              child: FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: () {
                  // TODO: Add new revenue action
                 
                },
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



  void _showMedicinePopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // tap outside to close
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent, // make background clear
          insetPadding: const EdgeInsets.all(20), // padding from screen edges
          child: Container(
            width: 1500,
            height: 900, // adjust height
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade200, // background of popup
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                // LEFT SIDE: drug list + user info
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Search
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Search for anything here..",
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Drugs List
                      Expanded(
                        child: ListView(
                          children: List.generate(4, (index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                title: Text("Drug ${index + 1}"),
                                trailing: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey.shade300,
                                    foregroundColor: Colors.black,
                                  ),
                                  child: const Text("ADD"),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),

                      const SizedBox(height: 12),
                      // User Info
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            const TextField(
                              decoration: InputDecoration(
                                hintText: "User Name",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text("Save"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 20),

                // RIGHT SIDE: medicine info
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Medicine Information",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Example item
                        Row(
                          children: [
                            const Expanded(
                              child: Text("Drug 1 (x1) - Price: 200"),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red.shade100,
                              ),
                              child: const Text("SUB"),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text("ADD"),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade300,
                                foregroundColor: Colors.black,
                              ),
                              child: const Text("REMOVE"),
                            ),
                          ],
                        ),

                        const Spacer(),

                        // GST & Total
                        const Text("G.S.T: 2400"),
                        const Text("Total Amount: 24,400"),
                        const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red.shade100,
                                foregroundColor: Colors.black,
                              ),
                              child: const Text("Remove"),
                            ),
                            const SizedBox(width: 12),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text("Bill"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

