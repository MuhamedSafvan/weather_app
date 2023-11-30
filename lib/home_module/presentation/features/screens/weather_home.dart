import 'package:flutter/material.dart';
import 'package:weather_app/base_module/data/models/weather_response_model.dart';
import '/base_module/presentation/core/values/constants.dart';
import '../widgets/forecast_card.dart';
import '../widgets/random_text_footer.dart';
import '../widgets/today_card.dart';

class WeatherHome extends StatefulWidget {
  final WeatherResponse data;
  List<List<WeatherData>> weatherList;
  WeatherHome({super.key, required this.data, required this.weatherList});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppConstants.backgroundImage),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TodayCard(
              city: widget.data.city!,
              weatherData: widget.weatherList,
              index: selectedIndex,
              onUpdate: (index) {
                print("selectedIndex $index");
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
            ForeCastCard(
              weatherData: widget.weatherList[selectedIndex],
            ),
            RandomTextFooter()
          ],
        ),
      ),
    );
  }
}
