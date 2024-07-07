import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memo/cubit/app_cubits.dart';
import 'package:memo/pages/navpages/homePage.dart';
import 'package:memo/pages/navpages/mainPage.dart';
import 'package:memo/pages/welcome.dart';
import 'package:weather/weather.dart';
import 'app_cubitstate.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          return _buildBody(state);
        },
      ),
    );
  }

  Widget _buildBody(CubitStates state) {
    if (state is WelcomeState) {
      return wlcome_Page();
    } else if (state is loadedState) {
      // Access 'weather' property only for LoadedState
      Weather? weather = state.weather; // Added null check

      // Check if the weather data is available and then decide whether to navigate to HomePage or MainPage
      if (weather != null) {
        return Homepage();
      } else {
        return _buildLoadingState();
      }
    } else if (state is LoadingState) {
      return _buildLoadingState();
    } else {
      return Container(); // Handle other states if needed
    }
  }

  Widget _buildLoadingState() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
