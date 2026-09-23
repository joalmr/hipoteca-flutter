class AmortizationYear {
  final int year;
  final double annualPayment;
  final double interestPaid;
  final double principalPaid;
  final double remainingBalance;

  AmortizationYear({
    required this.year,
    required this.annualPayment,
    required this.interestPaid,
    required this.principalPaid,
    required this.remainingBalance,
  });
}

class MortgageSummary {
  final double monthlyPayment;
  final double totalInterest;
  final double totalPayment;
  final double loanAmount;
  final List<AmortizationYear> amortizationTable;

  MortgageSummary({
    required this.monthlyPayment,
    required this.totalInterest,
    required this.totalPayment,
    required this.loanAmount,
    required this.amortizationTable,
  });
}
