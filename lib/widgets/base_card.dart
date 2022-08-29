import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseCard extends StatelessWidget {
  BaseCard(
      {Key? key,
      required this.child,
      required this.cardWidth,
      this.title,
      this.refreshFunction})
      : super(key: key);
  Widget child;
  double cardWidth;
  String? title;
  void Function()? refreshFunction;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      margin: const EdgeInsets.all(10),
      width: cardWidth,
      child: Column(
        children: [
          if (title != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title!.toUpperCase(),
                  style: GoogleFonts.rubik(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
                if (refreshFunction != null)
                  GestureDetector(
                    onTap: refreshFunction,
                    child: const Icon(
                      Icons.refresh,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
              ],
            ),
          child,
        ],
      ),
    ));
  }
}
