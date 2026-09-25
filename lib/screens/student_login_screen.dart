import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentLoginScreen extends StatefulWidget {
  const StudentLoginScreen({super.key});

  @override
  State<StudentLoginScreen> createState() =>
      _StudentLoginScreenState();
}

class _StudentLoginScreenState
    extends State<StudentLoginScreen> {
  final TextEditingController registrationController =
      TextEditingController();

  final TextEditingController dobController =
      TextEditingController();

  final FocusNode registrationFocus = FocusNode();
  final FocusNode dobFocus = FocusNode();

  bool obscurePassword = true;
  bool isLoading = false;

  static const Color navy = Color(0xFF142333);
  static const Color yellow = Color(0xFFFFBE1B);
  static const Color cream = Color(0xFFFFF8E8);
  static const Color softYellow = Color(0xFFFFF2C9);
  static const Color grey = Color(0xFF707070);

  @override
  void dispose() {
    registrationController.dispose();
    dobController.dispose();
    registrationFocus.dispose();
    dobFocus.dispose();
    super.dispose();
  }

  // ==========================================================================
  // DOB FORMATTER
  //
  // User types:
  // 04022008
  //
  // Automatically becomes:
  // 04/02/2008
  // ==========================================================================

  void _formatDob(String value) {
    final digits = value.replaceAll(RegExp(r'[^0-9]'), '');

    String formatted = '';

    if (digits.length <= 2) {
      formatted = digits;
    } else if (digits.length <= 4) {
      formatted =
          '${digits.substring(0, 2)}/${digits.substring(2)}';
    } else {
      final yearLength =
          digits.length > 8 ? 8 : digits.length;

      formatted =
          '${digits.substring(0, 2)}/'
          '${digits.substring(2, 4)}/'
          '${digits.substring(4, yearLength)}';
    }

    if (formatted != dobController.text) {
      dobController.value = TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(
          offset: formatted.length,
        ),
      );
    }
  }

  // ==========================================================================
  // LOGIN
  // ==========================================================================

  Future<void> _login() async {
    FocusScope.of(context).unfocus();

    final registration =
        registrationController.text.trim();

    final dob = dobController.text.trim();

    if (registration.isEmpty) {
      _showError('Please enter your registration number.');
      return;
    }

    if (dob.isEmpty) {
      _showError('Please enter your date of birth.');
      return;
    }

    if (!RegExp(
      r'^\d{2}/\d{2}/\d{4}$',
    ).hasMatch(dob)) {
      _showError(
        'Enter your date of birth in DD/MM/YYYY format.',
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    // ------------------------------------------------------------------------
    // TEMPORARY
    // Later we will replace this with the college database verification.
    // ------------------------------------------------------------------------

    await Future.delayed(
      const Duration(milliseconds: 800),
    );

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Login details received. Database verification will be connected next.',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: navy,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: const Color(0xFF142333),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCF5),
      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              keyboardDismissBehavior:
                  ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.only(bottom: 35),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  // ==========================================================
                  // TOP BRAND HEADER
                  // ==========================================================

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(
                      28,
                      25,
                      28,
                      30,
                    ),
                    decoration: const BoxDecoration(
                      color: cream,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(65),
                        bottomRight: Radius.circular(65),
                      ),
                    ),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [
                        Container(
                          width: 105,
                          height: 5,
                          decoration: BoxDecoration(
                            color: yellow,
                            borderRadius:
                                BorderRadius.circular(20),
                          ),
                        ),

                        const SizedBox(height: 18),

                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Way',
                                style: GoogleFonts.outfit(
                                  fontSize: 43,
                                  fontWeight: FontWeight.w800,
                                  color: navy,
                                  letterSpacing: -1.5,
                                ),
                              ),
                              TextSpan(
                                text: 'vora',
                                style: GoogleFonts.outfit(
                                  fontSize: 43,
                                  fontWeight: FontWeight.w800,
                                  color: yellow,
                                  letterSpacing: -1.5,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          'CAMPUS ON THE MOVE',
                          style: GoogleFonts.outfit(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: grey,
                            letterSpacing: 3.2,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ==========================================================
                  // LOGIN CONTENT
                  // ==========================================================

                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      28,
                      38,
                      28,
                      0,
                    ),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [
                        // Back button
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.arrow_back_rounded,
                                color: navy,
                                size: 22,
                              ),
                              const SizedBox(width: 7),
                              Text(
                                'Back',
                                style: GoogleFonts.outfit(
                                  color: navy,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 28),

                        Text(
                          'Student Login',
                          style: GoogleFonts.outfit(
                            fontSize: 35,
                            fontWeight: FontWeight.w800,
                            color: navy,
                            letterSpacing: -0.8,
                          ),
                        ),

                        const SizedBox(height: 7),

                        Text(
                          'Welcome back! Login to continue your journey.',
                          style: GoogleFonts.outfit(
                            fontSize: 17,
                            height: 1.35,
                            color: grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        const SizedBox(height: 35),

                        // ====================================================
                        // REGISTRATION NUMBER
                        // ====================================================

                        _fieldLabel(
                          'Registration Number',
                        ),

                        const SizedBox(height: 9),

                        TextField(
                          controller:
                              registrationController,
                          focusNode: registrationFocus,
                          textCapitalization:
                              TextCapitalization.characters,
                          keyboardType:
                              TextInputType.text,
                          textInputAction:
                              TextInputAction.next,
                          onSubmitted: (_) {
                            dobFocus.requestFocus();
                          },
                          style: GoogleFonts.outfit(
                            fontSize: 18,
                            color: navy,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: _inputDecoration(
                            icon: Icons.badge_outlined,
                            hint: 'Enter registration number',
                          ),
                        ),

                        const SizedBox(height: 27),

                        // ====================================================
                        // DATE OF BIRTH
                        // ====================================================

                        _fieldLabel(
                          'Date of Birth',
                        ),

                        const SizedBox(height: 9),

                        TextField(
                          controller: dobController,
                          focusNode: dobFocus,
                          keyboardType:
                              TextInputType.number,
                          textInputAction:
                              TextInputAction.done,
                          obscureText: obscurePassword,

                          // IMPORTANT:
                          // This automatically inserts /
                          // after DD and MM.
                          onChanged: _formatDob,

                          inputFormatters: [
                            FilteringTextInputFormatter
                                .digitsOnly,
                            LengthLimitingTextInputFormatter(
                              8,
                            ),
                          ],

                          style: GoogleFonts.outfit(
                            fontSize: 18,
                            color: navy,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          ),

                          decoration: _inputDecoration(
                            icon: Icons.lock_outline_rounded,
                            hint: 'DD/MM/YYYY',
                          ).copyWith(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscurePassword =
                                      !obscurePassword;
                                });
                              },
                              icon: Icon(
                                obscurePassword
                                    ? Icons
                                        .visibility_outlined
                                    : Icons
                                        .visibility_off_outlined,
                                color: grey,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Helpful instruction
                        Row(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.info_outline_rounded,
                              size: 17,
                              color: yellow,
                            ),
                            const SizedBox(width: 7),
                            Expanded(
                              child: Text(
                                'Enter your date of birth using numbers only. '
                                'The app will automatically add / '
                                'in DD/MM/YYYY format.',
                                style: GoogleFonts.outfit(
                                  fontSize: 13,
                                  height: 1.35,
                                  color: grey,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),

                        // ====================================================
                        // LOGIN BUTTON
                        // ====================================================

                        SizedBox(
                          width: double.infinity,
                          height: 58,
                          child: ElevatedButton(
                            onPressed:
                                isLoading ? null : _login,

                            style: ElevatedButton.styleFrom(
                              backgroundColor: yellow,
                              foregroundColor: navy,
                              disabledBackgroundColor:
                                  yellow.withOpacity(0.55),
                              elevation: 0,
                              shape:
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(18),
                              ),
                            ),

                            child: isLoading
                                ? const SizedBox(
                                    width: 23,
                                    height: 23,
                                    child:
                                        CircularProgressIndicator(
                                      strokeWidth: 2.5,
                                      color: navy,
                                    ),
                                  )
                                : Text(
                                    'LOGIN',
                                    style:
                                        GoogleFonts.outfit(
                                      fontSize: 18,
                                      fontWeight:
                                          FontWeight.w800,
                                      letterSpacing: 1,
                                    ),
                                  ),
                          ),
                        ),

                        const SizedBox(height: 32),

                        // ====================================================
                        // INFO CARD
                        // ====================================================

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: cream,
                            borderRadius:
                                BorderRadius.circular(20),
                            border: Border.all(
                              color: yellow.withOpacity(0.35),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 42,
                                height: 42,
                                decoration:
                                    const BoxDecoration(
                                  color: yellow,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.security_rounded,
                                  color: navy,
                                  size: 22,
                                ),
                              ),

                              const SizedBox(width: 13),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Secure Student Access',
                                      style:
                                          GoogleFonts.outfit(
                                        fontSize: 15,
                                        fontWeight:
                                            FontWeight.w700,
                                        color: navy,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      'Your registration number and date of birth '
                                      'will be verified with the college database.',
                                      style:
                                          GoogleFonts.outfit(
                                        fontSize: 12.5,
                                        height: 1.35,
                                        color: grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 38),

                        // FOOTER
                        Center(
                          child: Column(
                            children: [
                              Container(
                                width: 75,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: yellow,
                                  borderRadius:
                                      BorderRadius.circular(20),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Campus on the move',
                                style:
                                    GoogleFonts.outfit(
                                  fontSize: 14,
                                  color: grey,
                                  letterSpacing: 1.5,
                                  fontWeight:
                                      FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
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

  // ==========================================================================
  // FIELD LABEL
  // ==========================================================================

  Widget _fieldLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.outfit(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: navy,
      ),
    );
  }

  // ==========================================================================
  // INPUT DECORATION
  // ==========================================================================

  InputDecoration _inputDecoration({
    required IconData icon,
    required String hint,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.outfit(
        color: const Color(0xFF9B9B9B),
        fontSize: 16,
      ),

      prefixIcon: Icon(
        icon,
        color: yellow,
        size: 25,
      ),

      filled: true,
      fillColor: Colors.white,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 17,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(
          color: yellow.withOpacity(0.28),
          width: 1.5,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: yellow,
          width: 2,
        ),
      ),
    );
  }
}