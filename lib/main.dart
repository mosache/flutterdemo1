import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hehe',
      home: Scaffold(
        body: RandomWords()
      ),
    );
  }
}

class RandomWords extends StatefulWidget {

  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('listview'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list),onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context){
        final Iterable<ListTile> tiles = _saved.map(
            (WordPair wp) {
              return ListTile(
                title: Text(wp.asPascalCase,style: _biggerFont,),
              );
            }
        // ignore: missing_return
        );

        final List<Widget> divided = ListTile.divideTiles(tiles: tiles,context: context).toList();

        return Scaffold(
          appBar: AppBar(
            title: Text('saved'),
          ),
          body: ListView(children:divided),
        );
      })
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;

          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair wp) {
    final bool alreadySaved = _saved.contains(wp);
    return ListTile(
      title: Text(wp.asPascalCase,style: _biggerFont),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: (){
        setState(() {
          if (alreadySaved) {
            _saved.remove(wp);
          }else {
            _saved.add(wp);
          }
        });
      },
    );
  }
}