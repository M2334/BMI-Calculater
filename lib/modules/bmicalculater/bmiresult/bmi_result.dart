import 'package:flutter/material.dart';

import '../../../constants.dart';
class BmiResult extends StatelessWidget {
  final int age ;
  final bool isMale ;
   BmiResult({
  @required this.age, this.isMale,
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Gander : ${isMale ? 'Male' : 'Female'}',style: kTitleTextStyle),
            Text('Result : result',style: kTitleTextStyle),
            Text('age : $age',style: kTitleTextStyle),
          ],
        ),
      ),
    );
  }
}
