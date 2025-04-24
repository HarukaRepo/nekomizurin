// Made by Fandy Fathurrohman
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nekomizurin/components/video_section.dart';


class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  Widget _title(String text, double fontSize) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _gradientButton({
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

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _title("PORTOFOLIO", 24),
                const SizedBox(height: 16),
                _title("MIXING", 18),
                const SizedBox(height: 12),
                const VideoSection(title: "Solo", urls: [
                  "https://www.youtube.com/embed/YjVCLKXToJQ",
                  "https://www.youtube.com/embed/WjywwW0bQQQ",
                ]),
                const VideoSection(title: "Short/TV Size", urls: [
                  "https://www.youtube.com/embed/-XKDwHh8vnc&t",
                ]),
                const VideoSection(title: "Duo", urls: [
                  "https://www.youtube.com/embed/0ffneAYwbko&t",
                ]),
                const VideoSection(title: "Choir", urls: [
                  "https://www.youtube.com/embed/3KiepGrVTmo&t",
                ]),
                const SizedBox(height: 32),
                _title("MV", 18),
                const SizedBox(height: 16),
                const VideoSection(title: "Advance MV", urls: [
                  "https://www.youtube.com/embed/8krQkcmF-i4&t",
                  "https://www.youtube.com/embed/3KiepGrVTmo",
                  "https://www.youtube.com/embed/bjZ-GwipPrU&t",
                  "https://www.youtube.com/embed/YjVCLKXToJQ&t",
                ]),
                const VideoSection(title: "Simple MV", urls: [
                  "https://www.youtube.com/embed/tHu-VuosGLY&t",
                ]),
                const SizedBox(height: 32),
                _gradientButton(
                  icon: Icons.home,
                  text: "Home",
                  onPressed: () => Navigator.pop(context),
                  colors: [const Color(0xFFFF7043), const Color(0xFFFFA726)],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}