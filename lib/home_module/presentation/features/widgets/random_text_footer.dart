import 'package:flutter/material.dart';
import '../../../../base_module/presentation/utils/utils.dart';

class RandomTextFooter extends StatelessWidget {
  const RandomTextFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getSize(context).width * .85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Random Text',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          Text(
            'Improve him believe opinion offered met and end cheered forbade. Friendly as stronger speedily by recurred. Son interest wandered sir addition end say. Manners beloved affixed picture men ask.',
            style: TextStyle(
              color: Colors.white.withOpacity(0.75),
              fontSize: 15,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
