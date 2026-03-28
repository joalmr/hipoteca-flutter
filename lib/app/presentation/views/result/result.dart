import 'package:flutter/material.dart';
import 'package:hipoteca/app/presentation/views/result/result.graphic.dart';
import 'package:hipoteca/app/presentation/views/result/result.resume.dart';
import 'package:hipoteca/app/presentation/views/result/result.table.dart';
import 'package:hipoteca/src/styles/colors/colors.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          bottom: TabBar(
            indicatorColor: kPrimaryColor,
            labelColor: kPrimaryColor,
            unselectedLabelColor: Colors.white,
            tabs: const [
              Tab(text: "Resumen"),
              Tab(text: "Tabla"),
              Tab(text: "Gráfico"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ResumenView(),
            TableView(),
            GraphicView(),
          ],
        ),
      ),
    );
  }
}
