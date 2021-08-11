import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:new_life/main.dart';

class RandomwordStuff extends StatefulWidget{
  @override
  RandomwordStuffState createState() => RandomwordStuffState();
}

class RandomwordStuffState extends State <RandomwordStuff> {
  final _wordpairthingy = <WordPair>[];
  final _savewordpairs = Set<WordPair>();

  Widget _build_listers() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),

      itemBuilder: (BuildContext context, int item) {
        if (item.isOdd) {
          return Divider();
        }
        final index = item ~/ 2;

        if (index >= _wordpairthingy.length) {
          _wordpairthingy.addAll(generateWordPairs().take(10));
        }
        return _buildrows(_wordpairthingy [index]);
      },

    );
  }

  void push_saved_icon(){
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (BuildContext context){
              final Iterable<ListTile> tiles =
              _savewordpairs.map((WordPair spair){
                return ListTile(
                  title: Text(spair.asPascalCase),
                );
              });

              final List<Widget> divides = ListTile.divideTiles(
                  context: context,
                  tiles: tiles).toList();
              return Scaffold(
                appBar: AppBar(
                  title: Text("Saved thingies"),
                ),
                body: ListView(children: divides,),
              );
            }
        )
    );

  }


  Widget build(BuildContext context) {
    //final MyWordPair = <WordPair>[];
    return Scaffold(
        appBar: AppBar(
          title: Text("Word pair generator"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.list), onPressed: push_saved_icon)
          ],
        ),
        body: _build_listers());
  }

  Widget _buildrows(WordPair wordpairthingy) {

    final Alreadysave = _savewordpairs.contains(wordpairthingy);


    return ListTile(title: Text(
        wordpairthingy.asPascalCase, style: TextStyle(fontSize: 16.0)),
      trailing: Icon(Alreadysave ? Icons.favorite :
      Icons.favorite_border,
        color: Alreadysave ? Colors.red : null,
      ),

      onTap: (){

        setState(() {
          if(Alreadysave){
            _savewordpairs.remove(wordpairthingy);
          }
          else{
            _savewordpairs.add(wordpairthingy);
          }
        });
      },
    );
  }
}