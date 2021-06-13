part of 'calculator_bloc.dart';

// Como va a lucir mi estado
// Genera un nueva isntancia del estado

class CalculatorState {
  final String mathResul;
  final String firstNumber;
  final String secondNumber;
  final String operation;

  CalculatorState({
    this.mathResul = '0', 
    this.firstNumber = '0', 
    this.secondNumber = '0', 
    this.operation = '+'
  });

  CalculatorState copyWith({
    String ? mathResul,
    String ? firstNumber,
    String ? secondNumber,
    String ? operation
  }){
    return CalculatorState(
      mathResul   : mathResul ?? this.mathResul,
      firstNumber : firstNumber ?? this.firstNumber,
      secondNumber: secondNumber ?? this.secondNumber,
      operation   : operation ?? this.operation
    );
  }

}

