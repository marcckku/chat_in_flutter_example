import 'package:chat/chat/chat_bloc.dart';
import 'package:chat/theme/MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'chat/chat_view.dart';
import 'chat/details/chat_detail_page__bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatBloc>(
          create: (BuildContext context) => ChatBloc(),
        ),
        BlocProvider<ChatDetailPageBloc>(
          create: (BuildContext context) => ChatDetailPageBloc(),
        ),
      ], child:  MaterialApp(
       localizationsDelegates: [
         GlobalMaterialLocalizations.delegate,
         GlobalWidgetsLocalizations.delegate,
       ],
      supportedLocales: [
        const Locale('it'),
        const Locale('en'),
        const Locale('fr', 'BE'),
        const Locale('fr', 'CA'),
        const Locale('de'),
      ],
      locale: const Locale('it'),
      title: 'Chat', theme: appTheme(),
      home: ChatApp(),
    ),
    );
    
   //return MaterialApp(
   //  title: 'Flutter Demo',
   //  theme: ThemeData(
   //    primarySwatch: Colors.blue,
   //  ),
   //  home: MyHomePage(title: 'Flutter Demo Home Page'),
   //);
    //
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
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
