import 'package:flutter/material.dart';

import '../homeTab/widgets/eventsWidget.dart';

class FavTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.directional(top: height*0.019,start: width*0.04,end: width*0.04),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => EventsWidget(),
                separatorBuilder: (context, index) => SizedBox(height: height*0.019,),
                itemCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
