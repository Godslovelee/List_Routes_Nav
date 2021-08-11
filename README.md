# List_view_Navigation

using a list view to navigate across multiple routes
# UI

```dart
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







```
A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
