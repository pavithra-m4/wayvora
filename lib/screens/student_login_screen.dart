import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'student_home_screen.dart';
import '../widgets/wayvora_logo.dart';

class StudentLoginScreen extends StatefulWidget {
  const StudentLoginScreen({super.key});

  @override
  State<StudentLoginScreen> createState() => _StudentLoginScreenState();
}

class _StudentLoginScreenState extends State<StudentLoginScreen> {
  // ---------------- COLORS ----------------

  static const Color navy = Color(0xFF132235);
  static const Color yellow = Color(0xFFFFBE1B);
  static const Color cream = Color(0xFFFFFBF2);
  static const Color lightYellow = Color(0xFFFFF3CF);
  static const Color grey = Color(0xFF707070);

  // ---------------- CONTROLLERS ----------------

  final TextEditingController registrationController =
      TextEditingController();

  final TextEditingController dobController = TextEditingController();

  // ---------------- STATE ----------------

  bool obscureDob = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    dobController.addListener(_formatDateOfBirth);
  }

  @override
  void dispose() {
    registrationController.dispose();
    dobController.removeListener(_formatDateOfBirth);
    dobController.dispose();
    super.dispose();
  }

  // ---------------- AUTO DATE FORMAT ----------------
  //
  // User enters:
  // 04022008
  //
  // App automatically changes it to:
  // 04/02/2008
  //

  void _formatDateOfBirth() {
    final text = dobController.text;

    String digits = text.replaceAll('/', '');

    if (digits.length > 8) {
      digits = digits.substring(0, 8);
    }

    String formatted = '';

    if (digits.length <= 2) {
      formatted = digits;
    } else if (digits.length <= 4) {
      formatted =
          '${digits.substring(0, 2)}/${digits.substring(2)}';
    } else {
      formatted =
          '${digits.substring(0, 2)}/${digits.substring(2, 4)}/${digits.substring(4)}';
    }

    if (formatted != text) {
      dobController.value = TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(
          offset: formatted.length,
        ),
      );
    }
  }

  // ---------------- LOGIN ----------------

  void _login() {
    FocusScope.of(context).unfocus();

    final registrationNumber =
        registrationController.text.trim().toUpperCase();

    final dob = dobController.text.trim();

    // Basic validation
    if (registrationNumber.isEmpty) {
      _showMessage('Please enter your registration number.');
      return;
    }

    if (dob.length != 10) {
      _showMessage(
        'Please enter your date of birth in DD/MM/YYYY format.',
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    // Small delay to make the login feel natural.
    Future.delayed(const Duration(milliseconds: 700), () {
      if (!mounted) return;

      setState(() {
        isLoading = false;
      });

      // ------------------------------------------------
      // TEMPORARY LOGIN FOR DEVELOPMENT
      // ------------------------------------------------
      //
      // Later this section will be replaced with:
      //
      // Registration Number + DOB
      //          ↓
      // College Database / API
      //          ↓
      // Verification
      //
      // ------------------------------------------------

      if (registrationNumber == '711725UIT207' &&
          dob == '04/02/2008') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const StudentHomeScreen(),
          ),
        );
      } else {
        _showMessage(
          'Invalid registration number or date of birth.',
        );
      }
    });
  }

  // ---------------- MESSAGE ----------------

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: navy,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }

  // ---------------- UI ----------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(28, 30, 28, 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ---------------- TOP BRAND ----------------

              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(
                  24,
                  22,
                  24,
                  25,
                ),
                decoration: const BoxDecoration(
                  color: lightYellow,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 55,
                      height: 5,
                      decoration: BoxDecoration(
                        color: yellow,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    const SizedBox(height: 20),

                    const WayvoraLogo(
  fontSize: 42,
  showTagline: true,
),
                    const SizedBox(height: 2),

                    Text(
                      'CAMPUS ON THE MOVE',
                      style: GoogleFonts.poppins(
                        color: grey,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 4,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 38),

              // ---------------- TITLE ----------------

              Text(
                'Student Login',
                style: GoogleFonts.poppins(
                  color: navy,
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -1,
                ),
              ),

              const SizedBox(height: 7),

              Text(
                'Welcome back! Login to continue your journey.',
                style: GoogleFonts.poppins(
                  color: grey,
                  fontSize: 16,
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 35),

              // ---------------- REGISTRATION NUMBER ----------------

              Text(
                'Registration Number',
                style: GoogleFonts.poppins(
                  color: navy,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: registrationController,
                textCapitalization: TextCapitalization.characters,
                style: GoogleFonts.poppins(
                  color: navy,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter registration number',
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.grey.shade400,
                    fontSize: 15,
                  ),
                  prefixIcon: const Icon(
                    Icons.badge_outlined,
                    color: yellow,
                    size: 28,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 20,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: BorderSide(
                      color: yellow.withOpacity(0.30),
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: const BorderSide(
                      color: yellow,
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 27),

              // ---------------- DOB ----------------

              Text(
                'Date of Birth',
                style: GoogleFonts.poppins(
                  color: navy,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: dobController,
                keyboardType: TextInputType.number,
                obscureText: obscureDob,
                maxLength: 10,
                style: GoogleFonts.poppins(
                  color: navy,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                ),
                decoration: InputDecoration(
                  hintText: 'DD/MM/YYYY',
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.grey.shade400,
                    fontSize: 15,
                  ),
                  counterText: '',
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: yellow,
                    size: 27,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureDob = !obscureDob;
                      });
                    },
                    icon: Icon(
                      obscureDob
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 20,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: BorderSide(
                      color: yellow.withOpacity(0.30),
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: const BorderSide(
                      color: yellow,
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // ---------------- DOB INFO ----------------

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: yellow,
                    size: 20,
                  ),

                  const SizedBox(width: 9),

                  Expanded(
                    child: Text(
                      'Enter your date of birth using numbers only. '
                      'The app will automatically add / in DD/MM/YYYY format.',
                      style: GoogleFonts.poppins(
                        color: grey,
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // ---------------- LOGIN BUTTON ----------------

              SizedBox(
                width: double.infinity,
                height: 62,
                child: ElevatedButton(
                  onPressed: isLoading ? null : _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: yellow,
                    foregroundColor: navy,
                    disabledBackgroundColor:
                        yellow.withOpacity(0.55),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: isLoading
                      ? const SizedBox(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: navy,
                          ),
                        )
                      : Text(
                          'LOGIN',
                          style: GoogleFonts.poppins(
                            color: navy,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 28),

              // ---------------- SECURITY CARD ----------------

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF8E6),
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: yellow.withOpacity(0.35),
                    width: 1.2,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: yellow,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.shield_outlined,
                        color: navy,
                        size: 27,
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Secure Student Access',
                            style: GoogleFonts.poppins(
                              color: navy,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            'Your registration number and date of birth '
                            'will be verified with the college database.',
                            style: GoogleFonts.poppins(
                              color: grey,
                              fontSize: 12.5,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // ---------------- FOOTER ----------------

              Center(
                child: Column(
                  children: [
                    Container(
                      width: 55,
                      height: 5,
                      decoration: BoxDecoration(
                        color: yellow,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'Campus on the move',
                      style: GoogleFonts.poppins(
                        color: grey,
                        fontSize: 14,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}