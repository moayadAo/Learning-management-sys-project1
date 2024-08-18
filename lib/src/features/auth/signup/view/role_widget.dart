import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class roleWidget extends StatelessWidget {
  final String title;
  final Color? borderColor;
  final String image;
  final String description;
  final void Function() tap;
  const roleWidget(
      {super.key,
      required this.borderColor,
      required this.tap,
      required this.image,
      required this.description,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        width: double.infinity,
        // height: 150,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor!, width: 3),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Image.asset(
              image,
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height / 4,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 20,
                            color: borderColor,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none)),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
