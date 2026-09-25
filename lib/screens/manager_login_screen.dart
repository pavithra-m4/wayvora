import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ManagerLoginScreen extends StatefulWidget {
  const ManagerLoginScreen({super.key});

  @override
  State<ManagerLoginScreen> createState() => _ManagerLoginScreenState();
}

class _ManagerLoginScreenState extends State<ManagerLoginScreen> {
  final TextEditingController managerIdController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  final FocusNode managerIdFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  bool obscurePassword = true;
  bool isLoading = false;

  static const Color navy = Color(0xFF142333);
  static const Color yellow = Color(0xFFFFBE1B);
  static const Color cream = Color(0xFFFFF8E8);
  static const Color grey = Color(0xFF707070);

  @override
  void dispose() {
    managerIdController.dispose();
    passwordController.dispose();
    managerIdFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    FocusScope.of(context).unfocus();

    final managerId = managerIdController.text.trim();
    final password = passwordController.text.trim();

    if (managerId.isEmpty) {
      _showError('Please enter your Manager ID.');
      return;
    }

    if (password.isEmpty) {
      _showError('Please enter your password.');
      return;
    }

    setState(() {
      isLoading = true;
    });

    // Temporary login simulation.
    // Database authentication will be connected later.
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
          'Manager login details received. Database verification will be connected later.',
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
        backgroundColor: navy,
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
        child: SingleChildScrollView(
          keyboardDismissBehavior:
              ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.only(bottom: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ============================================================
              // HEADER
              // ============================================================

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 105,
                      height: 5,
                      decoration: BoxDecoration(
                        color: yellow,
                        borderRadius: BorderRadius.circular(20),
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

              // ============================================================
              // CONTENT
              // ============================================================

              Padding(
                padding: const EdgeInsets.fromLTRB(
                  28,
                  38,
                  28,
                  0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // BACK
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

                    // MANAGER ICON
                    Container(
                      width: 62,
                      height: 62,
                      decoration: const BoxDecoration(
                        color: yellow,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.manage_accounts_rounded,
                        color: navy,
                        size: 32,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      'Manager Login',
                      style: GoogleFonts.outfit(
                        fontSize: 35,
                        fontWeight: FontWeight.w800,
                        color: navy,
                        letterSpacing: -0.8,
                      ),
                    ),

                    const SizedBox(height: 7),

                    Text(
                      'Login to manage routes, buses, drivers and campus transport.',
                      style: GoogleFonts.outfit(
                        fontSize: 17,
                        height: 1.35,
                        color: grey,
                      ),
                    ),

                    const SizedBox(height: 35),

                    // ======================================================
                    // MANAGER ID
                    // ======================================================

                    _fieldLabel('Manager ID'),

                    const SizedBox(height: 9),

                    TextField(
                      controller: managerIdController,
                      focusNode: managerIdFocus,
                      keyboardType: TextInputType.text,
                      textCapitalization:
                          TextCapitalization.characters,
                      textInputAction: TextInputAction.next,
                      onSubmitted: (_) {
                        passwordFocus.requestFocus();
                      },
                      style: GoogleFonts.outfit(
                        fontSize: 18,
                        color: navy,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: _inputDecoration(
                        icon: Icons.admin_panel_settings_outlined,
                        hint: 'Enter Manager ID',
                      ),
                    ),

                    const SizedBox(height: 27),

                    // ======================================================
                    // PASSWORD
                    // ======================================================

                    _fieldLabel('Password'),

                    const SizedBox(height: 9),

                    TextField(
                      controller: passwordController,
                      focusNode: passwordFocus,
                      obscureText: obscurePassword,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => _login(),
                      style: GoogleFonts.outfit(
                        fontSize: 18,
                        color: navy,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: _inputDecoration(
                        icon: Icons.lock_outline_rounded,
                        hint: 'Enter password',
                      ).copyWith(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: grey,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // ======================================================
                    // LOGIN BUTTON
                    // ======================================================

                    SizedBox(
                      width: double.infinity,
                      height: 58,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: yellow,
                          foregroundColor: navy,
                          disabledBackgroundColor:
                              yellow.withOpacity(0.55),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: isLoading
                            ? const SizedBox(
                                width: 23,
                                height: 23,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  color: navy,
                                ),
                              )
                            : Text(
                                'LOGIN',
                                style: GoogleFonts.outfit(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1,
                                ),
                              ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // ======================================================
                    // INFO CARD
                    // ======================================================

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: cream,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: yellow.withOpacity(0.35),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 42,
                            height: 42,
                            decoration: const BoxDecoration(
                              color: yellow,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.admin_panel_settings_rounded,
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
                                  'Secure Manager Access',
                                  style: GoogleFonts.outfit(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: navy,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  'Your Manager ID and password will be '
                                  'verified with the transport database.',
                                  style: GoogleFonts.outfit(
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
                            style: GoogleFonts.outfit(
                              fontSize: 14,
                              color: grey,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w500,
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
        ),
      ),
    );
  }

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