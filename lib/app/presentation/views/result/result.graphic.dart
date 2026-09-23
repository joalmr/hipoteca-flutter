import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hipoteca/app/domain/mortgage_provider.dart';
import 'package:hipoteca/app/presentation/views/result/widgets/chart_legend_item.dart';
import 'package:hipoteca/src/styles/colors/colors.dart';

class GraphicView extends StatelessWidget {
  const GraphicView({super.key});

  @override
  Widget build(BuildContext context) {
    final mortgageProvider = Provider.of<MortgageProvider>(context);
    final summary = mortgageProvider.summary;

    if (summary == null) {
      return const Center(
          child: Text("No hay datos disponibles",
              style: TextStyle(color: Colors.white)));
    }

    return Column(
      children: [
        const SizedBox(height: 32),
        PieChartSample3(
          interesTotal: summary.totalInterest,
          valorPrestamo: summary.loanAmount,
          pagoTotal: summary.totalPayment,
        ),
        const SizedBox(height: 32),
        ChartLegendItem(
          texto: "Interés total:",
          valor: mortgageProvider.formatCurrency(summary.totalInterest),
          color: kPrimaryColor,
        ),
        ChartLegendItem(
          texto: "Valor préstamo:",
          valor: mortgageProvider.formatCurrency(summary.loanAmount),
          color: Colors.white,
        ),
      ],
    );
  }
}

class PieChartSample3 extends StatefulWidget {
  final double interesTotal;
  final double valorPrestamo;
  final double pagoTotal;

  const PieChartSample3({
    super.key,
    required this.interesTotal,
    required this.valorPrestamo,
    required this.pagoTotal,
  });

  @override
  State<StatefulWidget> createState() => PieChartSample3State();
}

class PieChartSample3State extends State<PieChartSample3> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(
            touchCallback: (FlTouchEvent event, pieTouchResponse) {
              setState(() {
                if (!event.isInterestedForInteractions ||
                    pieTouchResponse == null ||
                    pieTouchResponse.touchedSection == null) {
                  touchedIndex = -1;
                  return;
                }
                touchedIndex =
                    pieTouchResponse.touchedSection!.touchedSectionIndex;
              });
            },
          ),
          borderData: FlBorderData(show: false),
          sectionsSpace: 0,
          centerSpaceRadius: 0,
          sections: showingSections(),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    final porcInteres = widget.interesTotal / widget.pagoTotal;
    final procPrestamo = widget.valorPrestamo / widget.pagoTotal;

    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 24.0 : 18.0;
      final radius = isTouched ? 120.0 : 110.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 4)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: kPrimaryColor,
            value: porcInteres,
            title: '${(porcInteres * 100).toStringAsFixed(0)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.white24,
            value: procPrestamo,
            title: '${(procPrestamo * 100).toStringAsFixed(0)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        default:
          throw Exception('Invalid index');
      }
    });
  }
}
