import 'dart:math';
import 'package:flutter/material.dart';

class DiceRoll extends StatefulWidget {
  const DiceRoll({super.key});

  @override
  State<DiceRoll> createState() => _DiceRollState();
}

class _DiceRollState extends State<DiceRoll> {
  var changeDice1 = 'assets/images/dice-1.png';
  var changeDice2 = 'assets/images/dice-1.png';
  var changeDice3 = 'assets/images/dice-1.png';
  int sum = 0;

  void rollDice() {
    var dicePri1 = Random().nextInt(6) + 1;
    var dicePri2 = Random().nextInt(6) + 1;
    var dicePri3 = Random().nextInt(6) + 1;
    setState(() {
      changeDice1 = 'assets/images/dice-$dicePri1.png';
      changeDice2 = 'assets/images/dice-$dicePri2.png';
      changeDice3 = 'assets/images/dice-$dicePri3.png';
      sum = dicePri1 + dicePri2 + dicePri3;
    });
  }

  @override
  Widget build(BuildContext context) {
    String resultDiv = '';

    if (sum % 2 == 0) {
      resultDiv = 'Even';
    } else {
      resultDiv = 'Odd';
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              changeDice1,
              width: 120,
            ),
            Image.asset(
              changeDice2,
              width: 120,
            ),
            Image.asset(
              changeDice3,
              width: 120,
            ),
          ],
        ),
        const SizedBox(height: 30),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          child: const Text(' Roll Dice '),
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Total: $sum',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                Text(
                  'Parity: $resultDiv',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
