import 'package:flutter/material.dart';

class ChartLegendItem extends StatelessWidget {
  final String texto;
  final String valor;
  final Color? color;
  const ChartLegendItem({
    super.key,
    required this.texto,
    required this.valor,
    this.color,
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
                Icon(
                  Icons.monetization_on_outlined,
                  color: color,
                ),
                const SizedBox(width: 5),
                Flexible(
                  child: Text(
                    texto,
                    style: TextStyle(
                      color: color,
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
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
