import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late String _timeString;
  late String _meridiemIndicator;
  late String _dateString;
  late String _dayString;

  @override
  void initState() {
    _timeString = _formatTime(DateTime.now());
    _meridiemIndicator = _formatMeridiemIndicator(DateTime.now());
    _dateString = _formatDate(DateTime.now());
    _dayString = _formatDay(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _updateClock());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      margin: const EdgeInsets.all(10),
      width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_timeString,
                  style: Theme.of(context).textTheme.displayLarge),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(_meridiemIndicator,
                    style: GoogleFonts.rubik(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor)),
              ),
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _dayString.toUpperCase(),
                  style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).primaryColor),
                ),
                Text(_dateString)
              ])
        ],
      ),
    ));
  }

  void _updateClock() {
    final DateTime now = DateTime.now();
    setState(() {
      _timeString = _formatTime(now);
      _meridiemIndicator = _formatMeridiemIndicator(now);
      _dateString = _formatDate(now);
      _dayString = _formatDay(now);
    });
  }

  String _formatDay(DateTime day) {
    return DateFormat('E ').format(day);
  }

  String _formatDate(DateTime date) {
    return DateFormat(' MMM dd').format(date);
  }

  String _formatTime(DateTime time) {
    return DateFormat('hh:mm').format(time);
  }

  String _formatMeridiemIndicator(DateTime time) {
    return DateFormat('a').format(time);
  }
}
