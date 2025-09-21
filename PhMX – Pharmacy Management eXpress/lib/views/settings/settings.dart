import 'package:flutter/material.dart';
import 'package:parmacy_billing_system/views/common/widgets/setting_pop_up/edit_medicin_add%20details.dart';
import 'package:parmacy_billing_system/views/common/widgets/setting_pop_up/edit_revenue.dart';
import 'package:parmacy_billing_system/views/common/widgets/setting_pop_up/edit_user_and%20_suppliers_popup.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                const SizedBox(height: 20),

                // 🔹 Account Section
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "Account",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("Profile"),
                  subtitle: const Text("Update your personal info"),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.lock),
                  title: const Text("Change Password"),
                  subtitle: const Text("Update your account password"),
                  onTap: () {},
                ),

                const Divider(),
                ListTile(
                  leading: const Icon(Icons.stars_outlined),
                  title: const Text("Setup Account"),

                  onTap: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true, // tap outside to close
                          builder: (context) => const RevenueEditPopUp(),
                        );
                      },
                      child: const Text('Revenue'),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) => const MedicineFormPopUp(),
                        );
                      },
                      child: const Text(" Medicine"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const UserFormPopUp(),
                        );
                      },
                      child: const Text(" Add User"),
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('others')),
                  ],
                ),
                //total amount expence
                //profit
                //add medicin
                //add user and supplierss
                Divider(),

                // 🔹 Notifications Section
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "Notifications",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SwitchListTile(
                  value: true,
                  title: const Text("Push Notifications"),
                  onChanged: (val) {},
                ),

                const Divider(),

                // 🔹 Theme Section
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "Appearance",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.dark_mode),
                  title: const Text("Dark Mode"),
                  trailing: Switch(value: false, onChanged: (val) {}),
                ),

                const Divider(),

                // 🔹 About Section
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "About",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text("App Version"),
                  subtitle: const Text("1.0.0"),
                ),
                ListTile(
                  leading: const Icon(Icons.privacy_tip),
                  title: const Text("Privacy Policy"),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
