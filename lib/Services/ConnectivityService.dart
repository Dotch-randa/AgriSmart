import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

// ─── Service ──────────────────────────────────────────────────────────────────

class ConnectivityService {
  static bool _isOnline = true;
  static final _controller = StreamController<bool>.broadcast();

  static Stream<bool> get onlineStream => _controller.stream;
  static bool get isOnline => _isOnline;

  static Future<void> init() async {
    final initial = await Connectivity().checkConnectivity();
    _isOnline = initial != ConnectivityResult.none;

    Connectivity().onConnectivityChanged.listen((result) {
      final online = result != ConnectivityResult.none;
      if (online != _isOnline) {
        _isOnline = online;
        _controller.add(_isOnline);
      }
    });
  }

  static void dispose() => _controller.close();
}

// ─── Reusable offline banner widget ──────────────────────────────────────────
// Drop this anywhere in your widget tree — it listens to connectivity
// and shows/hides itself automatically.

class OfflineBanner extends StatefulWidget {
  const OfflineBanner({super.key});

  @override
  State<OfflineBanner> createState() => _OfflineBannerState();
}

class _OfflineBannerState extends State<OfflineBanner> {
  bool _isOnline = ConnectivityService.isOnline;

  @override
  void initState() {
    super.initState();
    ConnectivityService.onlineStream.listen((online) {
      if (mounted) setState(() => _isOnline = online);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _isOnline ? 0 : 36,
      color: const Color(0xFFFFF3E0),
      child: _isOnline
          ? null
          : const Row(
              children: [
                SizedBox(width: 12),
                Icon(Icons.wifi_off, size: 16, color: Color(0xFFE65100)),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Mode hors ligne — consultation disponible sans connexion',
                    style: TextStyle(
                      color: Color(0xFFE65100),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}