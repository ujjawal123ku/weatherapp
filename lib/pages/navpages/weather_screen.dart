import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memo/pages/navpages/weather_provider.dart';
import 'package:provider/provider.dart';

class WeatherScreen extends StatelessWidget {
  final String cityName;

  WeatherScreen({required this.cityName});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider()..fetchWeather(cityName),
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 1.2 * kToolbarHeight, 30, 10),
          child: Consumer<WeatherProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return Center(child: CircularProgressIndicator());
              }

              if (provider.errorMessage != null) {
                return Center(child: Text(provider.errorMessage!));
              }

              if (provider.weather == null) {
                return Center(child: Text('No data available'));
              }

              String iconUrl = 'http://openweathermap.org/img/wn/${provider.weather!.icon}@2x.png';

              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: RefreshIndicator(
                  onRefresh: () async {
                    await provider.fetchWeather(cityName);
                  },
                  child: ListView(
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(3, -0.3),
                            child: Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-3, -0.3),
                            child: Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, -1.2),
                            child: Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      // _showLocationPopup(context);
                                    },
                                    icon: Icon(Icons.location_on, color: Colors.red),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // _showLocationPopup(context);
                                    },
                                    child: Text(
                                      provider.weather!.cityName,
                                      style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Center(
                                child: Column(
                                  children: [
                                    Image.network(iconUrl, scale: 0.8),
                                    SizedBox(height: 10),
                                    Text(
                                      '${provider.weather!.temperature.toStringAsFixed(1)}°C',
                                      style: TextStyle(
                                        fontSize: 55,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      provider.weather!.condition.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset('assets/img/temperature.png', scale: 2),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Temp.',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                            '${provider.weather!.temperature.toStringAsFixed(1)}°C',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Image.asset('assets/img/wind.png', scale: 29),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Wind",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                            'Wind Speed: ${provider.weather!.windSpeed} m/s',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Image.asset('assets/img/humidity.png', scale: 15),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Humidity",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                            'Humidity: ${provider.weather!.humidity}%',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
