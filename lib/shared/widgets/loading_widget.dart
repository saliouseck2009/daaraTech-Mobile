import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 25.0,
              width: 25.0,
              child: CupertinoActivityIndicator(),
            )
          ],
        ))
      ],
    );
  }
}
