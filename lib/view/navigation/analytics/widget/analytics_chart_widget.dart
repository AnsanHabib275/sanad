import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import '../../../../res/themes/app_themes.dart';
import '../../../../utils/utils.dart';

class AnalyticsChartWidget extends StatelessWidget {
  const AnalyticsChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * Utils.getResponsiveHeight(228),
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * Utils.getResponsiveWidth(16),
      ),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 40,
          barTouchData: BarTouchData(enabled: false),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Text(
                    '',
                    style: TextStyle(
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textBodyColor,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w400,
                      fontSize: Get.height * Utils.getResponsiveSize(12),
                    ),
                  ); // Empty X-axis labels
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Text(value.toInt().toString());
                },
                interval: 10,
                reservedSize: 30,
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 10,
            getDrawingHorizontalLine:
                (value) => FlLine(
                  color: Theme.of(context).dividerColor,
                  strokeWidth: 1,
                ),
          ),
          borderData: FlBorderData(show: false),
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                  toY: 40,
                  color: Colors.blue,
                  width: 20,
                  borderRadius: BorderRadius.zero,
                ),
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  toY: 30,
                  color: Colors.blue,
                  width: 20,
                  borderRadius: BorderRadius.zero,
                ),
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                  toY: 20,
                  color: Colors.blue,
                  width: 20,
                  borderRadius: BorderRadius.zero,
                ),
              ],
            ),
            BarChartGroupData(
              x: 3,
              barRods: [
                BarChartRodData(
                  toY: 10,
                  color: Colors.blue,
                  width: 20,
                  borderRadius: BorderRadius.zero,
                ),
              ],
            ),
            BarChartGroupData(
              x: 4,
              barRods: [
                BarChartRodData(
                  toY: 0,
                  color: Colors.blue,
                  width: 20,
                  borderRadius: BorderRadius.zero,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
