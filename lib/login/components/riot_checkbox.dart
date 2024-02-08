import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RiotCheckbox extends StatefulWidget {
  const RiotCheckbox({super.key});

  @override
  State<RiotCheckbox> createState() => _RiotCheckboxState();
}

class _RiotCheckboxState extends State<RiotCheckbox> {
  bool isChecked = true;

  void toggleChecked() {
    setState(() {
      isChecked = !isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: toggleChecked,
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            padding: const EdgeInsets.all(2),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color:
                  isChecked ? const Color(0xFFb32f32) : const Color(0xFFe3e3e3),
            ),
            child: isChecked
                ? const FittedBox(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  )
                : null,
          ),
          const SizedBox(
            width: 9,
          ),
          Text(
            "Manter login",
            style: GoogleFonts.lexendDeca(
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
