import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lotto_number/libraries/LottoLib.dart';

class ResultPage extends StatelessWidget {
  final int repeat;
  late List<List<int>> numbers = [];
  ResultPage(this.repeat, {Key? key}) : super(key: key);
/*
  Widget resultWidget(number) = Container(
    child: CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListView.builder(
                itemCount: super.numbers.length,
                  itemBuilder: itemBuilder
              )
            ],
          ),
        ),
      ],
    ),
  );
*/
  @override
  Widget build(BuildContext context) {
    var lotto = LottoLib();
    numbers = lotto.getLottoNumber(repeat);
    return Container(
      padding: EdgeInsets.all(20),
      child:
        ListView.separated(
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            final item = numbers[index];
            String itemString = "";
            for(var it in item) {
              itemString = itemString + " " + it.toString();
            }
            return ListTile(
              title: Text(itemString, style: TextStyle(fontSize: 30, color: Colors.pinkAccent)),
            );
          }, separatorBuilder: (BuildContext context, int index) { return Divider(thickness: 1); }
        )
      );
  }
}