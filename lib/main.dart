import 'package:flutter/material.dart';

import 'screens/role_selection_screen.dart';

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

      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',

        scaffoldBackgroundColor: const Color(0xFFFFFCF3),

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFC928),
          brightness: Brightness.light,
        ),

        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w700,
            color: Color(0xFF17202A),
          ),
          headlineMedium: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xFF17202A),
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            color: Color(0xFF666666),
          ),
        ),
      ),

      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCF3),

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
                    child: Text(
                      'Wayvora',
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF17202A),
                        letterSpacing: -1,
                      ),
                    ),
                  ),

                  const Spacer(),

                  // ---------------- ICON ----------------
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF1C2),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: const Icon(
                      Icons.directions_bus_rounded,
                      size: 62,
                      color: Color(0xFFFFB800),
                    ),
                  ),

                  const SizedBox(height: 45),

                  // ---------------- TITLE ----------------
                  const Text(
                    'Welcome to Wayvora',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF17202A),
                      letterSpacing: -1,
                    ),
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    'Your campus travel, made simpler.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF777777),
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

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFC928),
                        foregroundColor: const Color(0xFF17202A),

                        elevation: 0,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),

                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // ---------------- FOOTER ----------------
                  const Text(
                    'Smart College Mobility',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF999999),
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