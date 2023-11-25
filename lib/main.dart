import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rock Paper Scissors',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RockPaperScissorsPage(),
    );
  }
}

class RockPaperScissorsPage extends StatefulWidget {
  const RockPaperScissorsPage({super.key});

  @override
  State<RockPaperScissorsPage> createState() => _RockPaperScissorsPageState();
}

class _RockPaperScissorsPageState extends State<RockPaperScissorsPage> {
  String _playerChoice = '';
  String _computerChoice = '';
  String _result = '';

  void _playGame(String playerChoice) {
    const choices = ['Rock', 'Paper', 'Scissors'];
    final random = Random();
    final computerChoice = choices[random.nextInt(choices.length)];
    String result;

    if (playerChoice == computerChoice) {
      result = 'It\'s a Tie!';
    } else if ((playerChoice == 'Rock' && computerChoice == 'Scissors') ||
        (playerChoice == 'Scissors' && computerChoice == 'Paper') ||
        (playerChoice == 'Paper' && computerChoice == 'Rock')) {
      result = 'You Win!';
    } else {
      result = 'You Lose!';
    }

    setState(() {
      _playerChoice = playerChoice;
      _computerChoice = computerChoice;
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rock Paper Scissors'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Your Choice: $_playerChoice', style: const TextStyle(fontSize: 22)),
          Text('Computer\'s Choice: $_computerChoice', style: const TextStyle(fontSize: 22)),
          Text(_result, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => _playGame('Rock'),
                child: const Text('Rock'),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () => _playGame('Paper'),
                child: const Text('Paper'),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () => _playGame('Scissors'),
                child: const Text('Scissors'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}