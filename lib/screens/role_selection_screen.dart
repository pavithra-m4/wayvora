import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'student_login_screen.dart';
import 'driver_login_screen.dart';
import 'manager_login_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  static const Color navy = Color(0xFF142333);
  static const Color yellow = Color(0xFFFFBE1B);
  static const Color cream = Color(0xFFFFF8E8);
  static const Color softYellow = Color(0xFFFFF2C9);
  static const Color grey = Color(0xFF6B6B6B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCF5),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool isMobile = constraints.maxWidth < 650;

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ----------------------------------------------------------
                  // HEADER
                  // ----------------------------------------------------------
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(
                      isMobile ? 28 : 55,
                      isMobile ? 28 : 42,
                      isMobile ? 28 : 55,
                      isMobile ? 38 : 45,
                    ),
                    decoration: const BoxDecoration(
                      color: cream,
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
                          width: isMobile ? 100 : 145,
                          height: 6,
                          decoration: BoxDecoration(
                            color: yellow,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // WAYVORA BRAND
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Way',
                                style: GoogleFonts.outfit(
                                  fontSize: isMobile ? 44 : 64,
                                  fontWeight: FontWeight.w800,
                                  color: navy,
                                  letterSpacing: -2,
                                ),
                              ),
                              TextSpan(
                                text: 'vora',
                                style: GoogleFonts.outfit(
                                  fontSize: isMobile ? 44 : 64,
                                  fontWeight: FontWeight.w800,
                                  color: yellow,
                                  letterSpacing: -2,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          'CAMPUS ON THE MOVE',
                          style: GoogleFonts.outfit(
                            fontSize: isMobile ? 13 : 17,
                            fontWeight: FontWeight.w600,
                            color: grey,
                            letterSpacing: isMobile ? 4 : 7,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ----------------------------------------------------------
                  // TITLE
                  // ----------------------------------------------------------
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      isMobile ? 28 : 55,
                      isMobile ? 38 : 55,
                      isMobile ? 28 : 55,
                      10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choose how you move',
                          style: GoogleFonts.outfit(
                            fontSize: isMobile ? 28 : 38,
                            fontWeight: FontWeight.w700,
                            color: navy,
                            letterSpacing: -0.5,
                          ),
                        ),

                        const SizedBox(height: 7),

                        Text(
                          'Continue as',
                          style: GoogleFonts.outfit(
                            fontSize: isMobile ? 17 : 20,
                            color: grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  // ----------------------------------------------------------
                  // ROLE CARDS
                  // ----------------------------------------------------------
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 20 : 55,
                    ),
                    child: Column(
                      children: [
                        _RoleCard(
                          icon: Icons.school_rounded,
                          title: 'Student',
                          tagline: 'Travel smarter. Reach safer.',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const StudentLoginScreen(),
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 18),

                        _RoleCard(
                          icon: Icons.directions_bus_rounded,
                          title: 'Driver',
                          tagline: 'Drive safe. Keep everyone moving.',
                          onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const DriverLoginScreen(),
    ),
  );
},
                        ),

                        const SizedBox(height: 18),

                        _RoleCard(
                          icon: Icons.manage_accounts_rounded,
                          title: 'Manager',
                          tagline: 'Manage routes. Move the campus.',
                          onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const ManagerLoginScreen(),
    ),
  );
},
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 45),

                  // ----------------------------------------------------------
                  // FOOTER
                  // ----------------------------------------------------------
                  Center(
                    child: Column(
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
                          style: GoogleFonts.outfit(
                            fontSize: isMobile ? 18 : 21,
                            color: grey,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 28),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  static void _showComingSoon(BuildContext context, String role) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$role login will be available soon.'),
        backgroundColor: navy,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

// ============================================================================
// ROLE CARD
// ============================================================================

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

  static const Color navy = Color(0xFF142333);
  static const Color yellow = Color(0xFFFFBE1B);
  static const Color softYellow = Color(0xFFFFF4D5);
  static const Color grey = Color(0xFF707070);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: yellow,
              width: 1.6,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              // ICON
              Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  color: softYellow,
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Icon(
                  icon,
                  size: 38,
                  color: navy,
                ),
              ),

              const SizedBox(width: 18),

              // TEXT
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.outfit(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: navy,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      tagline,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.outfit(
                        fontSize: 15,
                        height: 1.25,
                        color: grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(height: 9),

                    Container(
                      width: 48,
                      height: 3,
                      decoration: BoxDecoration(
                        color: yellow,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 10),

              // ARROW
              Container(
                width: 58,
                height: 58,
                decoration: const BoxDecoration(
                  color: yellow,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: navy,
                  size: 31,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}