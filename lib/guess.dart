import 'dart:io';
import 'dart:math';

void main() {
  var r = Random();
  var answer = r.nextInt(100) + 1;

  var isCorrect = false;
  var guess_count = 0;
print("╔══════════════════════════════════════════════");
print('║                GUESS NUMBER');
print('╟──────────────────────────────────────────────');
  do {
    stdout.write('║ Guess the number between 1 and 100 : ');
    var input = stdin.readLineSync();
    if (input == 'end'){
      break;
    }
    if (input == null) {
      continue;
    }

    var guess = int.tryParse(input);

    if (guess == null) {
      continue;
    }

    if (guess == answer) {
      print('║ ' + input + 'CORRECT! The answer is $answer');
      guess_count+=1;
      isCorrect = true;
      print('╟──────────────────────────────────────────────');
    } else if (guess > answer) {
      print('║ '+input + ' is TOO HIGH ▲');
      guess_count+=1;
      isCorrect = false;
      print('╟──────────────────────────────────────────────');
    } else {
      print('║ '+input +' is TOO LOW ▼');
      guess_count+=1;
      isCorrect = false;
      print('╟──────────────────────────────────────────────');
    }

  } while (!isCorrect);

  print("║                total guess : $guess_count");
  print('╚══════════════════════════════════════════════');

}