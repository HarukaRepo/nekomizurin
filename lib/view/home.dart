// Made by Fandy Fathurrohman
import 'dart:io';
import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nekomizurin/view/mvcommis.dart';
import 'package:nekomizurin/view/portofolio.dart';

import 'mixcommis.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [
                  const Color.fromARGB(255, 39, 21, 18),
                  const Color.fromARGB(255, 218, 100, 64)
                ]
              : [const Color(0xFFB3E5FC), const Color(0xFFE1BEE7)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://nekomizurincommissions.carrd.co/assets/images/image01.jpg?v=a9502125',
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "Nekomizu Rin's Commission",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      const Shadow(
                        offset: Offset(0, 2),
                        blurRadius: 4,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Mixing and making MV's my hobbies, so I offer cheap prices with standard quality for you that don’t know where to start.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 32),
                _buildGradientButton(
                  text: 'Mixing Commission',
                  icon: Icons.music_note,
                  colors: [const Color(0xFF4DD0E1), const Color(0xFF00ACC1)],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MixCommis()),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _buildGradientButton(
                  text: 'MV Commission',
                  icon: Icons.play_arrow,
                  colors: [const Color(0xFFBA68C8), const Color(0xFFAB47BC)],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MVCommissionPage()),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _buildGradientButton(
                  text: 'Portofolio',
                  icon: Icons.folder_open,
                  colors: [const Color(0xFF8E24AA), const Color(0xFF7B1FA2)],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PortfolioPage()),
                    );
                  },
                ),
                const SizedBox(height: 32),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialIcon(
                      icon: FontAwesomeIcons.twitter,
                      tooltip: 'Twitter',
                      onTap: () => _openSocial('https://x.com/NekomizuRin'),
                    ),
                    const SizedBox(width: 16),
                    _socialIcon(
                      icon: FontAwesomeIcons.instagram,
                      tooltip: 'Instagram',
                      onTap: () =>
                          _openSocial('https://instagram.com/nekomizurin'),
                    ),
                    const SizedBox(width: 16),
                    _socialIcon(
                      icon: FontAwesomeIcons.youtube,
                      tooltip: 'YouTube',
                      onTap: () =>
                          _openSocial('https://youtube.com/@nekomizurin'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGradientButton({
    required String text,
    required IconData icon,
    required List<Color> colors,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        label: Text(
          text,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

Widget _socialIcon({
  required IconData icon,
  required String tooltip,
  required VoidCallback onTap,
}) {
  return Tooltip(
    message: tooltip,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white24,
        ),
        child: FaIcon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    ),
  );
}

void _openSocial(String url) {
  if (Platform.isAndroid) {
    final intent = AndroidIntent(
      action: 'action_view',
      data: url,
      flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
    );
    intent.launch();
  }
}
