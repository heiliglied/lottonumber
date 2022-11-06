import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

class LottoLib {

  List<int> numbers = [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
    11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
    21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
    31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
    41, 42, 43, 44, 45
  ];

  List<int> setLotto() {
    List<int> lotto = [];
    List<int> newNumbers = numbers;
    while(lotto.length < 6) {
      int randomNumber = Random().nextInt(newNumbers.length - 1);
      int getNumber = newNumbers[randomNumber];
      if(!lotto.contains(getNumber)) {
        lotto.add(getNumber);
        newNumbers.remove(getNumber);
      }
    }
    return lotto;
  }

  List<List<int>> getLottoNumber(int repeat) {
    List<List<int>> lottoList = List.generate(repeat, (index) => [index * index]);
    for(int i = 0; i < repeat; i++) {
      lottoList[i] = setLotto();
    }
    return lottoList;
  }
}