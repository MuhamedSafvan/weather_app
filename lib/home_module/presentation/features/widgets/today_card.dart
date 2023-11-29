import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/base_module/presentation/core/values/constants.dart';

import '../../../../base_module/data/models/weather_response_model.dart';

class TodayCard extends StatelessWidget {
  final WeatherResponse data;
  const TodayCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 386,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFFAC736A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            child: Text(
              'Today',
              style: TextStyle(
                color: AppConstants.cardFontColor,
                fontSize: 25,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                AppConstants.getCloudImageUrl(
                    data.list?.first.weather?.first.icon),
                fit: BoxFit.cover,
              ),
              Text(
                '${data.list?.first.main?.temp}',
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
          SizedBox(
            child: Text(
              DateFormat('dd MMM yyyy').format(DateTime.now()),
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
              data.city!.name!,
              style: const TextStyle(
                color: AppConstants.cardFontColor,
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
          Text(
            '${data.list?.first.weather?.first.description?.toUpperCase()}',
            style: TextStyle(
              color: AppConstants.cardFontColor,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          SizedBox(
            child: Text(
              'Feels like ${data.list?.first.main?.feelsLike}${AppConstants.degreeSymbol} | Sunset ${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(data.city!.sunset! * 1000).toLocal())}',
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
