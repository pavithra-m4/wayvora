import 'package:flutter/material.dart';
import '../widgets/wayvora_logo.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

  // ----------------------------------------------------------
  // DYNAMIC GREETING
  // ----------------------------------------------------------
  String getGreeting() {
  final hour = DateTime.now().hour;

  if (hour < 12) {
    return 'Good morning';
  } else if (hour < 16) {
    return 'Good afternoon';
  } else {
    return 'Good evening';
  }
}

  @override
  Widget build(BuildContext context) {
    const Color navy = Color(0xFF142235);
    const Color yellow = Color(0xFFFFBF1F);
    const Color cream = Color(0xFFFFFBF2);
    const Color softYellow = Color(0xFFFFF1C9);
    const Color grey = Color(0xFF777777);

    return Scaffold(
      backgroundColor: cream,

      // --------------------------------------------------------
      // BODY
      // --------------------------------------------------------
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(22, 20, 22, 30),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ==================================================
              // TOP HEADER
              // ==================================================
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          '${getGreeting()} 👋',
                          style: const TextStyle(
                            fontSize: 18,
                            color: grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 4),

                        const WayvoraLogo(
  fontSize: 42,
  showTagline: true,
),

                        const SizedBox(height: 3),

                        const Text(
                          'CAMPUS ON THE MOVE',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: yellow,
                            letterSpacing: 3,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Notification
                  _roundIconButton(
                    icon: Icons.notifications_none_rounded,
                    color: softYellow,
                    iconColor: navy,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Notifications will be available here.',
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(width: 10),

                  // Profile
                  _roundIconButton(
                    icon: Icons.person_outline_rounded,
                    color: yellow,
                    iconColor: navy,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Profile section coming next.',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // ==================================================
              // BUS STATUS CARD
              // ==================================================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: navy,
                  borderRadius: BorderRadius.circular(30),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Card heading
                    Row(
                      children: [

                        const Expanded(
                          child: Text(
                            'YOUR BUS',
                            style: TextStyle(
                              color: Color(0xFFBFC7D3),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF5CC56B),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            'ON ROUTE',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    // Bus information
                    Row(
                      children: [

                        Container(
                          width: 76,
                          height: 76,
                          decoration: BoxDecoration(
                            color: yellow,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: const Icon(
                            Icons.directions_bus_rounded,
                            color: navy,
                            size: 40,
                          ),
                        ),

                        const SizedBox(width: 18),

                        const Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [

                              Text(
                                'Bus Route 01',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),

                              SizedBox(height: 5),

                              Text(
                                'Campus  →  Main Gate',
                                style: TextStyle(
                                  color: Color(0xFFC8CFD9),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    // Arrival
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: const Color(0xFF27364A),
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Row(
                        children: [

                          const Icon(
                            Icons.schedule_rounded,
                            color: yellow,
                            size: 30,
                          ),

                          const SizedBox(width: 15),

                          Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: const [

                              Text(
                                'Next arrival',
                                style: TextStyle(
                                  color: Color(0xFFBFC7D3),
                                  fontSize: 13,
                                ),
                              ),

                              SizedBox(height: 3),

                              Text(
                                '8 mins',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ==================================================
              // QUICK ACCESS
              // ==================================================
              const Text(
                'Quick Access',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w800,
                  color: navy,
                ),
              ),

              const SizedBox(height: 16),

              // First row
              Row(
                children: [

                  Expanded(
                    child: _quickCard(
                      title: 'Track Bus',
                      subtitle: 'Live location',
                      icon: Icons.location_on_outlined,
                      onTap: () {
                        _comingSoon(context, 'Live Bus Tracking');
                      },
                    ),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: _quickCard(
                      title: 'My Route',
                      subtitle: 'View stops',
                      icon: Icons.alt_route_rounded,
                      onTap: () {
                        _comingSoon(context, 'My Route');
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // Second row
              Row(
                children: [

                  Expanded(
                    child: _quickCard(
                      title: 'Bus Timing',
                      subtitle: 'View schedule',
                      icon: Icons.access_time_rounded,
                      onTap: () {
                        _comingSoon(context, 'Bus Timings');
                      },
                    ),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: _quickCard(
                      title: 'Grievance',
                      subtitle: 'Tell manager',
                      icon: Icons.warning_amber_rounded,
                      onTap: () {
                        _comingSoon(context, 'Grievance');
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // ==================================================
              // CURRENT STOP
              // ==================================================
              const Text(
                'Current Stop',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w800,
                  color: navy,
                ),
              ),

              const SizedBox(height: 15),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: yellow,
                    width: 1.5,
                  ),
                ),

                child: Row(
                  children: [

                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        color: softYellow,
                        borderRadius: BorderRadius.circular(19),
                      ),
                      child: const Icon(
                        Icons.location_on_rounded,
                        color: yellow,
                        size: 32,
                      ),
                    ),

                    const SizedBox(width: 15),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [

                          Text(
                            'Main Gate Stop',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w800,
                              color: navy,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            'Bus is expected to stop here',
                            style: TextStyle(
                              fontSize: 13,
                              color: grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      Icons.chevron_right_rounded,
                      color: navy,
                      size: 30,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // ==================================================
              // GRIEVANCE BANNER
              // ==================================================
              GestureDetector(
                onTap: () {
                  _comingSoon(context, 'Grievance');
                },

                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: const Color(0xFFFFE9A8),
                    borderRadius: BorderRadius.circular(25),
                  ),

                  child: Row(
                    children: [

                      Container(
                        width: 62,
                        height: 62,
                        decoration: BoxDecoration(
                          color: yellow,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Icon(
                          Icons.chat_bubble_outline_rounded,
                          color: navy,
                          size: 30,
                        ),
                      ),

                      const SizedBox(width: 15),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [

                            Text(
                              'Have a concern?',
                              style: TextStyle(
                                color: navy,
                                fontSize: 19,
                                fontWeight: FontWeight.w800,
                              ),
                            ),

                            SizedBox(height: 4),

                            Text(
                              'Send a grievance to the manager',
                              style: TextStyle(
                                color: grey,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Icon(
                        Icons.arrow_forward_rounded,
                        color: navy,
                        size: 27,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 35),

              // ==================================================
              // WAYVORA FOOTER
              // ==================================================
              Center(
                child: Column(
                  children: [

                    Container(
                      width: 70,
                      height: 5,
                      decoration: BoxDecoration(
                        color: yellow,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    const SizedBox(height: 14),

                    const WayvoraLogo(
  fontSize: 42,
  showTagline: true,
),

                    const SizedBox(height: 5),

                    const Text(
                      'CAMPUS ON THE MOVE',
                      style: TextStyle(
                        color: grey,
                        fontSize: 10,
                        letterSpacing: 2,
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

  // ============================================================
  // QUICK ACCESS CARD
  // ============================================================
  static Widget _quickCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    const Color navy = Color(0xFF142235);
    const Color yellow = Color(0xFFFFBF1F);
    const Color softYellow = Color(0xFFFFF1C9);
    const Color grey = Color(0xFF777777);

    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 175,
        padding: const EdgeInsets.all(17),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: const Color(0xFFFFD866),
            width: 1.4,
          ),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: softYellow,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(
                icon,
                color: navy,
                size: 29,
              ),
            ),

            const Spacer(),

            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: navy,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: grey,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 3),

            Container(
              width: 28,
              height: 3,
              decoration: BoxDecoration(
                color: yellow,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // HEADER ICON BUTTON
  // ============================================================
  static Widget _roundIconButton({
    required IconData icon,
    required Color color,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: 52,
        height: 52,

        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(17),
        ),

        child: Icon(
          icon,
          color: iconColor,
          size: 27,
        ),
      ),
    );
  }

  // ============================================================
  // COMING SOON
  // ============================================================
  static void _comingSoon(
    BuildContext context,
    String feature,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$feature will be connected next.',
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}