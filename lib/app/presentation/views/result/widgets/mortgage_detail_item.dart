import 'package:flutter/material.dart';
import 'package:hipoteca/src/styles/colors/colors.dart';

class MortgageDetailItem extends StatelessWidget {
  final String texto;
  final String valor;
  const MortgageDetailItem({
    super.key,
    required this.texto,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                const Icon(
                  Icons.monetization_on_outlined,
                  color: kTextColor,
                ),
                const SizedBox(width: 5),
                Flexible(
                  child: Text(
                    texto,
                    style: const TextStyle(
                      color: kTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            valor,
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
