import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hipoteca/app/domain/mortgage_provider.dart';
import 'package:hipoteca/src/styles/colors/colors.dart';

class TableView extends StatelessWidget {
  const TableView({super.key});

  @override
  Widget build(BuildContext context) {
    final mortgageProvider = Provider.of<MortgageProvider>(context);
    final summary = mortgageProvider.summary;

    if (summary == null) {
      return const Center(
          child: Text("No hay datos disponibles",
              style: TextStyle(color: Colors.white)));
    }

    return SafeArea(
      top: false,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 18),
            child: Text(
              "Tabla de amortización anual",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: const Row(
              children: [
                _HeaderCell("Año"),
                _HeaderCell("Cuota Anual"),
                _HeaderCell("Interés"),
                _HeaderCell("Saldo"),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              itemCount: summary.amortizationTable.length,
              itemBuilder: (context, index) {
                final yearData = summary.amortizationTable[index];
                final isLast = index == summary.amortizationTable.length - 1;

                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  decoration: BoxDecoration(
                    color: index % 2 == 0
                        ? Colors.white.withValues(alpha: 0.05)
                        : Colors.transparent,
                    border: Border(
                      bottom: BorderSide(
                          color: Colors.white12, width: isLast ? 0 : 0.5),
                    ),
                  ),
                  child: Row(
                    children: [
                      _DataCell(yearData.year.toString(), isMain: true),
                      _DataCell(mortgageProvider
                          .formatCurrency(yearData.annualPayment)),
                      _DataCell(mortgageProvider
                          .formatCurrency(yearData.interestPaid)),
                      _DataCell(mortgageProvider
                          .formatCurrency(yearData.remainingBalance)),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 4)
        ],
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String text;
  const _HeaderCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}

class _DataCell extends StatelessWidget {
  final String text;
  final bool isMain;
  const _DataCell(this.text, {this.isMain = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 11,
          color: isMain ? kPrimaryColor : Colors.white,
          fontWeight: isMain ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
