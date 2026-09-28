import 'package:flutter/material.dart';

import 'screens/role_selection_screen.dart';
import 'theme/app_theme.dart';
import 'widgets/wayvora_logo.dart';
void main() {
  runApp(const WayvoraApp());
}

class WayvoraApp extends StatelessWidget {
  const WayvoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Wayvora',

      // WAYVORA GLOBAL THEME
      // This replaces the old ThemeData(...) block.
      theme: AppTheme.theme,

      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 38,
                vertical: 30,
              ),

              child: Column(
                children: [
                  // ---------------- LOGO ----------------
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const WayvoraLogo(
  fontSize: 40,
),
                  ),

                  const Spacer(),

                  // ---------------- ICON ----------------
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: AppTheme.lightYellow,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: const Icon(
                      Icons.directions_bus_rounded,
                      size: 62,
                      color: AppTheme.yellow,
                    ),
                  ),

                  const SizedBox(height: 45),

                  // ---------------- TITLE ----------------
                  Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    const Text(
      'Welcome to',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w700,
        color: Color(0xFF17202A),
        letterSpacing: -1,
      ),
    ),

    const SizedBox(height: 4),

    const WayvoraLogo(
      fontSize: 42,
    ),
  ],
),

                  const SizedBox(height: 14),

                  // ---------------- SUBTITLE ----------------
                  Text(
                    'Your campus travel, made simpler.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.grey,
                    ),
                  ),

                  const Spacer(),

                  // ---------------- GET STARTED ----------------
                  SizedBox(
                    width: double.infinity,
                    height: 76,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const RoleSelectionScreen(),
                          ),
                        );
                      },

                      child: const Text(
                        'Get Started',
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // ---------------- FOOTER ----------------
                  Text(
                    'Smart College Mobility',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.grey,
                      letterSpacing: 0.5,
                    ),
                  ),

                  const SizedBox(height: 8),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}