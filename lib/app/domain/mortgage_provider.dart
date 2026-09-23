import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'mortgage_models.dart';

class MortgageProvider extends ChangeNotifier {
  // Input fields
  double homeValue = 0;
  double downPayment = 0;
  double loanPeriodYears = 5;
  double interestRate = 0;

  // Calculation results
  MortgageSummary? _summary;
  MortgageSummary? get summary => _summary;

  void setPeriod(double years) {
    loanPeriodYears = years;
    notifyListeners();
  }

  void calculate() {
    final loanAmount = homeValue - downPayment;
    if (loanAmount <= 0 || interestRate <= 0) return;

    final monthlyRate = (interestRate / 100) / 12;
    final totalMonths = loanPeriodYears * 12;

    final monthlyPayment = (loanAmount * monthlyRate) / (1 - pow(1 + monthlyRate, -totalMonths));
    final totalPayment = monthlyPayment * totalMonths;
    final totalInterest = totalPayment - loanAmount;

    // Generate amortization table
    final amortizationTable = _generateAmortizationTable(
      loanAmount: loanAmount,
      monthlyPayment: monthlyPayment,
      monthlyRate: monthlyRate,
      years: loanPeriodYears.toInt(),
    );

    _summary = MortgageSummary(
      monthlyPayment: monthlyPayment,
      totalInterest: totalInterest,
      totalPayment: totalPayment,
      loanAmount: loanAmount,
      amortizationTable: amortizationTable,
    );

    notifyListeners();
  }

  List<AmortizationYear> _generateAmortizationTable({
    required double loanAmount,
    required double monthlyPayment,
    required double monthlyRate,
    required int years,
  }) {
    List<AmortizationYear> table = [];
    double currentBalance = loanAmount;

    for (int year = 1; year <= years; year++) {
      double annualInterest = 0;
      double annualPrincipal = 0;

      for (int month = 1; month <= 12; month++) {
        double interestForMonth = currentBalance * monthlyRate;
        double principalForMonth = monthlyPayment - interestForMonth;
        
        annualInterest += interestForMonth;
        annualPrincipal += principalForMonth;
        currentBalance -= principalForMonth;
      }

      table.add(AmortizationYear(
        year: year,
        annualPayment: monthlyPayment * 12,
        interestPaid: annualInterest,
        principalPaid: annualPrincipal,
        remainingBalance: currentBalance > 0 ? currentBalance : 0,
      ));
    }

    return table;
  }

  // Formatting utilities (can stay here for convenience or move to a separate helper)
  String formatCurrency(double amount) {
    return NumberFormat.simpleCurrency(locale: 'en_US').format(amount);
  }
}
