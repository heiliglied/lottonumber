import 'package:flutter/material.dart';
import 'package:lotto_number/views/parts/BaseAppBar.dart';
import 'package:lotto_number/views/parts/EmptyPage.dart';
import 'package:lotto_number/views/parts/ResultPage.dart';
import 'package:lotto_number/libraries/UniDialog.dart';
import 'package:lotto_number/libraries/LottoLib.dart';

class MainPage extends StatefulWidget{
  MainPage({Key? key}) : super(key: key);
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  String? dropdownValue;
  Widget page = EmptyPage();
  @override
  Widget build(BuildContext context) {
    double widgetWidth = MediaQuery.of(context).size.width;
    double widgetHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: BaseAppBar("로또 번호 생성기"),
      body: Column(
        children: [
          Container(
            width: widgetWidth,
            height: 80,
            padding: EdgeInsets.all(10),
            child: DropdownButton<String?>(
              isExpanded: true,
              style: TextStyle(color: Colors.blueAccent, fontSize: 20.0),
              underline: Container(
                height: 2,
                color: Colors.black,
              ),
              value: dropdownValue,
              onChanged: (String? selectedValue) {
                setState(() {
                  dropdownValue = selectedValue!;
                });
              },
              items: [
                DropdownMenuItem(child: Text("1회"), value: "1"),
                DropdownMenuItem(child: Text("2회"), value: "2"),
                DropdownMenuItem(child: Text("3회"), value: "3"),
                DropdownMenuItem(child: Text("4회"), value: "4"),
                DropdownMenuItem(child: Text("5회"), value: "5"),
              ],
              hint: Text("생성할 회차"),
            ),
          ),
          Expanded(
            //동적 리스트 뷰 작성 필요.
            child: page,
          ),
          Container(
            width: widgetWidth,
            height: 60,
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () => {
                if(dropdownValue != null) {
                  changeWidget()
                } else {
                  UniDialog.callDialog(context, title: "오류", content: "생성할 회차를 선택해주세요.", positiveText: "확인")
                }
              },
              child: Text('번호 생성!', style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
              ),
            )
          ),
        ],
      ),
    );
  }

  void changeWidget() {
    setState(() {
      page = ResultPage(int.parse(dropdownValue!));
    });
  }
}
