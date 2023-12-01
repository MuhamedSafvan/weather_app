import 'package:flutter/material.dart';
import 'package:weather_app/home_module/presentation/features/screens/weather_screen.dart';

class ErrorScreen extends StatefulWidget {
  final String message;
  const ErrorScreen({super.key, required this.message});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.message),
              SizedBox(
                height: 50,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => WeatherPage(isRetry: true,)),
                    );
                  },
                  icon: Icon(Icons.refresh),
                  label: Text(
                    "Retry",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
