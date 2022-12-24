// ignore_for_file: avoid_print
import 'dart:io';

import 'Game.dart';

void main() {

  var playAgain;
  do {
    var game = Game();
    late GuessResult guessResult;
    print('╔══════════════════════════════════════════════════');
    print('║              GUESS THE NUMBER              ');
    print('║──────────────────────────────────────────────────');
    do {
      stdout.write('║  Guess the number between 1 and 10 : ');

      var input = stdin.readLineSync();

      if (input == null) {
        //print('Error, input is NULL');
        return;
      }

      var guess = int.tryParse(input);

      if (guess == null) {
        //print('Input error, please enter numbers only');
        continue;
      }

      guessResult = game.doGuess(guess);

      if (guessResult == GuessResult.correct) {
        print('║  ➜ $guess is CORRECT ❤, total guesses: ${game.totalGuesses}');
        print('║──────────────────────────────────────────────────');
        print('║                    THE END                       ');
        print('╚══════════════════════════════════════════════════');

        while (true) {
          print('Play again? (Y/N) :');
          var again = stdin.readLineSync();
          if (again == 'Y' || again == 'y') {
            playAgain = true;
            break;
          } else if (again == 'N' || again == 'n') {
            playAgain = false;
            break;
          }
        }
      } else if (guessResult == GuessResult.tooHigh) {
        print('║  ➜ $guess is TOO HIGH! ▲');
        print('║──────────────────────────────────────────────────');
      } else {
        print('║  ➜ $guess is TOO LOW! ▼');
        print('║──────────────────────────────────────────────────');
      }
    } while (guessResult != GuessResult.correct);

  }
  while (playAgain == true);
  int num_of_played = Game.totalguessList.length;
  print("You're play $num_of_played game");
  for(int i =0;i < num_of_played ; i++){
    int r = i+1;
    print('🚀 game# $r : ${Game.totalguessList[i]} guesses' );
  }

}
