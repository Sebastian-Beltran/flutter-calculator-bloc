import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState());

  // La forma de entender un async*
  // Stream<String> retornaString()async*{
  //   yield 'Hola Mundo';
  // }

  @override
  Stream<CalculatorState> mapEventToState(
    CalculatorEvent event,
  ) async* {
    if(event is ResetAC){
      yield* this._resetAC();
    }else if(event is AddNumber){
      yield state.copyWith(
        mathResul: state.mathResul == '0'
                    ? event.number
                    : state.mathResul + event.number
      );
    }else if(event is ChangeNegativePositive){
      yield state.copyWith(
        mathResul: state.mathResul.contains('-') 
                    ? state.mathResul.replaceFirst('-', '')
                    : '-' + state.mathResul

      );
    }else if(event is DeleteLastEntry){
      yield state.copyWith(
        mathResul: state.mathResul.length > 1 
                    ? state.mathResul.substring(0, state.mathResul.length -1)
                    : '0'
      );
    }else if(event is OperationEntry){
      yield state.copyWith(
        firstNumber: state.mathResul,
        mathResul: '0',
        operation: event.operation,
        secondNumber: '0'
      );
    }else if(event is CalculateResult){
      yield* _calculateResult();
    }
  }



  Stream<CalculatorState> _resetAC() async*{
    yield CalculatorState(
      firstNumber: '0',
      secondNumber: '0',
      mathResul: '0',
      operation: '+'
    );
  }


  Stream<CalculatorState> _calculateResult() async*{

    final double num1 = double.parse(state.firstNumber);
    final double num2 = double.parse(state.mathResul);

    switch (state.operation) {
      case '+':
        yield state.copyWith(
          secondNumber: state.mathResul,
          mathResul:'${ num1 + num2 }',

        );
        break;
      case '-':
        yield state.copyWith(
          secondNumber: state.mathResul,
          mathResul:'${ num1 - num2 }',

        );
        break;
      case 'X':
        yield state.copyWith(
          secondNumber: state.mathResul,
          mathResul:'${ num1 * num2 }',

        );
        break;
      case '/':
        yield state.copyWith(
          secondNumber: state.mathResul,
          mathResul:'${ num1 / num2 }',

        );
        break;
      default:
        yield state;
    }
  }
}
