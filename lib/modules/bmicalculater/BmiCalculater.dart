import 'dart:math';

import 'package:flutter/material.dart';

import '../../constants.dart';
import 'bmiresult/bmi_result.dart';
class BmiCalculater extends StatefulWidget {
  const BmiCalculater({Key key}) : super(key: key);

  @override
  _BmiCalculaterState createState() => _BmiCalculaterState();
}

class _BmiCalculaterState extends State<BmiCalculater> {
  bool isMale = true;
  double height = 120.0;
  int weight = 50;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculater'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Image(
                             image: AssetImage('assets/images/male.png'),
                             height: 50.0,
                             width: 50.0,
                           ),
                            SizedBox(height: 15.0,),
                            Text('MALE',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: isMale ? Colors.black12:Color(0xff7DEDFF),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Image(
                             image: AssetImage('assets/images/female.png'),
                             height:50.0,
                             width: 50.0,
                           ),
                            SizedBox(height: 15.0,),
                            Text('FEMALE',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),),
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: !isMale ? Colors.black12: Color(0xff7DEDFF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xffFFBCBC),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',style: kLabelTextStyle),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text('${height.round()}',style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900,
                        ),),
                        SizedBox(width: 5.0,),
                        Text('CM',style: kLabelTextStyle),
                      ],
                    ),
                    Slider(
                      value: height,
                      max: 220.0,
                      min: 80.0,
                      onChanged: (value){
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xff7DEDFF),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE',style:kLabelTextStyle ),
                          Text('$age',style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed:(){
                                  setState(() {
                                    age--;
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                ),
                                mini: true,
                              ),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                ),
                                mini: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xff7DEDFF),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT',style: kLabelTextStyle,
                          ),
                          Text('$weight',style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed:(){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                ),
                                mini: true,
                              ),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                ),
                                mini: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.blueGrey,
            child: MaterialButton(
              height: 50.0,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context) => BmiResult(
                        age : age,
                        isMale : isMale,
                      ),
                    ),
                );
                double result = weight/pow(height/100, 2);
                print(result.round());
              },
              child: Text('CALCULATE',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
