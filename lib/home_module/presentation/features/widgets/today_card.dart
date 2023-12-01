import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/base_module/presentation/core/values/constants.dart';

import '../../../../base_module/data/models/weather_response_model.dart';
import '../../../../base_module/presentation/utils/utils.dart';
import 'select_weather_date.dart';

class TodayCard extends StatefulWidget {
  final City city;
  final List<List<WeatherData>> weatherData;
  final int index;
  final Function(int index) onUpdate;
  const TodayCard(
      {super.key,
      required this.city,
      required this.weatherData,
      required this.onUpdate,
      required this.index});

  @override
  State<TodayCard> createState() => _TodayCardState();
}

class _TodayCardState extends State<TodayCard> {
  String? selectedDate;
  late int newIndex;

  @override
  void initState() {
    super.initState();
    selectedDate = extractSelectedDate(widget.weatherData[widget.index][0].dt!);
    newIndex = widget.index;
  }

  String getTodaysDate(String inputDate) {
    DateTime parsedDate;
    if (inputDate == 'Today') {
      parsedDate = DateTime.now();
    } else if (inputDate == 'Tomorrow') {
      parsedDate = DateTime.now().add(Duration(days: 1));
    } else {
      parsedDate = DateFormat("dd-MMM-yyyy").parse(inputDate);
    }
    String formattedDate = DateFormat("dd MMM yyyy").format(parsedDate);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSize(context).width * .85,
      height: getSize(context).height * .38,
      // clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFFAC736A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                selectedDate!,
                style: TextStyle(
                  color: AppConstants.cardFontColor,
                  fontSize: 25,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              SelectWeatherDate(
                currentIndex: widget.index,
                onDateSelected: (index, date) {
                  widget.onUpdate(index);
                  setState(() {
                    selectedDate = date;
                  });
                },
                weatherData: widget.weatherData,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: AppConstants.getCloudImageUrl(
                    widget.weatherData[widget.index][0].weather?.first.icon),
                fit: BoxFit.cover,
              ),
              Text(
                '${widget.weatherData[widget.index][0].main?.temp?.round()}${AppConstants.degreeSymbol}',
                style: const TextStyle(
                  color: AppConstants.cardFontColor,
                  fontSize: 60,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ],
          ),
          Text(
            '${widget.weatherData[widget.index][0].weather?.first.description?.toTitleCase()}',
            style: const TextStyle(
              color: AppConstants.cardFontColor,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          SizedBox(
            child: Text(
              widget.city.name!,
              style: const TextStyle(
                color: AppConstants.cardFontColor,
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
          SizedBox(
            child: Text(
              getTodaysDate(selectedDate!),
              style: const TextStyle(
                color: AppConstants.cardFontColor,
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
          SizedBox(
            child: Text(
              'Feels like ${widget.weatherData[widget.index][0].main?.feelsLike?.round()}${AppConstants.degreeSymbol}   |   Sunset ${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(widget.city.sunset! * 1000).toLocal())}',
              style: const TextStyle(
                color: AppConstants.cardFontColor,
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
