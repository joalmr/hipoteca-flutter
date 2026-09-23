import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hipoteca/app/presentation/views/home/widgets/calculator_header.dart';
import 'package:hipoteca/app/presentation/views/home/widgets/period_card.dart';
import 'package:provider/provider.dart';
import 'package:hipoteca/app/domain/mortgage_provider.dart';

import 'package:hipoteca/app/presentation/views/result/result.dart';
import 'package:hipoteca/app/presentation/widgets/button/primary.button.dart';
import 'package:hipoteca/app/presentation/widgets/textformfield/input.widget.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController valorCtr = TextEditingController();
  final TextEditingController inicialCtr = TextEditingController();
  final TextEditingController interesCtr = TextEditingController();

  final moneyMask = TextInputMask(
    mask: '9+,999,999.99',
    placeholder: '0',
    maxPlaceHolders: 3,
    reverse: true,
    maxLength: 14,
  );

  final interestMask = TextInputMask(
    mask: '9+.99',
    placeholder: '0',
    maxPlaceHolders: 3,
    reverse: true,
    maxLength: 5,
  );

  @override
  void dispose() {
    valorCtr.dispose();
    inicialCtr.dispose();
    interesCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mortgageProvider = Provider.of<MortgageProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const CalculatorHeader(),
                        const SizedBox(height: 40),
                        TextFormInput(
                          labelText: "Valor de la vivienda",
                          controller: valorCtr,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            moneyMask,
                            LengthLimitingTextInputFormatter(14),
                          ],
                          suffix: const Tooltip(
                            message: "Precio del inmueble a comprar",
                            child: Icon(Icons.info_outline,
                                color: Colors.white, size: 24),
                          ),
                        ),
                        const SizedBox(height: 18),
                        TextFormInput(
                          labelText: "Cuota inicial",
                          controller: inicialCtr,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            moneyMask,
                            LengthLimitingTextInputFormatter(14),
                          ],
                          suffix: const Tooltip(
                            message: "Pago por adelantado",
                            child: Icon(Icons.info_outline,
                                color: Colors.white, size: 24),
                          ),
                        ),
                        const SizedBox(height: 18),
                        TextFormInput(
                          labelText: "Tasa de interés",
                          controller: interesCtr,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            interestMask,
                            LengthLimitingTextInputFormatter(5)
                          ],
                          suffix: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("%",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.white)),
                          ),
                        ),
                        const SizedBox(height: 25),
                        const Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text("Plazo del préstamo (años)",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 12),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [5, 10, 15, 20, 25, 30].map((years) {
                              return GestureDetector(
                                onTap: () => mortgageProvider
                                    .setPeriod(years.toDouble()),
                                child: PeriodCard(
                                  periodo:
                                      mortgageProvider.loanPeriodYears == years,
                                  numero: years,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ButtonPrimary(
                  text: "Calcular",
                  onPressed: () {
                    if (valorCtr.text.isEmpty ||
                        inicialCtr.text.isEmpty ||
                        interesCtr.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('Por favor, complete todos los campos')),
                      );
                      return;
                    }

                    final value =
                        double.tryParse(valorCtr.text.replaceAll(',', '')) ?? 0;
                    final initial =
                        double.tryParse(inicialCtr.text.replaceAll(',', '')) ??
                            0;
                    final interest = double.tryParse(interesCtr.text) ?? 0;

                    if (initial >= value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('La inicial debe ser menor al valor')),
                      );
                      return;
                    }

                    if (interest <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('El interés debe ser mayor a 0')),
                      );
                      return;
                    }

                    mortgageProvider.homeValue = value;
                    mortgageProvider.downPayment = initial;
                    mortgageProvider.interestRate = interest;
                    mortgageProvider.calculate();

                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ResultView()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
