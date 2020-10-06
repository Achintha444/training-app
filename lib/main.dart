import 'package:flutter/material.dart';
import 'package:training_app/diary_card.dart';
import 'package:training_app/diary_home.dart';
import 'package:training_app/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              children: [
                DiaryHome(),
                Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
                DiaryCard(
                  title: 'This is the title',
                  subTitle:
                      'This is the subtitle This is the title This is the title This is the title This is the title This is the title',
                  desc:
                      'This is the desc This is the desc This is the desc This is the desc This is the desc This is the desc This is the desc',
                ),
              ]
              // child: Column(
              //   // Column is also a layout widget. It takes a list of children and
              //   // arranges them vertically. By default, it sizes itself to fit its
              //   // children horizontally, and tries to be as tall as its parent.
              //   //
              //   // Invoke "debug painting" (press "p" in the console, choose the
              //   // "Toggle Debug Paint" action from the Flutter Inspector in Android
              //   // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              //   // to see the wireframe for each widget.
              //   //
              //   // Column has various properties to control how it sizes itself and
              //   // how it positions its children. Here we use mainAxisAlignment to
              //   // center the children vertically; the main axis here is the vertical
              //   // axis because Columns are vertical (the cross axis would be
              //   // horizontal).
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Text(
              //       'You have pushed the button this many times:',
              //     ),
              //     Text(
              //       '$_counter',
              //       style: Theme.of(context).textTheme.headline4,
              //     ),
              //   ],
              // ),
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
