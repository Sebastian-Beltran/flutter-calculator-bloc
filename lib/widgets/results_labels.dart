import 'package:calculadora/bloc/calculator/calculator_bloc.dart';
import 'package:calculadora/widgets/sub_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'line_separator.dart';
import 'main_result.dart';

class ResultsLabels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        if(state.firstNumber == '0' && state.secondNumber == '0'){
          return MainResultText(
              text: state.mathResul.endsWith('.0') 
                    ? state.mathResul.substring(0, state.mathResul.length -2)
                    : state.mathResul
            );
        }
        return Column(
          children: [
            SubResult(text: state.firstNumber.endsWith('.0') 
                    ? state.firstNumber.substring(0, state.firstNumber.length -2)
                    : state.firstNumber),
            SubResult(text: state.operation),
            SubResult(
              text: state.secondNumber.endsWith('.0') 
                    ? state.secondNumber.substring(0, state.secondNumber.length -2)
                    : state.secondNumber
            ),
            LineSeparator(),
            MainResultText(
              text: state.mathResul.endsWith('.0') 
                    ? state.mathResul.substring(0, state.mathResul.length -2)
                    : state.mathResul
            )
          ],
        );
      },
    );
  }
}
