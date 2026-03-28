import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:hipoteca/app/presentation/views/home/calculator_view.dart';
import 'package:hipoteca/app/presentation/widgets/button/primary.button.dart';
import 'package:hipoteca/src/styles/colors/colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Calcula el",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "costo real de",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                    EasyRichText(
                      "tu nuevo hogar",
                      defaultStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 48,
                        color: Colors.white,
                      ),
                      patternList: [
                        EasyRichTextPattern(
                          targetString: 'nuevo hogar',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 48,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ButtonPrimary(
                text: "Continuar",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const CalculatorView(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
