import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../base_module/data/models/weather_response_model.dart';
import '../../../../base_module/presentation/core/values/constants.dart';
import '../../../../base_module/presentation/utils/utils.dart';

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
      width: getSize(context).width * .85,
      height: getSize(context).height * .2,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 70,
            width: MediaQuery.sizeOf(context).width,
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: weatherData.length > 5
                    ? weatherData.sublist(0, 5).length
                    : weatherData.length,
                itemBuilder: (context, index) {
                  final newWeatherData = weatherData.length > 5
                      ? weatherData.sublist(0, 5)
                      : weatherData;
                  return buildWeatherItem(newWeatherData[index],
                      getSize(context).width * .05);
                }),
          ),
          if (weatherData.length > 5)
            SizedBox(
              height: 10,
            ),
          if (weatherData.length > 5)
            Divider(
              height: 2,
              color: Colors.white.withOpacity(.7),
              thickness: 1,
              endIndent: 15,
              indent: 15,
            ),
          if (weatherData.length > 5)
            SizedBox(
              height: 10,
            ),
          if (weatherData.length > 5)
            SizedBox(
              height: 70,
              width: MediaQuery.sizeOf(context).width,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: weatherData.sublist(5).length,
                  itemBuilder: (context, index) {
                    final newWeatherData = weatherData.sublist(5);

                    return buildWeatherItem(newWeatherData[index],
                        getSize(context).width * .05);
                  }),
            ),
          // Expanded(
          // child: Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: weatherData.length > 5
          //       ? weatherData
          //           .sublist(0, 5)
          //           .map((data) => buildWeatherItem(
          //               data, AppConstants.getSize(context).width * .05))
          //           .toList()
          //       : weatherData
          //           .map((data) => buildWeatherItem(
          //               data, AppConstants.getSize(context).width * .05))
          //           .toList(),
          // ),
          // ),
          // if (weatherData.length > 5)
          //   SizedBox(
          //     height: 10,
          //   ),
          // if (weatherData.length > 5)
          //   Divider(
          //     height: 2,
          //     color: Colors.white,
          //     thickness: 2,
          //   ),
          // if (weatherData.length > 5)
          //   SizedBox(
          //     height: 10,
          //   ),
          // if (weatherData.length > 5)
          //   Expanded(
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         ...weatherData
          //             .sublist(5)
          //             .map((data) => buildWeatherItem(
          //                 data, AppConstants.getSize(context).width * .05))
          //             .toList(),
          //         ...List.generate(
          //           5 - weatherData.sublist(5).length,
          //           (index) => SizedBox(
          //             width: AppConstants.getSize(context).width * .05,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
        ],
      ),
      // child: Column(
      //   children: [
      //     Expanded(
      //       child: ListView.builder(
      //         scrollDirection: Axis.horizontal,
      //         itemCount: splitLists.length,
      //         itemBuilder: (context, index) {
      //           return Row(
      //             children: List.generate(
      //               splitLists[index].length,
      //               (subIndex) {
      //                 return Column(
      //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                   children: [
      //                     Text(
      //                       AppConstants.formatTimestampToTime(
      //                           splitLists[index][subIndex].dt!),
      //                       style: const TextStyle(
      //                         color: Colors.white,
      //                         fontSize: 15,
      //                         fontFamily: 'Poppins',
      //                         fontWeight: FontWeight.w400,
      //                         height: 0,
      //                       ),
      //                     ),
      //                     Expanded(
      //                       child: Row(
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         children: [
      //                           SizedBox(
      //                             // height: 50,
      //                             width: AppConstants.getSize(context).width *
      //                                 .05,
      //                             child: CachedNetworkImage(
      //                               imageUrl: AppConstants.getCloudImageUrl(
      //                                   splitLists[index][subIndex]
      //                                       .weather
      //                                       ?.first
      //                                       .icon),
      //                               fit: BoxFit.cover,
      //                             ),
      //                           ),
      //                           Text(
      //                             '${splitLists[index][subIndex].main?.temp?.round()}${AppConstants.degreeSymbol}',
      //                             style: const TextStyle(
      //                               color: Colors.white,
      //                               fontSize: 15,
      //                               fontFamily: 'Poppins',
      //                               fontWeight: FontWeight.w400,
      //                               height: 0,
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ],
      //                 );
      //                 // return Container(
      //                 //   padding: EdgeInsets.all(8.0),
      //                 //   child: Text(splitLists[index][subIndex]),
      //                 // );
      //               },
      //             ),
      //           );
      //         },
      //       ),
      //     ),
      //     Divider(), // Divider between the two horizontal ListViews
      //     Expanded(
      //       child: ListView.builder(
      //         scrollDirection: Axis.horizontal,
      //         itemCount: splitLists.length,
      //         itemBuilder: (context, index) {
      //           return Row(
      //             children: List.generate(
      //               splitLists[index].length,
      //               (subIndex) {
      //                 return Column(
      //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                   children: [
      //                     Text(
      //                       AppConstants.formatTimestampToTime(
      //                           splitLists[index][subIndex].dt!),
      //                       style: const TextStyle(
      //                         color: Colors.white,
      //                         fontSize: 15,
      //                         fontFamily: 'Poppins',
      //                         fontWeight: FontWeight.w400,
      //                         height: 0,
      //                       ),
      //                     ),
      //                     Expanded(
      //                       child: Row(
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         children: [
      //                           SizedBox(
      //                             // height: 50,
      //                             width: AppConstants.getSize(context).width *
      //                                 .05,
      //                             child: CachedNetworkImage(
      //                               imageUrl: AppConstants.getCloudImageUrl(
      //                                   splitLists[index][subIndex]
      //                                       .weather
      //                                       ?.first
      //                                       .icon),
      //                               fit: BoxFit.cover,
      //                             ),
      //                           ),
      //                           Text(
      //                             '${splitLists[index][subIndex].main?.temp?.round()}${AppConstants.degreeSymbol}',
      //                             style: const TextStyle(
      //                               color: Colors.white,
      //                               fontSize: 15,
      //                               fontFamily: 'Poppins',
      //                               fontWeight: FontWeight.w400,
      //                               height: 0,
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ],
      //                 );
      //               },
      //             ),
      //           );
      //         },
      //       ),
      //     ),
      //   ],
      // )
      // child: GridView.builder(
      //   physics: const NeverScrollableScrollPhysics(),
      //   itemCount: weatherData.length,
      //   shrinkWrap: true,
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 5, crossAxisSpacing: 15),
      //   itemBuilder: (context, index) =>
      // Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       Text(
      //         AppConstants.formatTimestampToTime(data.dt!),
      //         style: const TextStyle(
      //           color: Colors.white,
      //           fontSize: 15,
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w400,
      //           height: 0,
      //         ),
      //       ),
      //       Expanded(
      //         child: Row(
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             SizedBox(
      //               // height: 50,
      //               width: AppConstants.getSize(context).width * .05,
      //               child: CachedNetworkImage(
      //                 imageUrl: AppConstants.getCloudImageUrl(
      //                     data.weather?.first.icon),
      //                 fit: BoxFit.cover,
      //               ),
      //             ),
      //             Text(
      //               '${data.main?.temp?.round()}${AppConstants.degreeSymbol}',
      //               style: const TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 15,
      //                 fontFamily: 'Poppins',
      //                 fontWeight: FontWeight.w400,
      //                 height: 0,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Widget buildWeatherItem(WeatherData data, double width) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .65),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            formatTimestampToTime(data.dt!),
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                // height: 50,
                width: width,
                child: CachedNetworkImage(
                  imageUrl:
                      AppConstants.getCloudImageUrl(data.weather?.first.icon),
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                '${data.main?.temp?.round()}${AppConstants.degreeSymbol}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
