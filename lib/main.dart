import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roomie/widgets/clock_card.dart';
import 'package:roomie/widgets/noteable_event_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roomie',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          cardTheme: CardTheme(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          textTheme: TextTheme(
              displayLarge:
                  GoogleFonts.rubik(fontSize: 70, color: Colors.black))),
      home: const MyHomePage(title: 'Roomie'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[ClockCard(), NoteableEventCard()],
        ),
      ),
    );
  }
}
