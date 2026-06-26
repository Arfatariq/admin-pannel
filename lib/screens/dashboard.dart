import 'package:admin_pannel/components/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const GoMealApp());
}

class GoMealApp extends StatelessWidget {
  const GoMealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // AnimatedContainer(
          //   duration: const Duration(milliseconds: 300),
          //   width: isCollapsed ? 80 : 200,
          //   color: const Color.fromARGB(255, 253, 206, 182),
          //   child: MediaQuery.removeViewPadding(
          //     context: context,
          //     removeTop: true,
          //     child: SizedBox(
          //       height: MediaQuery.of(context).size.height,
          //       child: SingleChildScrollView(
          //         child: Column(
          //           children: [
          //             const SizedBox(
          //                 height: 40), // Give top space for aesthetics
          //             IconButton(
          //               icon: const Icon(Icons.menu,
          //                   color: MyAppColors.iconColor),
          //               onPressed: () {
          //                 setState(() {
          //                   isCollapsed = !isCollapsed;
          //                 });
          //               },
          //             ),
          //             const SizedBox(height: 20),
          //             buildDrawerItem(Icons.dashboard, "Dashboard", () {
          //               Navigator.pushReplacement(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => const DashboardPage()),
          //               );
          //             }),
          //             buildDrawerItem(Icons.person, 'Users', () {
          //               Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => const AllUsersScreen()),
          //               );
          //             }),
          //             buildDrawerItem(Icons.food_bank, "Menu", () {
          //               Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => const Menupage()),
          //               );
          //             }),
          //             buildDrawerItem(Icons.table_bar, "Tables", () {
          //               Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => const Tables()),
          //               );
          //             }),
          //             buildDrawerItem(Icons.shopping_basket_sharp, "Orders",
          //                 () {
          //               Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => const Orderhistorypage()),
          //               );
          //             }),
          //             buildDrawerItem(Icons.settings, 'Settings', () {
          //               Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => const AnalyticsDashboard()),
          //               );
          //             }),
          //             buildDrawerItem(Icons.wallet, 'Payment', () {}),
          //             buildDrawerItem(Icons.logout, "Logout", () {}),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          // Center Panel  ─────────────────────────────────────────────
          Expanded(
            child: Container(
              color: MyAppColors.backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    color:
                        MyAppColors.iconColor, // your topbar background color
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 45,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: const [
                                Icon(Icons.search, color: Colors.grey),
                                SizedBox(width: 10),
                                Text("Search...",
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(width: 20),

                        ...[
                          Icons.notifications,
                          Icons.message,
                          Icons.info,
                        ].map((icon) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(icon, color: Colors.white),
                              ),
                            )),

                        const SizedBox(width: 15),

                        //  Vertical Line Separator
                        Container(
                          width: 1,
                          height: 40,
                          color: Colors.white24,
                        ),

                        const SizedBox(width: 15),

                        Row(
                          children: const [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.person,
                                  color: MyAppColors.iconColor),
                            ),
                            SizedBox(width: 10),
                            Text("Admin",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ),

                  //  Main content below
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 100,
                                width: 280,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Total Menu',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            '25', // You can update this number dynamically
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              CircularProgressIndicator(
                                                value: 0.75,
                                                strokeWidth: 5,
                                                backgroundColor:
                                                    Colors.grey.shade300,
                                                valueColor:
                                                    const AlwaysStoppedAnimation<
                                                            Color>(
                                                        Colors.blueAccent),
                                              ),
                                              const Icon(
                                                Icons.menu,
                                                color: Colors.blueAccent,
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                height: 100,
                                width: 280,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Total Menu',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            '25',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              CircularProgressIndicator(
                                                value: 0.75,
                                                strokeWidth: 5,
                                                backgroundColor:
                                                    Colors.grey.shade300,
                                                valueColor:
                                                    const AlwaysStoppedAnimation<
                                                            Color>(
                                                        Colors.blueAccent),
                                              ),
                                              const Icon(
                                                Icons.menu,
                                                color: Colors.blueAccent,
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 130,
                                    width: 280,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                'Total users',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                '190', // You can update this number dynamically
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                right: 16),
                                            child: SizedBox(
                                              height: 100,
                                              width: 100,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  CircularProgressIndicator(
                                                    value:
                                                        0.75, // 75% filled (change as needed)
                                                    strokeWidth: 5,
                                                    backgroundColor:
                                                        Colors.grey.shade300,
                                                    valueColor:
                                                        const AlwaysStoppedAnimation<
                                                            Color>(
                                                      MyAppColors.primary,
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons.person,
                                                    color:
                                                        MyAppColors.iconColor,
                                                    size: 20,
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 110,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                'Total Menu',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                '25', // You can update this number dynamically
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                right: 16),
                                            child: SizedBox(
                                              height: 130,
                                              width: 100,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: const [
                                                  CircularProgressIndicator(
                                                    value: 0.65,
                                                    strokeWidth: 5,
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 224, 224, 224),
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                                Color>(
                                                            MyAppColors
                                                                .primary),
                                                  ),
                                                  Icon(
                                                    Icons.menu,
                                                    color:
                                                        MyAppColors.iconColor,
                                                    size: 20,
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      height: 200,
                                      width: 650,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                            color:
                                                Color.fromARGB(31, 242, 76, 42),
                                            blurRadius: 4,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: LineChart(
                                          LineChartData(
                                            minX: 0,
                                            maxX: 6,
                                            minY: 0,
                                            maxY: 100,
                                            titlesData: FlTitlesData(
                                              leftTitles: AxisTitles(
                                                sideTitles: SideTitles(
                                                  showTitles: true,
                                                  reservedSize:
                                                      30, // make space for y-axis numbers
                                                  interval: 20,
                                                  getTitlesWidget: (value, _) =>
                                                      Text(
                                                    value.toInt().toString(),
                                                    style: const TextStyle(
                                                        fontSize: 10),
                                                  ),
                                                ),
                                              ),
                                              bottomTitles: AxisTitles(
                                                sideTitles: SideTitles(
                                                  showTitles: true,
                                                  interval:
                                                      1, // Show exactly one label per spot
                                                  getTitlesWidget: (value, _) {
                                                    const days = [
                                                      'Mon',
                                                      'Tue',
                                                      'Wed',
                                                      'Thu',
                                                      'Fri',
                                                      'Sat',
                                                      'Sun',
                                                    ];
                                                    if (value >= 0 &&
                                                        value < days.length) {
                                                      return SideTitleWidget(
                                                        axisSide:
                                                            AxisSide.bottom,
                                                        space: 0,
                                                        child: Text(
                                                          days[value.toInt()],
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 10),
                                                        ),
                                                      );
                                                    }
                                                    return const SizedBox
                                                        .shrink();
                                                  },
                                                ),
                                              ),
                                              topTitles: AxisTitles(
                                                  sideTitles: SideTitles(
                                                      showTitles: false)),
                                              rightTitles: AxisTitles(
                                                  sideTitles: SideTitles(
                                                      showTitles: false)),
                                            ),
                                            gridData: FlGridData(
                                              show: true,
                                              drawVerticalLine: false,
                                              horizontalInterval: 16,
                                            ),
                                            borderData:
                                                FlBorderData(show: false),
                                            lineBarsData: [
                                              LineChartBarData(
                                                spots: const [
                                                  FlSpot(0, 20),
                                                  FlSpot(1, 30),
                                                  FlSpot(2, 25),
                                                  FlSpot(3, 40),
                                                  FlSpot(4, 50),
                                                  FlSpot(5, 60),
                                                  FlSpot(6, 90),
                                                ],
                                                isCurved: true,
                                                color: MyAppColors.iconColor,
                                                barWidth: 3,
                                                dotData: FlDotData(show: true),
                                                belowBarData: BarAreaData(
                                                  show: true,
                                                  color: const Color.fromARGB(
                                                          255, 235, 141, 91)
                                                      .withOpacity(0.2),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 200,
                                    width: 680,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Top Rated Items",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Expanded(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: [
                                                  topItemCard(
                                                      "Burger",
                                                      "https://media.istockphoto.com/id/459396345/photo/taco.jpg?s=612x612&w=0&k=20&c=_yCtd6OEb2L8xNal4kC1xvm8HoBp8sry6tcBwmxmPHw=",
                                                      "4.9"),
                                                  const SizedBox(width: 12),
                                                  topItemCard(
                                                      "Pizza",
                                                      "https://media.istockphoto.com/id/459396345/photo/taco.jpg?s=612x612&w=0&k=20&c=_yCtd6OEb2L8xNal4kC1xvm8HoBp8sry6tcBwmxmPHw=",
                                                      "4.8"),
                                                  const SizedBox(width: 12),
                                                  topItemCard(
                                                      "Fries",
                                                      "https://media.istockphoto.com/id/459396345/photo/taco.jpg?s=612x612&w=0&k=20&c=_yCtd6OEb2L8xNal4kC1xvm8HoBp8sry6tcBwmxmPHw=",
                                                      "4.7"),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
// Right Panel
          Container(
            width: 280,
            color: const Color.fromARGB(255, 253, 206, 182),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Summary",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                _buildInfoTile(
                    "Total Sale", "\$254.90", Icons.attach_money, Colors.green),
                const SizedBox(height: 12),
                _buildInfoTile(
                    "Total Orders", "6", Icons.shopping_bag, Colors.orange),
                const SizedBox(height: 12),
                _buildInfoTile(
                    "Total Sessions", "845", Icons.timeline, Colors.blue),
                const SizedBox(height: 12),
                _buildInfoTile(
                    "Customer Rate", "5.12%", Icons.person, Colors.purple),
                const SizedBox(height: 30),
                const Text("Recent Activity",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView(
                    children: [
                      _buildActivityItem(" 10:10", "Order #123 completed"),
                      _buildActivityItem(" 09:45", "New user registered"),
                      _buildActivityItem(" 09:00", "Payment received"),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfoTile(
      String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(fontSize: 14, color: Colors.grey)),
              Text(value,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String time, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(width: 8),
          Expanded(
              child: Text(description, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }

  Widget topItemCard(String title, String imagePath, String rating) {
    return Container(
      width: 160,
      height: 200,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 240, 184, 93),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            imagePath,
            height: 90,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 13,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 12),
                  const SizedBox(width: 3),
                  Text(
                    rating,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      dense: true,
      leading: Icon(icon, color: MyAppColors.iconColor),
      title: isCollapsed
          ? null
          : Text(
              title,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
      horizontalTitleGap: 10,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      onTap: onTap,
    );
  }
}
