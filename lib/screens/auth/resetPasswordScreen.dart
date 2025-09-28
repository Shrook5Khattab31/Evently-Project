import 'package:easy_localization/easy_localization.dart';
import 'package:evently_project/reusableWidgets/c_elevatedButton.dart';
import 'package:evently_project/utils/appAssets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/appLanguageProvider.dart';
import '../../utils/appStyles.dart';

class ResetPasswordScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height*0.076,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)
        ),
        title: Text('reset_pass',style: AppStyles.regular22primary,).tr(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*0.04),
        child: Column(
          spacing: height*0.02,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.resetPassImg),
            C_elevatedButton(text: 'reset_password_button', onPressed: (){}),
          ],
        ),
      ),
    );
  }
}
