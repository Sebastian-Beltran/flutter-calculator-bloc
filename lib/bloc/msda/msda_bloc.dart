import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'msda_event.dart';
part 'msda_state.dart';

class MsdaBloc extends Bloc<MsdaEvent, MsdaState> {
  MsdaBloc() : super(MsdaInitial());

  @override
  Stream<MsdaState> mapEventToState(
    MsdaEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
