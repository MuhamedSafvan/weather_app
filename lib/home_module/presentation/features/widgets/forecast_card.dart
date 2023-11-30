import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../base_module/data/models/weather_response_model.dart';
import '../../../../base_module/presentation/core/values/constants.dart';

class ForeCastCard extends StatelessWidget {
  final List<WeatherData> weatherData;

  const ForeCastCard({
    super.key,
    required this.weatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: AppConstants.getSize(context).width * .85,
      height: AppConstants.getSize(context).height * .15,
      padding: EdgeInsets.symmetric(horizontal: 10),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        gradient: const RadialGradient(
            center: Alignment(0.49, 0.50),
            radius: 0.39,
            colors: [
              Color.fromRGBO(172, 115, 106, 0.52),
              Color.fromRGBO(172, 115, 106, 0.23)
            ]
            // colors: [Color(0xB2AC736A), Color(0x4CAC736A)],
            ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: weatherData.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, crossAxisSpacing: 15),
        itemBuilder: (context, index) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              AppConstants.formatTimestampToTime(weatherData[index].dt!),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl: AppConstants.getCloudImageUrl(
                        weatherData[index].weather?.first.icon),
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  '${weatherData[index].main?.temp?.round()}${AppConstants.degreeSymbol}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // child: Stack(
      //   children: [
      //     Positioned(
      //       left: 30,
      //       top: 20,
      //       child: Text(
      //         'Now',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 15,
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w400,
      //           height: 0,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: 30,
      //       top: 111,
      //       child: Text(
      //         '6 AM',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 15,
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w400,
      //           height: 0,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: 94,
      //       top: 20,
      //       child: Text(
      //         '2 AM',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 15,
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w400,
      //           height: 0,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: 94,
      //       top: 111,
      //       child: Text(
      //         '7 AM',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 15,
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w400,
      //           height: 0,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: 158,
      //       top: 20,
      //       child: Text(
      //         '3 AM',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 15,
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w400,
      //           height: 0,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: 158,
      //       top: 111,
      //       child: Text(
      //         '8 AM',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 15,
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w400,
      //           height: 0,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: 222,
      //       top: 20,
      //       child: Text(
      //         '4 AM',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 15,
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w400,
      //           height: 0,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: 222,
      //       top: 111,
      //       child: Text(
      //         '9 AM',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 15,
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w400,
      //           height: 0,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: 286,
      //       top: 20,
      //       child: Text(
      //         '5 AM',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 15,
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w400,
      //           height: 0,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: 286,
      //       top: 111,
      //       child: Text(
      //         '10 AM',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 15,
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w400,
      //           height: 0,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: 51,
      //       top: 47,
      //       child: Text(
      //         '25',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 15,
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w400,
      //           height: 0,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: 51,
      //       top: 138,
      //       child: Text(
      //         '25',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 15,
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w400,
      //           height: 0,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: 115,
      //       top: 47,
      //       child: Text(
      //         '25',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 15,
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w400,
      //           height: 0,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: 115,
      //       top: 138,
      //       child: Text(
      //         '25',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 15,
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w400,
      //           height: 0,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: 179,
      //       top: 47,
      //       child: Text(
      //         '23',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 15,
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w400,
      //           height: 0,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: 179,
      //       top: 138,
      //       child: Text(
      //         '23',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 15,
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w400,
      //           height: 0,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: 243,
      //       top: 47,
      //       child: Text(
      //         '22',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 15,
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w400,
      //           height: 0,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: 243,
      //       top: 138,
      //       child: Text(
      //         '22',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 15,
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w400,
      //           height: 0,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: 307,
      //       top: 47,
      //       child: Text(
      //         '20',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 15,
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w400,
      //           height: 0,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: 307,
      //       top: 138,
      //       child: Text(
      //         '20',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 15,
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w400,
      //           height: 0,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: 30,
      //       top: 90,
      //       child: Container(
      //         width: 300,
      //         height: 1,
      //         decoration: ShapeDecoration(
      //           color: Colors.white.withOpacity(0.5),
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(10),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
