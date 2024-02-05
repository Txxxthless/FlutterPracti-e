import 'dart:math';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart' as words;
import 'package:flutter_application_1/wordle.dart';

class HurdleProvider extends ChangeNotifier {
  final random = Random.secure();
  List<String> totalWords = [];
  List<String> rowInputs = [];
  List<String> excludedLetters = [];
  List<Wordle> hurdleBoard = [];
  String targetWord = '';
  int count = 0;
  final lettersPerRow = 5;
  int index = 0;
  bool wins = false;
  final totalAttempts = 5;
  int attemps = 0;

  init() {
    totalWords = words.all.where((element) => element.length == 5).toList();
    generateBoard();
    generateRandomWord();
  }

  generateBoard() {
    hurdleBoard = List.generate(30, (index) => Wordle(letter: ''));
  }

  generateRandomWord() {
    targetWord = totalWords[random.nextInt(totalWords.length)].toUpperCase();
    print(targetWord);
  }

  bool get isAValidWord =>
      totalWords.contains(rowInputs.join('').toLowerCase());

  bool get shouldCheckForAnswer => rowInputs.length == lettersPerRow;

  bool get noAttemptsLeft => attemps == totalAttempts;

  inputLetter(String letter) {
    if (count < lettersPerRow) {
      rowInputs.add(letter);
      count++;
      hurdleBoard[index] = Wordle(letter: letter);
      index++;
      notifyListeners();
      print(rowInputs);
    }
  }

  deleteLetter() {
    if (rowInputs.isNotEmpty) {
      rowInputs.removeAt(rowInputs.length - 1);
    }

    if (count > 0) {
      hurdleBoard[index - 1] = Wordle(letter: '');
      count--;
      index--;
    }

    notifyListeners();
  }

  checkAnswer() {
    final input = rowInputs.join('');

    if (targetWord == input) {
      wins = true;
    } else {
      _markLetterOnBoard();
      if (attemps < totalAttempts) {
        _goToNextRow();
      }
    }
  }

  _markLetterOnBoard() {
    for (int i = 0; i < hurdleBoard.length; i++) {
      if (hurdleBoard[i].letter.isNotEmpty &&
          targetWord.contains(hurdleBoard[i].letter)) {
        hurdleBoard[i].existsInTarget = true;
      } else if (hurdleBoard[i].letter.isNotEmpty &&
          !targetWord.contains(hurdleBoard[i].letter)) {
        hurdleBoard[i].doesNotExistsInTarget = true;
        excludedLetters.add(hurdleBoard[i].letter);
      }

      notifyListeners();
    }
  }

  _goToNextRow() {
    attemps++;
    count = 0;
    rowInputs.clear();
  }

  reset() {
    count = 0;
    index = 0;
    rowInputs.clear();
    hurdleBoard.clear();
    excludedLetters.clear();
    attemps = 0;
    wins = false;
    targetWord = '';

    generateBoard();
    generateRandomWord();
    notifyListeners();
  }
}
