import 'package:flutter/material.dart';

class AppDialogs {
  BuildContext context;

  AppDialogs({required this.context});

  void showGalleryPlayBackDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Text('Hello');
          }),
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          // contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
        );
      },
    );
  }
}
