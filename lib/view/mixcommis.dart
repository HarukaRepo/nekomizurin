// Made by Fandy Fathurrohman
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nekomizurin/view/portofolio.dart';

class MixCommis extends StatelessWidget {
  const MixCommis({super.key});

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _assetImage(String path) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Image.asset(
      path,
      fit: BoxFit.cover,
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
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [
                    const Color.fromARGB(255, 39, 21, 18),
                    const Color.fromARGB(255, 218, 100, 64),
                  ]
                : [
                    const Color(0xFFB3E5FC),
                    const Color(0xFFE1BEE7),
                  ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "MIXING COMMISSION",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _sectionTitle("Price List"),
                const SizedBox(height: 8),
                _assetImage("assets/image/price.jpg"),
                const SizedBox(height: 12),
                Text(
                  "*Note Choir Pack",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "> 5 vocalists = 50K/orang\n> 10 vocalists = 40K/orang",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 24),
                _sectionTitle("Terms of Services"),
                const SizedBox(height: 8),
                _assetImage("assets/image/terms.jpg"),
                const SizedBox(height: 24),
                _sectionTitle("Notes"),
                const SizedBox(height: 8),
                _assetImage("assets/image/notes.jpg"),
                const SizedBox(height: 32),
                _gradientButton(
                  icon: Icons.folder_open,
                  text: "Portofolio",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PortfolioPage()),
                    );
                  },
                  colors: [const Color(0xFF8E24AA), const Color(0xFF7B1FA2)],
                ),
                const SizedBox(height: 16),
                _gradientButton(
                  icon: Icons.home,
                  text: "Home",
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
