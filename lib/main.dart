import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto', useMaterial3: true),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isFollowing = false;
  int _followerCount = 845;

  static const Color kBg      = Color(0xFFFDF6EC);
  static const Color kPrimary = Color(0xFF2E7D52);
  static const Color kAccent  = Color(0xFFE8A020);
  static const Color kRose    = Color(0xFFD45D79);
  static const Color kCard    = Color(0xFFFFFFFA);
  static const Color kText    = Color(0xFF1E1E1E);
  static const Color kMuted   = Color(0xFF7A7A6E);

  void _toggleFollow() {
    setState(() {
      _isFollowing = !_isFollowing;
      _followerCount += _isFollowing ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      appBar: AppBar(
        backgroundColor: kPrimary,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(Icons.settings_outlined, color: Colors.white.withOpacity(0.9)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 110,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: kPrimary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36),
                    ),
                  ),
                ),
                Positioned(
                  top: 54,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: kBg, width: 5),
                          boxShadow: [
                            BoxShadow(
                              color: kPrimary.withOpacity(0.3),
                              blurRadius: 16,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          radius: 44,
                          backgroundImage: AssetImage('assets/profile.jpg'),
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        right: 4,
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            color: kAccent,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 64),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const Text(
                    'Shahrin Rahman Samah',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: kText,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                    decoration: BoxDecoration(
                      color: kAccent.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '🎨  UI/UX Designer',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFFA8720A),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  _StatBox(value: '10', label: 'Projects', bg: kPrimary.withOpacity(0.1), valueColor: kPrimary),
                  const SizedBox(width: 10),
                  _StatBox(value: '$_followerCount', label: 'Followers', bg: kRose.withOpacity(0.1), valueColor: kRose),
                  const SizedBox(width: 10),
                  _StatBox(value: '1.5 yrs', label: 'Experience', bg: kAccent.withOpacity(0.12), valueColor: Color(0xFFA8720A)),
                ],
              ),
            ),

            const SizedBox(height: 18),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: GestureDetector(
                      onTap: _toggleFollow,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: _isFollowing ? kAccent : kPrimary,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: (_isFollowing ? kAccent : kPrimary).withOpacity(0.35),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                _isFollowing ? Icons.check_circle_outline : Icons.person_add_outlined,
                                color: Colors.white,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _isFollowing ? 'Following' : 'Follow',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: kCard,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: kRose, width: 1.5),
                        boxShadow: [
                          BoxShadow(
                            color: kRose.withOpacity(0.12),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.chat_bubble_outline, color: kRose, size: 18),
                            SizedBox(width: 8),
                            Text(
                              'Message',
                              style: TextStyle(
                                color: kRose,
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: kAccent.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.call_outlined, color: Color(0xFFA8720A), size: 22),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _Section(
                title: 'About Me',
                dot: kPrimary,
                child: const Text(
                  'I design intuitive, human-centered digital experiences. '
                      'Blending visual craft, I turn complex problems into clear, '
                      'delightful interfaces that people actually enjoy using.',
                  style: TextStyle(fontSize: 14, color: kMuted, height: 1.65),
                ),
              ),
            ),

            const SizedBox(height: 14),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _Section(
                title: 'Details',
                dot: kAccent,
                child: Column(
                  children: const [
                    _InfoTile(icon: Icons.alternate_email, label: 'Email',      value: 'srsamah@gmail.com',      color: kPrimary),
                    _InfoTile(icon: Icons.tag,             label: 'Student ID', value: '232-134-015',            color: kRose),
                    _InfoTile(icon: Icons.layers_outlined, label: 'Department', value: 'Software Engineering',   color: Color(0xFFA8720A)),
                    _InfoTile(icon: Icons.school_outlined, label: 'Batch',      value: 'SWE-5th',               color: Color(0xFF4A90A4)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String value;
  final String label;
  final Color bg;
  final Color valueColor;

  const _StatBox({required this.value, required this.label, required this.bg, required this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                value,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: valueColor),
              ),
              const SizedBox(height: 3),
              Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF7A7A6E))),
            ],
          ),
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final Color dot;
  final Widget child;

  const _Section({required this.title, required this.dot, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFA),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.07),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(color: dot, shape: BoxShape.circle),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E1E1E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _InfoTile({required this.icon, required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 17, color: color),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF9A9A8E), fontWeight: FontWeight.w500)),
                const SizedBox(height: 2),
                Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF1E1E1E))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}