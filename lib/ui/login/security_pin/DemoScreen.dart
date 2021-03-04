import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget{

  Welcome({
    Key key,
    this.data1,
  }) : super(key: key);
  final String data1;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(title: Text(data1),centerTitle: true,),
    );
  }

}