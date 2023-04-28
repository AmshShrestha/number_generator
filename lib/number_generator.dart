import 'dart:math';

import 'package:flutter/material.dart';

class NumberGenerator extends StatefulWidget {
  const NumberGenerator({super.key});

  @override
  State<NumberGenerator> createState() => _NumberGeneratorState();
}

class _NumberGeneratorState extends State<NumberGenerator> {
  int randomnum1 = 1;
  int randomnum2 = 21;
  int counter = 0;
  int correctvalue = 0;
  int incorrectvalue = 0;

  void generateRandom() {
    randomnum2 = Random().nextInt(100);
    randomnum1 = Random().nextInt(100);
    setState(
      () {},
    );
  }

  void choiceofanswer({num1 = 0, num2 = 0}) {
    //counter = counter + 1;
    if (++counter <= 10) {
      if (num1 > num2) {
        correctvalue++;
      } else {
        incorrectvalue++;
      }
      generateRandom();
    } else {
      gamerestart();
    }
  }

  void gamerestart() {
    counter = 0;
    correctvalue = 0;
    incorrectvalue = 0;

    generateRandom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Generator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  choiceofanswer(num1: randomnum1, num2: randomnum2);
                },
                child: Text('$randomnum1'),
              ),
              ElevatedButton(
                onPressed: () {
                  choiceofanswer(num1: randomnum2, num2: randomnum1);
                },
                child: Text('$randomnum2'),
              ),
            ],
          ),
          const Spacer(),
          Text("Correct Value : $correctvalue"),
          Text('Incorrect Value :$incorrectvalue'),
          Text('Atempt  :$counter'),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              gamerestart();
            },
            child: const Text('Restart'),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
