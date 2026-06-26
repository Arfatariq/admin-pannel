import 'package:admin_pannel/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalyticsDashboard extends StatelessWidget {
  const AnalyticsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Analytics ',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: "Search...",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Stats Cards
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatCard("Total Revenue", "\$4,562", "+12%"),
                      _buildStatCard("Total Visitors", "2,562", "+4%"),
                      _buildStatCard("Total Orders", "2,262", "-0.89%"),
                      _buildStatCard("Total Items", "2,100", "+2%"),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Charts & Funnels
                  Expanded(
                    child: Row(
                      children: [
                        // Sales Bar Chart
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Total Sales",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(height: 10),
                                Expanded(
                                  child: BarChart(
                                    BarChartData(
                                      barGroups: List.generate(7, (index) {
                                        return BarChartGroupData(
                                            x: index,
                                            barRods: [
                                              BarChartRodData(
                                                toY: (index + 1) * 10.0,
                                                color: MyAppColors.iconColor,
                                                width: 14,
                                                borderSide: BorderSide.none,
                                              )
                                            ]);
                                      }),
                                      borderData: FlBorderData(show: false),
                                      gridData: FlGridData(show: true),
                                      titlesData: FlTitlesData(
                                        leftTitles: AxisTitles(),
                                        rightTitles: AxisTitles(),
                                        topTitles: AxisTitles(),
                                        bottomTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: true,
                                            getTitlesWidget: (value, meta) {
                                              const days = [
                                                "Mon",
                                                "Tue",
                                                "Wed",
                                                "Thu",
                                                "Fri",
                                                "Sat",
                                                "Sun"
                                              ];
                                              return Text(
                                                  days[value.toInt() % 7]);
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(width: 20),

                        // Pie Chart with external legend
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Sales by Food Category",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(height: 10),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: SizedBox(
                                            height:
                                                150, // Adjust this height as needed
                                            width:
                                                150, // Adjust this width as needed
                                            child: PieChart(
                                              PieChartData(
                                                sections: [
                                                  PieChartSectionData(
                                                    value: 30,
                                                    color: Colors.orange,
                                                    showTitle: false,
                                                  ),
                                                  PieChartSectionData(
                                                    value: 40,
                                                    color: Color.fromARGB(
                                                        255, 243, 89, 33),
                                                    showTitle: false,
                                                  ),
                                                  PieChartSectionData(
                                                    value: 30,
                                                    color: Color.fromARGB(
                                                        255, 252, 150, 130),
                                                    showTitle: false,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: const [
                                              LegendItem(
                                                  color: Colors.orange,
                                                  text: "Pizza (30%)"),
                                              LegendItem(
                                                  color: Color.fromARGB(
                                                      255, 243, 89, 33),
                                                  text: "Burgers (40%)"),
                                              LegendItem(
                                                  color: Color.fromARGB(
                                                      255, 252, 150, 130),
                                                  text: "Drinks (30%)"),
                                            ],
                                          ),
                                        ),
                                      ),

                                      // Legend
                                    ],
                                  ),
                                )
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
          )
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, String percent) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(value,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(percent,
                style: TextStyle(
                    color: percent.contains("-") ? Colors.red : Colors.green)),
          ],
        ),
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const LegendItem({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          margin: const EdgeInsets.only(right: 8, bottom: 8),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
