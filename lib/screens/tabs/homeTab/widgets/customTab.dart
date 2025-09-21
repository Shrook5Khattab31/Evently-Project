import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  IconData icon;
  String label;
  CustomTab({required this.icon,required this.label});
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(46),
        border:Border.all(color: Theme.of(context).focusColor,width: 1.5),
      ),
      padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.008),
      child: Row(
        children: [
          Icon(icon),
          Text(label).tr()
        ],
      ),
    );
  }
}
