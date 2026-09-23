import 'package:flutter/material.dart';
import 'package:hipoteca/src/styles/colors/colors.dart';

class PeriodCard extends StatelessWidget {
  final int numero;
  final bool periodo;
  const PeriodCard({super.key, required this.numero, required this.periodo});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 42,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: periodo ? kPrimaryColor : kTextColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          numero.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: kBackgroundColor,
          ),
        ),
      ),
    );
  }
}
