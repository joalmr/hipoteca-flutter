import 'package:flutter/material.dart';
// import 'package:hipoteca/app/presentation/views/ads.dart';
import 'package:hipoteca/app/presentation/views/result/result.graphic.dart';
import 'package:hipoteca/app/presentation/views/result/result.resume.dart';
import 'package:hipoteca/app/presentation/views/result/result.table.dart';
import 'package:hipoteca/src/styles/colors/colors.dart';

class ResultView extends StatefulWidget {
  ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  num segmentoCuota = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(top: 20, left: 32, right: 32),
              height: 42,
              decoration: BoxDecoration(
                color: kTextColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      segmentoCuota = 0;
                    }),
                    child: Container(
                      height: double.maxFinite,
                      margin: EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: segmentoCuota == 0 ? kPrimaryColor : null,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Center(
                        child: Text(
                          "Resumen",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kBackgroundColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      segmentoCuota = 1;
                    }),
                    child: Container(
                      height: double.maxFinite,
                      margin: EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: segmentoCuota == 1 ? kPrimaryColor : null,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Center(
                        child: Text(
                          "Tabla",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kBackgroundColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      segmentoCuota = 2;
                    }),
                    child: Container(
                      height: double.maxFinite,
                      margin: EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: segmentoCuota == 2 ? kPrimaryColor : null,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Center(
                        child: Text(
                          "Gráfico",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kBackgroundColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: segmentoCuota == 0
                  ? ResumenView()
                  : segmentoCuota == 1
                      ? TableView()
                      : GraphicView(),
            ),
          ],
        ),
      ),
    );
  }
}
