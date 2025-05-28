import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/colors/app_color.dart';

import '../../../../../res/themes/app_themes.dart';
import '../../../../../utils/utils.dart';


class AnalyticsChartWidget extends StatelessWidget {
  const AnalyticsChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * Utils.getResponsiveHeight(228),
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * Utils.getResponsiveWidth(16),
      ),
      child: LineChart(
        LineChartData(
          minY: 0,
          maxY: 40,
          lineTouchData: LineTouchData(enabled: false),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 10,
            verticalInterval: 43,
            getDrawingHorizontalLine:
                (value) => FlLine(
                  color: Theme.of(context).dividerColor,
                  strokeWidth: 1,
                ),
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: TextStyle(
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textBodyColor,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w400,
                      fontSize: Get.height * Utils.getResponsiveSize(12),
                    ),
                  );
                },
                interval: 10,
                reservedSize: 30,
              ),
            ),
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 13),
                FlSpot(0.3, 14),
                FlSpot(0.9, 11),
                FlSpot(1.4, 13),
                FlSpot(1.9, 12),
                FlSpot(3, 23),
                FlSpot(4, 18),
                FlSpot(6, 31),
                FlSpot(7, 29),
                FlSpot(8, 32),
              ],
              isCurved: true,
              curveSmoothness: 0.4, // More natural waves
              color: AppColor.primaryColor,
              barWidth: 2,
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColor.primaryWith30Per,
                    AppColor.primaryChartColorWith0Per,
                  ],
                  stops: [0.0, 1.0], // Gradient only below line
                ),
                cutOffY: 0, // Gradient stops at Y=0
              ),
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
