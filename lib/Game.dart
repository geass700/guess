// ignore_for_file: avoid_print
import 'dart:math';

enum GuessResult {
  correct, tooHigh, tooLow
}

class Game {
  var answer = Random().nextInt(10) + 1;
  static var totalguessList = <int>[];
  var totalguess = 0;
  // constructor
  Game() {}

  GuessResult doGuess(int guess) {
    totalguess++;

    if (guess == answer) {
      totalguessList.add(totalguess);
      return GuessResult.correct;
    } else if (guess > answer) {
      return GuessResult.tooHigh;
    } else {
      return GuessResult.tooLow;
    }
  }

  int get totalGuesses {
    return totalguess;
  }
  List get GuessList {
    return totalguessList;
  }
}
