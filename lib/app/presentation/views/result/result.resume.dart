import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hipoteca/app/domain/mortgage_provider.dart';
import 'package:hipoteca/app/presentation/views/result/widgets/mortgage_detail_item.dart';
import 'package:hipoteca/src/styles/colors/colors.dart';

class ResumenView extends StatelessWidget {
  const ResumenView({super.key});

  @override
  Widget build(BuildContext context) {
    final mortgageProvider = Provider.of<MortgageProvider>(context);
    final summary = mortgageProvider.summary;

    if (summary == null) {
      return const Center(
          child: Text("No hay datos disponibles",
              style: TextStyle(color: Colors.white)));
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          const Text(
            "Tu cuota mensual es",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            mortgageProvider.formatCurrency(summary.monthlyPayment),
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "financiado en ${mortgageProvider.loanPeriodYears.toInt()} años",
            style: const TextStyle(fontSize: 16, color: Colors.white70),
          ),
          const SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                MortgageDetailItem(
                  texto: "Interés total:",
                  valor: mortgageProvider.formatCurrency(summary.totalInterest),
                ),
                MortgageDetailItem(
                  texto: "Pago total vivienda:",
                  valor: mortgageProvider.formatCurrency(summary.totalPayment),
                ),
                MortgageDetailItem(
                  texto: "Valor vivienda:",
                  valor: mortgageProvider
                      .formatCurrency(mortgageProvider.homeValue),
                ),
                MortgageDetailItem(
                  texto: "Cuota inicial:",
                  valor: mortgageProvider
                      .formatCurrency(mortgageProvider.downPayment),
                ),
                MortgageDetailItem(
                  texto: "Valor préstamo:",
                  valor: mortgageProvider.formatCurrency(summary.loanAmount),
                ),
                MortgageDetailItem(
                  texto: "Tasa interés:",
                  valor: "${mortgageProvider.interestRate}%",
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
