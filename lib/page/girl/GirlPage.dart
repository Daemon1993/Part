
import 'package:dpart/widget/base_widget/MyAppBar.dart';
import 'package:flutter/material.dart';

class GirlPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GirlPage();
  }
}

class _GirlPage extends State<GirlPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar(
        title: Text('福利'),
      ),
      body: GridView.builder(gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 10,crossAxisSpacing: 5),
          itemBuilder: (context,index){
            return Container(
              height: 80,
              color: Colors.primaries[index % Colors.primaries.length],
            );
          },
        itemCount: 50,
      ),
    );
  }

}