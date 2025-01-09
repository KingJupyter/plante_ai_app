import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  Future<void> _shareApp() async {
    await Share.share(
        'Check out flutter_application_1 - Download now from the app store!');
  }

  Future<void> _rateApp() async {
    final Uri url = Uri.parse('market://details?id=com.flutter_application_1');
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      final fallbackUrl = Uri.parse(
          'https://play.google.com/store/apps/details?id=com.flutter_application_1');
      if (await canLaunchUrl(fallbackUrl)) {
        await launchUrl(fallbackUrl);
      }
    }
  }

  Future<void> _handleLogout(BuildContext context) async {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black),
          iconSize: 30,
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      _buildSettingButton(
                        "Privacy & Policy",
                        onPressed: () {
                          Navigator.pushNamed(context, '/privacy-policy');
                        },
                      ),
                      const SizedBox(height: 10),
                      _buildSettingButton(
                        "Terms & Conditions",
                        onPressed: () {
                          Navigator.pushNamed(context, '/terms');
                        },
                      ),
                      const SizedBox(height: 10),
                      _buildSettingButton(
                        "Support",
                        onPressed: () {
                          Navigator.pushNamed(context, '/support');
                        },
                        showChevron: false,
                      ),
                      const SizedBox(height: 10),
                      _buildSettingButton(
                        "Logout",
                        onPressed: () => _handleLogout(context),
                      ),
                    ],
                  ),
                ),
              ),
              _buildBottomButtons(context),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: _shareApp,
              icon: const Icon(
                Icons.share,
                color: Colors.green,
                size: 20,
              ),
              label: const Text("Share",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  )),
              style: _buttonStyle(),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: _rateApp,
              icon: const Icon(
                Icons.star_rate_rounded,
                color: Colors.green,
                size: 20,
              ),
              label: const Text("Rate",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  )),
              style: _buttonStyle(),
            ),
          ),
        ],
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 12),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.green, width: 1),
      ),
    );
  }

  Widget _buildSettingButton(
    String title, {
    required VoidCallback onPressed,
    bool showChevron = true,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(15),
          elevation: 0,
          side: const BorderSide(color: Colors.grey, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 20)),
            if (showChevron)
              const Icon(Icons.chevron_right, size: 20, color: Colors.green),
          ],
        ),
      ),
    );
  }
}
