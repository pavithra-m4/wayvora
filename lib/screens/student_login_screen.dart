import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentLoginScreen extends StatefulWidget {
  const StudentLoginScreen({super.key});

  @override
  State<StudentLoginScreen> createState() => _StudentLoginScreenState();
}

class _StudentLoginScreenState extends State<StudentLoginScreen> {
  final TextEditingController registrationController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    registrationController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // ============================================================
  // LOGIN
  // ============================================================

  void login() {
    final registrationNumber =
        registrationController.text.trim();

    final password =
        passwordController.text.trim();

    // Registration number validation
    if (registrationNumber.isEmpty) {
      _showMessage(
        'Please enter your registration number.',
      );
      return;
    }

    // DOB validation
    if (password.isEmpty) {
      _showMessage(
        'Please enter your date of birth.',
      );
      return;
    }

    // Exact format: DD/MM/YYYY
    final dobPattern = RegExp(
      r'^(0[1-9]|[12][0-9]|3[01])/'
      r'(0[1-9]|1[0-2])/'
      r'\d{4}$',
    );

    if (!dobPattern.hasMatch(password)) {
      _showMessage(
        'Enter your date of birth in DD/MM/YYYY format.',
      );
      return;
    }

    // Temporary login
    // Later this will be connected to the college database.
    _showMessage(
      'Login successful!',
    );
  }

  // ============================================================
  // MESSAGE
  // ============================================================

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: const Color(0xFF17212B),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color dark = Color(0xFF17212B);
    const Color yellow = Color(0xFFFFBE24);
    const Color background = Color(0xFFFFFCF5);
    const Color softYellow = Color(0xFFFFF4D6);

    return Scaffold(
      backgroundColor: background,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 20,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // =================================================
                // BACK BUTTON
                // =================================================

                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: dark,
                    size: 28,
                  ),
                ),

                const SizedBox(height: 8),

                // =================================================
                // WAYVORA
                // =================================================

                Center(
                  child: Text(
                    'Wayvora',
                    style: GoogleFonts.poppins(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: dark,
                      letterSpacing: -1,
                    ),
                  ),
                ),

                const SizedBox(height: 4),

                Center(
                  child: Text(
                    'C A M P U S   O N   T H E   M O V E',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF777777),
                      letterSpacing: 2,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // =================================================
                // STUDENT AESTHETIC PANEL
                // =================================================

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 22,
                    horizontal: 20,
                  ),

                  decoration: BoxDecoration(
                    color: softYellow,
                    borderRadius: BorderRadius.circular(28),
                  ),

                  child: Row(
                    children: [

                      // BOOK
                      Container(
                        width: 68,
                        height: 68,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(19),
                        ),

                        child: const Icon(
                          Icons.menu_book_rounded,
                          size: 37,
                          color: yellow,
                        ),
                      ),

                      const SizedBox(width: 16),

                      // TEXT
                      Expanded(
                        child: Text(
                          'Your campus journey starts here.',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: dark,
                          ),
                        ),
                      ),

                      // LAPTOP
                      const Icon(
                        Icons.laptop_mac_rounded,
                        size: 45,
                        color: dark,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // =================================================
                // TITLE
                // =================================================

                Text(
                  'Student Login',
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: dark,
                    letterSpacing: -0.5,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  'Welcome back! Login to continue your journey.',
                  style: GoogleFonts.poppins(
                    fontSize: 14.5,
                    color: const Color(0xFF707070),
                  ),
                ),

                const SizedBox(height: 28),

                // =================================================
                // REGISTRATION NUMBER LABEL
                // =================================================

                Text(
                  'Registration Number',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: dark,
                  ),
                ),

                const SizedBox(height: 8),

                // =================================================
                // REGISTRATION NUMBER FIELD
                // =================================================

                TextField(
                  controller: registrationController,

                  textCapitalization:
                      TextCapitalization.characters,

                  decoration: InputDecoration(
                    hintText:
                        'Enter your registration number',

                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      color: const Color(0xFFAAAAAA),
                    ),

                    prefixIcon: const Icon(
                      Icons.badge_outlined,
                      color: yellow,
                    ),

                    filled: true,
                    fillColor: Colors.white,

                    contentPadding:
                        const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 18,
                    ),

                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(17),
                      borderSide: BorderSide.none,
                    ),

                    enabledBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(17),
                      borderSide: const BorderSide(
                        color: Color(0xFFE9DFAF),
                      ),
                    ),

                    focusedBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(17),
                      borderSide: const BorderSide(
                        color: yellow,
                        width: 2,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // =================================================
                // PASSWORD LABEL
                // =================================================

                Text(
                  'Password',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: dark,
                  ),
                ),

                const SizedBox(height: 8),

                // =================================================
                // PASSWORD / DOB FIELD
                // =================================================

                TextField(
                  controller: passwordController,

                  obscureText: obscurePassword,

                  keyboardType:
                      TextInputType.datetime,

                  decoration: InputDecoration(
                    hintText: 'DD/MM/YYYY',

                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      color: const Color(0xFFAAAAAA),
                    ),

                    prefixIcon: const Icon(
                      Icons.lock_outline_rounded,
                      color: yellow,
                    ),

                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscurePassword =
                              !obscurePassword;
                        });
                      },

                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color:
                            const Color(0xFF777777),
                      ),
                    ),

                    filled: true,
                    fillColor: Colors.white,

                    contentPadding:
                        const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 18,
                    ),

                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(17),
                      borderSide: BorderSide.none,
                    ),

                    enabledBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(17),
                      borderSide: const BorderSide(
                        color: Color(0xFFE9DFAF),
                      ),
                    ),

                    focusedBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(17),
                      borderSide: const BorderSide(
                        color: yellow,
                        width: 2,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // =================================================
                // DOB FORMAT INFORMATION
                // =================================================

                Text(
                  'Enter your date of birth in DD/MM/YYYY format.',
                  style: GoogleFonts.poppins(
                    fontSize: 11.5,
                    color: const Color(0xFF888888),
                  ),
                ),

                const SizedBox(height: 25),

                // =================================================
                // LOGIN BUTTON
                // =================================================

                SizedBox(
                  width: double.infinity,
                  height: 58,

                  child: ElevatedButton(
                    onPressed: login,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: yellow,
                      foregroundColor: dark,
                      elevation: 0,

                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(18),
                      ),
                    ),

                    child: Text(
                      'LOGIN',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}