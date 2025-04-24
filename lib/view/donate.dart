// Made by Fandy Fathurrohman
import 'package:flutter/material.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'dart:io';

class Donate extends StatelessWidget {
  const Donate({super.key});

  void _openInBrowser(String url) {
    if (Platform.isAndroid) {
      final intent = AndroidIntent(
        action: 'action_view',
        data: url,
        flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
      );
      intent.launch();
    } else {
      // iOS fallback atau platform lain
      debugPrint("Unsupported platform");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        title: Text(
          "Donate",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Support the Creator",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.favorite, color: Colors.redAccent),
            title: const Text("Donate via Trakteer"),
            trailing: const Icon(Icons.open_in_new),
            onTap: () => _openInBrowser("https://trakteer.id/nekomizu-rin-jeyms"),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.local_cafe, color: Colors.brown),
            title: const Text("Donate via Ko-fi"),
            trailing: const Icon(Icons.open_in_new),
            onTap: () => _openInBrowser("https://ko-fi.com/nekomizurin"),
          ),
        ],
      ),
    );
  }
}
