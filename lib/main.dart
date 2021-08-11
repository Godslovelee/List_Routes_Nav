import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:new_life/next_page.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      routes: {
        '/': (context) => MyHomePage(),
        '/firstCategory': (context) => FirstCategory(),
        '/secondCategory': (context) => SecondCategory(),
        '/thirdCategory': (context) => ThirdCategory(),
        '/fourthCategory' : (context) => FourthCatergory()
      },
    );
  }
}

class SecondCategory extends StatelessWidget {
  const SecondCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("second"),
    );
  }
}

class FirstCategory extends StatelessWidget {
  const FirstCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text("First"));
  }
}

class ThirdCategory extends StatelessWidget{
  const ThirdCategory ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Third"));

  }



}
class FourthCatergory extends StatelessWidget{
  const FourthCatergory({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container( child: Text("Fourth"),);

  }
}




class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final category = [
    'firstCategory',
    'secondCategory',
    'thirdCategory',
    'fourthCategory'

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Helloson"),
        ),
        body: ListView.builder(
        itemCount: 4,
          itemBuilder: (context, index) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/${category[index]}');
                  },
                  child: Text(
                    index.toString(),
                    textScaleFactor: 5.0,
                  ),
                ),
              ),
            );
          },
        ));
  }
}





