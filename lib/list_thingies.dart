import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(
      items: List<ListItem>.generate(
        5,
            (i) => i % 6 == 0
            ? HeadingItem("Heading $i")
            : jMessageItem("Sender $i", "Message body $i"),
              // TextItem("Sender $i", "Message body "),
      ),
    ),
  );
}


class MyApp extends StatelessWidget {
  final List<ListItem> items;

  MyApp({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Girlytitle = 'Mixed List';

    return MaterialApp(
      //title: 'hey',
      home: Scaffold(
        appBar: AppBar(
          title: Text(Girlytitle),
        ),
        body: ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: items.length,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubtitle(context),
            );
          },
        ),
      ),
    );
  }
}

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      //style: Theme.of(context).textTheme.headline5,
    );
  }

  Widget buildSubtitle(BuildContext context) => Text('hello');
}

/// A ListItem that contains data to display a message.
class jMessageItem implements ListItem {
  final String sender;
  final String body;

  jMessageItem(this.sender, this.body);

  Widget buildTitle(BuildContext context) => Text(sender);

  Widget buildSubtitle(BuildContext context) => Text(body);
}