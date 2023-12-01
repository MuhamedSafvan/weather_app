import 'package:flutter/material.dart';
import '../../../../base_module/data/models/weather_response_model.dart';
import '../../../../base_module/presentation/utils/utils.dart';

class SelectWeatherDate extends StatefulWidget {
  final List<List<WeatherData>> weatherData;
  final int currentIndex;
  final Function(int index, String date) onDateSelected;

  SelectWeatherDate({
    required this.weatherData,
    required this.onDateSelected,
    required this.currentIndex,
  });

  @override
  State<SelectWeatherDate> createState() => _SelectWeatherDateState();
}

class _SelectWeatherDateState extends State<SelectWeatherDate> {
  late String selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate =
        extractSelectedDate(widget.weatherData[widget.currentIndex][0].dt!);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _showDateSelectionDialog(context);
      },
      icon: const Icon(
        Icons.keyboard_arrow_down,
        size: 35,
        color: Color.fromRGBO(246, 200, 164, 1),
      ),
    );
  }

  Future<void> _showDateSelectionDialog(BuildContext context) async {
    int selectedIndex = widget.weatherData.indexWhere(
      (element) => extractSelectedDate(element[0].dt!) == selectedDate,
    );

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select a Date',
          style: TextStyle(fontFamily: 'Poppins'),),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.weatherData.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                      extractSelectedDate(widget.weatherData[index][0].dt!)),
                  onTap: () {
                    Navigator.pop(context);

                    setState(() {
                      selectedDate =
                          extractSelectedDate(widget.weatherData[index][0].dt!);
                    });
                    widget.onDateSelected(index, selectedDate);
                  },
                  tileColor: index == selectedIndex ? Colors.grey : null,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
