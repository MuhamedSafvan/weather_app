import 'package:flutter/material.dart';

class RandomTextFooter extends StatelessWidget {
  const RandomTextFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Random Text',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        Opacity(
          opacity: 0.75,
          child: Text(
            'Improve him believe opinion offered met and \nend cheered forbade. Friendly as stronger \nspeedily by recurred. Son interest wandered \nsir addition end say. Manners beloved affixed \npicture men ask.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        )
      ],
    );
  }
}
