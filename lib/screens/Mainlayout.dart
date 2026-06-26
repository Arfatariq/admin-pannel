import 'package:admin_pannel/screens/Menupage.dart';
import 'package:admin_pannel/screens/all_users.dart';
import 'package:admin_pannel/screens/analyticspage.dart';
import 'package:admin_pannel/screens/dashboard.dart';
import 'package:admin_pannel/screens/orders_history.dart';
import 'package:admin_pannel/screens/payment.dart';
import 'package:admin_pannel/screens/widgets/tables.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  bool isCollapsed = false;
  int selectedIndex = 0;

  final List<Widget> pages = [
    const DashboardPage(),
    const AllUsersScreen(),
    const MenuPage(),
    const Tables(),
    const Orderhistorypage(),
    const AnalyticsDashboard(),
    const PaymentScreen(),
    const Center(child: Text("Logout Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isCollapsed ? 80 : 200,
            color: const Color.fromARGB(255, 253, 206, 182),
            child: Column(
              children: [
                const SizedBox(height: 40),
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black),
                  onPressed: () {
                    setState(() {
                      isCollapsed = !isCollapsed;
                    });
                  },
                ),
                const SizedBox(height: 20),
                buildDrawerItem(Icons.dashboard, "Dashboard", 0),
                buildDrawerItem(Icons.person, "Users", 1),
                buildDrawerItem(Icons.food_bank, "Menu", 2),
                buildDrawerItem(Icons.table_bar, "Tables", 3),
                buildDrawerItem(Icons.shopping_basket_sharp, "Orders", 4),
                buildDrawerItem(Icons.settings, "Analytics", 5),
                buildDrawerItem(Icons.wallet, "Payment", 6),
                buildDrawerItem(Icons.logout, "Logout", 7),
              ],
            ),
          ),

          // Main content
          Expanded(child: pages[selectedIndex]),
        ],
      ),
    );
  }

  Widget buildDrawerItem(IconData icon, String title, int index) {
    return ListTile(
      leading: Icon(icon),
      title: isCollapsed ? null : Text(title),
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }
}
