// Made by Fandy Fathurrohman
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MVCommissionPage extends StatelessWidget {
  const MVCommissionPage({super.key});

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        shadows: const [
          Shadow(
            offset: Offset(1, 1),
            color: Colors.black26,
            blurRadius: 2,
          )
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _bulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("• ", style: TextStyle(color: Colors.white, fontSize: 14)),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "MV COMMISSION",
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4,
                            color: Colors.white,
                            shadows: const [
                              Shadow(
                                offset: Offset(1, 2),
                                color: Colors.black26,
                                blurRadius: 3,
                              )
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Price List",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _sectionTitle("SIMPLE MV (100k)"),
                        const SizedBox(height: 8),
                        _bulletPoint("Simple motion/text movements"),
                        _bulletPoint("No Effect"),
                        _bulletPoint("Durasi 3-6 menit"),
                        _bulletPoint("3x Revisi"),
                        _bulletPoint("1-2 minggu"),
                        const SizedBox(height: 24),
                        _sectionTitle("ADVANCE MV (250k)"),
                        const SizedBox(height: 8),
                        _bulletPoint("Advance text/camera movements"),
                        _bulletPoint("With effect"),
                        _bulletPoint("Durasi 3-6 menit"),
                        _bulletPoint("4x Revisi"),
                        _bulletPoint("2-3 minggu"),
                        const SizedBox(height: 50),
                        _gradientButton(
                          icon: Icons.home,
                          text: "Home",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          colors: [
                            const Color(0xFFFF7043),
                            const Color(0xFFFFA726)
                          ],
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
