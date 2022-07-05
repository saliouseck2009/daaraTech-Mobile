import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UtilsScreen{
  static  CustomSnackbar({
    required BuildContext context,
    int duration =2,
    required Color colorBackground,
    required String textType,
    required String description}) {

    return  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor:Colors.transparent,
      elevation: 0,
      duration: Duration(seconds: duration),
      content: Container(
        padding: const EdgeInsets.all(16),
        height: 90,
        decoration:  BoxDecoration(
          color: colorBackground,
          borderRadius: const BorderRadius.all(Radius.circular(20)),

        ),
        child:  Row(
          children: [
            const SizedBox(width: 48,),
            Expanded(
              child: Column(
                children: [
                  Text(textType, style: TextStyle(fontSize:18, color: Colors.white),),

                  Text(description, style: TextStyle(fontSize: 12, color: Colors.white, ), maxLines: 2, overflow: TextOverflow.ellipsis,),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

}