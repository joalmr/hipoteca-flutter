import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hipoteca/app/presentation/views/home/widgets/card.calcule.dart';
import 'package:hipoteca/app/presentation/views/home/widgets/titulo_calcule.dart';
import 'package:hipoteca/app/presentation/views/result/result.dart';
import 'package:hipoteca/app/presentation/widgets/button/primary.button.dart';
import 'package:hipoteca/app/presentation/widgets/textformfield/input.widget.dart';
import 'package:hipoteca/main.dart';
import 'package:hipoteca/src/styles/colors/colors.dart';

class CalculeView extends StatefulWidget {
  const CalculeView({super.key});

  @override
  State<CalculeView> createState() => _CalculeViewState();
}

class _CalculeViewState extends State<CalculeView> {
  TextEditingController valorCtr = TextEditingController();
  TextEditingController inicialCtr = TextEditingController();
  TextEditingController interesCtr = TextEditingController();

  final money = TextInputMask(
    mask: '9+,999,999.99',
    placeholder: '0',
    maxPlaceHolders: 3,
    reverse: true,
    maxLength: 14,
  );
  final interes = TextInputMask(
    mask: '9+.99',
    placeholder: '0',
    maxPlaceHolders: 3,
    reverse: true,
    maxLength: 5,
  );

  @override
  Widget build(BuildContext context) {
    final calculeLogic = MyInheretedWidget.of(context)!.calculeLogic;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                height: double.maxFinite,
                width: double.maxFinite,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      TituloCalcule(),
                      SizedBox(height: 20),
                      SizedBox(height: 20),
                      TextFormInput(
                        labelText: "Valor de la vivienda",
                        controller: valorCtr,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          money,
                          LengthLimitingTextInputFormatter(14),
                        ],
                        suffix: Tooltip(
                          message:
                              "Valor de la vivienda: Precio del inmueble a comprar",
                          child: Container(
                            child: Icon(
                              Icons.info_outline,
                              color: kTextColor,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 18),
                        child: TextFormInput(
                          labelText: "Cuota inicial",
                          controller: inicialCtr,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            money,
                            LengthLimitingTextInputFormatter(14),
                          ],
                          suffix: Tooltip(
                            message:
                                "Cuota Inicial: Pago por adelantado de una parte del valor de la vivienda",
                            child: Container(
                              child: Icon(
                                Icons.info_outline,
                                color: kTextColor,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 18),
                        child: GestureDetector(
                          child: TextFormInput(
                            labelText: "Tasa de interés",
                            controller: interesCtr,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              interes,
                              LengthLimitingTextInputFormatter(5)
                            ],
                            suffix: Tooltip(
                              message:
                                  "Tasa de interés: Tasa del crédito hipotecario que ofrece la entidad financiera",
                              child: Container(
                                child: Text(
                                  "%",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 18, right: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: Text("Periodos en años"),
                            ),
                            SizedBox(height: 8),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: AnimatedBuilder(
                                animation: calculeLogic,
                                builder: (context, child) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () => calculeLogic.opcPeriodo(5),
                                        child: CardCalcule(
                                          periodo: calculeLogic.periodo == 5,
                                          numero: 5,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () =>
                                            calculeLogic.opcPeriodo(10),
                                        child: CardCalcule(
                                          periodo: calculeLogic.periodo == 10,
                                          numero: 10,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () =>
                                            calculeLogic.opcPeriodo(15),
                                        child: CardCalcule(
                                          periodo: calculeLogic.periodo == 15,
                                          numero: 15,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () =>
                                            calculeLogic.opcPeriodo(20),
                                        child: CardCalcule(
                                          periodo: calculeLogic.periodo == 20,
                                          numero: 20,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () =>
                                            calculeLogic.opcPeriodo(25),
                                        child: CardCalcule(
                                          periodo: calculeLogic.periodo == 25,
                                          numero: 25,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () =>
                                            calculeLogic.opcPeriodo(30),
                                        child: CardCalcule(
                                          periodo: calculeLogic.periodo == 30,
                                          numero: 30,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
                bottom: 24,
                top: 18,
              ),
              child: ButtonPrimary(
                text: "Calcular",
                onPressed: () {
                  if (valorCtr.text.isEmpty ||
                      inicialCtr.text.isEmpty ||
                      interesCtr.text.isEmpty) {
                    const snackBar = SnackBar(
                      backgroundColor: Color(0xFFbf3a2b),
                      content: Text('Ingrese todos los campos'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    String val1 = valorCtr.text.replaceAll(',', '');
                    String val2 = inicialCtr.text.replaceAll(',', '');
                    calculeLogic.valor = double.parse(val1);
                    calculeLogic.inicial = double.parse(val2);

                    calculeLogic.interes = num.parse(interesCtr.text);

                    if (calculeLogic.inicial > calculeLogic.valor) {
                      const snackBar = SnackBar(
                        backgroundColor: Color(0xFFbf3a2b),
                        content: Text(
                            'La cuota inicial debe ser menor al valor de la vivienda'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    if (calculeLogic.interes == 0) {
                      const snackBar = SnackBar(
                        backgroundColor: Color(0xFFbf3a2b),
                        content: Text('Interés debe ser mayor a 0'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      calculeLogic.calculos();
                      calculeLogic.tablaPagos();

                      Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (_) => ResultView(),
                        ),
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
