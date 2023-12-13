import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  final String title;
  final String? sign;

  ChipWidget({
    required this.title,
    required this.sign,
  });

  @override
  Widget build(BuildContext context) {
    return sign != null
        ? Chip(
            label: Text(checkTitle(title, sign!)),
            avatar: CircleAvatar(
              backgroundColor: sign == "Yes" ? Colors.red : Colors.green,
            ),
          )
        : Container();
  }
}

String checkTitle(String title, String sign) {
  if (title == "danger") {
    return sign == "Yes" ? "အန္တရာယ်ရှိ" : "အန္တရာယ်မရှိ";
  } else {
    return sign == "Yes" ? "အဆိပ်ရှိ" : "အဆိပ်မရှိ";
  }
}
