import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'student_login_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  static const Color dark = Color(0xFF17212B);
  static const Color yellow = Color(0xFFFFBE24);
  static const Color softYellow = Color(0xFFFFF4D6);
  static const Color background = Color(0xFFFFFCF5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ==================================================
              // HEADER
              // ==================================================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(
                  36,
                  38,
                  36,
                  42,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFF1C9),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(90),
                    bottomRight: Radius.circular(90),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Yellow accent
                    Container(
                      width: 145,
                      height: 6,
                      decoration: BoxDecoration(
                        color: yellow,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Wayvora
                    Text(
                      'Wayvora',
                      style: GoogleFonts.poppins(
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                        color: dark,
                        letterSpacing: -1.5,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Header tagline
                    Text(
                      'C A M P U S   O N   T H E   M O V E',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF666666),
                        letterSpacing: 2.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 38),

              // ==================================================
              // ROLE CARDS
              // ==================================================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 34),
                child: Column(
                  children: [
                    // ---------------- STUDENT ----------------
                    _RoleCard(
                      icon: Icons.school_rounded,
                      title: 'Student',
                      tagline: 'Travel smarter. Reach safer.',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const StudentLoginScreen(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 30),

                    // ---------------- DRIVER ----------------
                    _RoleCard(
                      icon: Icons.directions_bus_rounded,
                      title: 'Driver',
                      tagline: 'Drive safe. Keep everyone moving.',
                      onTap: () {
                        _showComingSoon(context, 'Driver');
                      },
                    ),

                    const SizedBox(height: 30),

                    // ---------------- MANAGER ----------------
                    _RoleCard(
                      icon: Icons.manage_accounts_rounded,
                      title: 'Manager',
                      tagline: 'Manage routes. Move the campus.',
                      onTap: () {
                        _showComingSoon(context, 'Manager');
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 55),

              // ==================================================
              // FOOTER
              // ==================================================
              Column(
                children: [
                  Container(
                    width: 90,
                    height: 5,
                    decoration: BoxDecoration(
                      color: yellow,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  const SizedBox(height: 18),

                  Text(
                    'Campus on the move',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF666666),
                      letterSpacing: 1.2,
                    ),
                  ),

                  const SizedBox(height: 35),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // TEMPORARY DRIVER / MANAGER MESSAGE
  // ============================================================

  static void _showComingSoon(
    BuildContext context,
    String role,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$role login coming next',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: dark,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}

// ============================================================
// ROLE CARD
// ============================================================

class _RoleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String tagline;
  final VoidCallback onTap;

  const _RoleCard({
    required this.icon,
    required this.title,
    required this.tagline,
    required this.onTap,
  });

  static const Color dark = Color(0xFF17212B);
  static const Color yellow = Color(0xFFFFBE24);
  static const Color softYellow = Color(0xFFFFF4D6);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(28),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 25,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: yellow,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              // ==================================================
              // ICON
              // ==================================================

              Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  color: softYellow,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Icon(
                  icon,
                  size: 42,
                  color: dark,
                ),
              ),

              const SizedBox(width: 30),

              // ==================================================
              // TITLE + TAGLINE
              // ==================================================

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 27,
                        fontWeight: FontWeight.w700,
                        color: dark,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      tagline,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF707070),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Small yellow accent
                    Container(
                      width: 55,
                      height: 4,
                      decoration: BoxDecoration(
                        color: yellow,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 20),

              // ==================================================
              // ARROW
              // ==================================================

              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  color: yellow,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: dark,
                  size: 34,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}