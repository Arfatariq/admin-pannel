import 'package:admin_pannel/screens/Menupage.dart';
import 'package:admin_pannel/screens/analyticspage.dart';
import 'package:admin_pannel/screens/dashboard.dart';
import 'package:admin_pannel/screens/orders_history.dart';
import 'package:flutter/material.dart';

import '../../components/colors.dart';
import '../all_users.dart';

class SizeDrawerMenu extends StatelessWidget {
  const SizeDrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: MyAppColors.primary,
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildDrawerItem(Icons.dashboard, "Dashboard", () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DashboardPage()),
                );
              }),
              buildDrawerItem(Icons.person, 'Users', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AllUsersScreen()),
                );
              }),
              buildDrawerItem(Icons.food_bank, "Menu", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MenuPage()),
                );
              }),
              buildDrawerItem(Icons.table_bar, "Tables", () {}),
              buildDrawerItem(Icons.table_bar, "Orders", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Orderhistorypage()),
                );
              }),
              buildDrawerItem(Icons.settings, 'Settings', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AnalyticsDashboard()),
                );
              }),
              buildDrawerItem(Icons.wallet, 'Payment', () {}),
              buildDrawerItem(Icons.logout, "Logout", () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      dense: true,
      leading: Icon(icon, color: const Color.fromARGB(255, 172, 79, 79)),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      horizontalTitleGap: 10,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      onTap: onTap,
    );
  }
}
