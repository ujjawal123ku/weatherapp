import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:memo/model/data_model.dart';

import 'package:weather/weather.dart';
import 'package:memo/cubit/app_cubitstate.dart';

class AppCubits extends Cubit<CubitStates> {
   // Replace with your actual API key

  AppCubits() : super(InitialState()) {
    emit(WelcomeState());
  }



  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, and we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  // Fetch weather data based on the current location
  void getData() async {
    try {
      emit(LoadingState());
      Position position = await _determinePosition();
      WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);
      Weather weather = await wf.currentWeatherByLocation(
          position.latitude, position.longitude);
      emit(loadedState(weather));
    } catch (e) {
      print(e);
      emit(ErrorState("Failed to fetch weather data."));
    }
  }
}
