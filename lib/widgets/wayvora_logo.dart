import 'package:flutter/material.dart';

class WayvoraLogo extends StatelessWidget {
  final double fontSize;
  final bool showTagline;

  const WayvoraLogo({
    super.key,
    this.fontSize = 42,
    this.showTagline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Way',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF142338),
                  letterSpacing: -1.8,
                ),
              ),
              TextSpan(
                text: 'vora',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFFFFB91F),
                  letterSpacing: -1.8,
                ),
              ),
            ],
          ),
        ),

        if (showTagline) ...[
          const SizedBox(height: 4),

          const Text(
            'C A M P U S   O N   T H E   M O V E',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF666666),
              letterSpacing: 0.5,
            ),
          ),
        ],
      ],
    );
  }
}