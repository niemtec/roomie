import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:roomie/core/models/bank_holidays.dart';
import 'package:roomie/widgets/base_card.dart';

class NoteableEventCard extends StatefulWidget {
  const NoteableEventCard({Key? key}) : super(key: key);

  @override
  State<NoteableEventCard> createState() => _NoteableEventCardState();
}

class _NoteableEventCardState extends State<NoteableEventCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Events>>(
        future: _getEventsForToday(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return BaseCard(
              cardWidth: 250,
              title: 'Noteable Events Today',
              child: _buildEventCard(snapshot.data!.first),
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }

  Widget _buildEventCard(Events event) {
    return Row(
      children: [
        SizedBox(
          height: 10,
          width: 10,
          child: Icon(
            Icons.circle,
            color: Theme.of(context).primaryColor,
            size: 8,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10, left: 5),
          child: Text(
            event.title,
            style: GoogleFonts.rubik(fontWeight: FontWeight.normal),
          ),
        )
      ],
    );
  }

  Future<List<Events>> _getEventsForToday() async {
    var response =
        await http.get(Uri.parse('https://www.gov.uk/bank-holidays.json'));
    BankHolidays bankHolidays =
        BankHolidays.fromJson(jsonDecode(response.body));
    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return bankHolidays.englandAndWales.events
        .where((element) => element.date == today)
        .toList();
  }
}
