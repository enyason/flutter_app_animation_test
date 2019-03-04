import 'package:flutter/material.dart';
import 'package:flutter_app_animation_test/anim_one.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {'/first': (context) => FirstAnim()},
      debugShowCheckedModeBanner: false,

      home: Scaffold(

          body:Body()

      ),

    );
  }


}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(

        children: <Widget>[

          ListTile(

            title: Text("Animation 1"),
            onTap: () {
              Navigator.of(context).pushNamed('/first');
            },

          )

        ],

      ),
    );
  }
}

