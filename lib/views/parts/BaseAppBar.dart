import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lotto_number/libraries/UniDialog.dart';

class BaseAppBar extends StatelessWidget with PreferredSizeWidget{
  @override
  final Size preferredSize;
  final String title;

  BaseAppBar(this.title, {Key? key}) : preferredSize = AppBar().preferredSize, super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "$title", style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w700),
      ),
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.album_outlined),
            onPressed: () => {
              UniDialog.callDialog(
                context,
                title: "경고",
                content: "앱을 종료하시겠습니까?",
                positiveText: "예",
                positive: () {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
                negativeText: "아니오"
              )
            },
          ),
        ),
      ],
    );
  }
}