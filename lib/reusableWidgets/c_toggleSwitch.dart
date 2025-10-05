import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../utils/appColors.dart';

typedef OnToggle =void Function(int?)?;
class C_ToggleSwitch extends StatelessWidget {
  int selectedIndex;
  OnToggle onToggle;
  List<Widget> icons;
  AlignmentGeometry? alignment;
  C_ToggleSwitch({
    required this.selectedIndex,
    required this.onToggle,
    required this.icons,
    this.alignment,
  });
  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Align(
      alignment: alignment??AlignmentDirectional.center,
      child: ToggleSwitch(
        minWidth: width*0.1,
        minHeight: height*0.03,
        borderWidth: 2,
        cornerRadius: 40,
        borderColor: [AppColors.primaryColor],
        activeBgColors: [[AppColors.primaryColor],[AppColors.primaryColor]],
        activeFgColor: Theme.of(context).primaryColor,
        inactiveBgColor: Theme.of(context).scaffoldBackgroundColor,
        totalSwitches: 2,
        initialLabelIndex: selectedIndex,
        customWidgets: icons,
        radiusStyle: true,
        onToggle: onToggle,
      ),
    );
  }
}
