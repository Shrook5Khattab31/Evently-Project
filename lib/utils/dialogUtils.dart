import 'package:evently_project/utils/appColors.dart';
import 'package:evently_project/utils/appStyles.dart';
import 'package:flutter/material.dart';

class DialogUtils{
  static void showLoading({required BuildContext context,
    required String message,
  }){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
            SizedBox(width: 10,),
            Text(message, style: AppStyles.bold20primary,)
          ],
        ),
      ),
    );
  }

  static void hideLoading({required BuildContext context}){
    Navigator.pop(context);
  }

  static void showMessage({ required BuildContext context,
    required String message,
    String? title ,
    String? posActionName, Function? posAction,
    String? negActionName, Function? negAction,
  }){
    List<Widget>? actions =[];
    if(posActionName!=null){
      actions.add(
        TextButton(
          onPressed: (){
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(posActionName,style: AppStyles.bold20primary,)
        )
      );
    }
    if(negActionName!=null){
      actions.add(
        TextButton(
          onPressed: (){
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionName,style: AppStyles.bold20primary,)
        )
      );
    }
    showDialog(context: context,
      builder: (context) => AlertDialog(
        content: Text(message,style: AppStyles.bold20primary,),
        title: Text(title??' ',style: AppStyles.bold20primary,),
        actions: actions,
      ),
    );
  }
}