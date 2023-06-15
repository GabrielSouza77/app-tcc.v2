// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  final String text;
  final bool isSelected;
  final ValueChanged<bool> onChanged;

  const CustomRadioButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.isSelected);
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFFF4500),
                  width: 2.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0), // Adjust the padding here
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.isSelected
                        ? const Color(0xFFFF4500)
                        : Colors.transparent,
                  ),
                  child: widget.isSelected
                      ? const Icon(
                          Icons.check,
                          color: Color(0xFFFF4500),
                          size: 16,
                        )
                      : null,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            widget.text,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Graphik',
              color: Color(0xFFFF4500),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
