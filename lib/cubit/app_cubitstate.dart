import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';

import '../model/data_model.dart';

abstract class CubitStates extends Equatable{

}class InitialState extends CubitStates {  @override
  // TODO: implement props
  List<Object> get props => [];
}
class WelcomeState extends CubitStates {  @override
// TODO: implement props
List<Object> get props => [];
}
class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class loadedState extends CubitStates {
final Weather weather;

  loadedState(this.weather);

  @override
  // TODO: implement props
  List<Object?> get props => [weather];

}
class ErrorState extends CubitStates {
  final String errorMessage;

  ErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}




