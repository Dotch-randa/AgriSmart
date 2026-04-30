// import 'package:flutter/material.dart';

// class MapPage extends StatelessWidget {
//   const MapPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: const Color(0xFFF5FBF5),
//         appBar: AppBar(
//           backgroundColor: const Color(0xFF2E7D32),
//           elevation: 0,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () => Navigator.pop(context),
//           ),
//           actions: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child: Image.asset(
//                 'images/logo.jpg',
//                 width: 36,
//                 height: 36,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ],
//           title: const SizedBox.shrink(),
//         ),
//         body: Stack(
//           children: [
//             // Fond avec vague décorative
//             Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 height: 200,
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Color(0xFF2E7D32), Color(0xFF4CAF50)],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//                   borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
//                 ),
//               ),
//             ),
//             // Contenu principal
//             SafeArea(
//               child: Column(
//                 children: [
//                   const SizedBox(height: 20),
//                   // Carte principale (illustration)
//                   Expanded(
//                     flex: 3,
//                     child: Center(
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           // Carte de fond stylisée
//                           Container(
//                             width: 280,
//                             height: 280,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(40),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black.withOpacity(0.1),
//                                   blurRadius: 20,
//                                   offset: const Offset(0, 10),
//                                 ),
//                               ],
//                             ),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(40),
//                               child: Stack(
//                                 children: [
//                                   // Motif de carte (lignes)
//                                   CustomPaint(
//                                     painter: MapPatternPainter(),
//                                     size: Size.infinite,
//                                   ),
//                                   // Icône de localisation animée
//                                   const Positioned(
//                                     top: 80,
//                                     left: 80,
//                                     child: AnimatedMapMarker(),
//                                   ),
//                                   Positioned(
//                                     bottom: 60,
//                                     right: 50,
//                                     child: Container(
//                                       width: 80,
//                                       height: 80,
//                                       decoration: BoxDecoration(
//                                         color: const Color(0xFF2E7D32).withOpacity(0.1),
//                                         shape: BoxShape.circle,
//                                       ),
//                                       child: const Icon(
//                                         Icons.agriculture,
//                                         size: 40,
//                                         color: Color(0xFF2E7D32),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           // Badge "prochainement"
//                           Positioned(
//                             bottom: -10,
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(30),
//                                 boxShadow: [
//                                   BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8),
//                                 ],
//                               ),
//                               child: const Text(
//                                 '🗺️ قريباً',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color(0xFF2E7D32),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   // Carte d'information
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                       margin: const EdgeInsets.all(20),
//                       padding: const EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(30),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.05),
//                             blurRadius: 15,
//                             offset: const Offset(0, 5),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Row(
//                             children: [
//                               Icon(Icons.map_outlined, color: Color(0xFF2E7D32), size: 28),
//                               SizedBox(width: 12),
//                               Text(
//                                 'مساعدة في الخرائط',
//                                 style: TextStyle(
//                                   fontSize: 22,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color(0xFF2E7D32),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 16),
//                           const Text(
//                             'ستمكنك الخريطة من:',
//                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black54),
//                           ),
//                           const SizedBox(height: 12),
//                           _buildFeatureItem(Icons.gps_fixed, 'تحديد أقرب مركز مساعدة زراعية'),
//                           _buildFeatureItem(Icons.agriculture, 'عرض المحاصيل الموسمية حسب المنطقة'),
//                           _buildFeatureItem(Icons.water_drop, 'معلومات عن الري والأمطار في ولايتك'),
//                           const Spacer(),
//                           Center(
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//                               decoration: BoxDecoration(
//                                 gradient: const LinearGradient(
//                                   colors: [Color(0xFF2E7D32), Color(0xFF4CAF50)],
//                                 ),
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               child: const Text(
//                                 'قريباً في التطبيق',
//                                 style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFeatureItem(IconData icon, String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: Row(
//         children: [
//           Icon(icon, size: 20, color: const Color(0xFF4CAF50)),
//           const SizedBox(width: 12),
//           Text(text, style: const TextStyle(fontSize: 14, color: Colors.black87)),
//         ],
//       ),
//     );
//   }
// }

// // ───────────────────────────────────────────────────────────────
// // Custom painter pour tracer un motif de carte (routes, parcelles)
// // ───────────────────────────────────────────────────────────────
// class MapPatternPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = const Color(0xFFE8F5E9)
//       ..strokeWidth = 2
//       ..style = PaintingStyle.stroke;

//     // Lignes horizontales (parcelles)
//     for (int i = 1; i <= 4; i++) {
//       canvas.drawLine(
//         Offset(0, size.height * i / 5),
//         Offset(size.width, size.height * i / 5),
//         paint,
//       );
//     }
//     // Lignes verticales
//     for (int i = 1; i <= 3; i++) {
//       canvas.drawLine(
//         Offset(size.width * i / 4, 0),
//         Offset(size.width * i / 4, size.height),
//         paint,
//       );
//     }
//     // Route courbe
//     final path = Path()
//       ..moveTo(0, size.height * 0.7)
//       ..quadraticBezierTo(size.width * 0.3, size.height * 0.5, size.width * 0.5, size.height * 0.6)
//       ..quadraticBezierTo(size.width * 0.7, size.height * 0.7, size.width, size.height * 0.5);
//     canvas.drawPath(path, paint..color = const Color(0xFFA5D6A7)..strokeWidth = 4);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

// // ───────────────────────────────────────────────────────────────
// // Widget animé pour le marqueur de localisation
// // ───────────────────────────────────────────────────────────────
// class AnimatedMapMarker extends StatefulWidget {
//   const AnimatedMapMarker({super.key});

//   @override
//   State<AnimatedMapMarker> createState() => _AnimatedMapMarkerState();
// }

// class _AnimatedMapMarkerState extends State<AnimatedMapMarker>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _pulseAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     )..repeat(reverse: true);
//     _pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _pulseAnimation,
//       builder: (context, child) {
//         return Transform.scale(
//           scale: _pulseAnimation.value,
//           child: Container(
//             width: 30,
//             height: 30,
//             decoration: const BoxDecoration(
//               color: Color(0xFF2E7D32),
//               shape: BoxShape.circle,
//               boxShadow: [
//                 BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 2)),
//               ],
//             ),
//             child: const Icon(Icons.location_on, color: Colors.white, size: 18),
//           ),
//         );
//       },
//     );
//   }
// }

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

// ─── Data model ───────────────────────────────────────────────────────────────

enum CenterType { chamber, cooperative, itdas }

class AgriculturalCenter {
  final String name;
  final String wilaya;
  final CenterType type;
  final LatLng position;
  final String? phone;

  const AgriculturalCenter({
    required this.name,
    required this.wilaya,
    required this.type,
    required this.position,
    this.phone,
  });

  String get typeLabel {
    switch (type) {
      case CenterType.chamber:    return 'Chambre d\'Agriculture';
      case CenterType.cooperative: return 'Coopérative';
      case CenterType.itdas:      return 'Centre ITDAS';
    }
  }

  Color get typeColor {
    switch (type) {
      case CenterType.chamber:    return const Color(0xFF2E7D32);
      case CenterType.cooperative: return const Color(0xFF1565C0);
      case CenterType.itdas:      return const Color(0xFF6A1B9A);
    }
  }

  IconData get typeIcon {
    switch (type) {
      case CenterType.chamber:    return Icons.account_balance;
      case CenterType.cooperative: return Icons.groups;
      case CenterType.itdas:      return Icons.science;
    }
  }
}

// ─── Static dataset ───────────────────────────────────────────────────────────
// Extend this list with real coordinates from official sources.

const List<AgriculturalCenter> kCenters = [
  // Alger
  AgriculturalCenter(name: 'Chambre d\'Agriculture d\'Alger', wilaya: 'Alger', type: CenterType.chamber, position: LatLng(36.7372, 3.0866), phone: '+213 21 23 45 67'),
  AgriculturalCenter(name: 'Coopérative Mitidja', wilaya: 'Alger', type: CenterType.cooperative, position: LatLng(36.5500, 2.8700)),
  AgriculturalCenter(name: 'Centre ITDAS Alger', wilaya: 'Alger', type: CenterType.itdas, position: LatLng(36.7528, 3.0420), phone: '+213 21 74 12 00'),
  // Biskra
  AgriculturalCenter(name: 'Chambre d\'Agriculture de Biskra', wilaya: 'Biskra', type: CenterType.chamber, position: LatLng(34.8500, 5.7333), phone: '+213 33 71 23 45'),
  AgriculturalCenter(name: 'Coopérative Phoenix Biskra', wilaya: 'Biskra', type: CenterType.cooperative, position: LatLng(34.8350, 5.7200)),
  AgriculturalCenter(name: 'Centre ITDAS Biskra', wilaya: 'Biskra', type: CenterType.itdas, position: LatLng(34.8600, 5.7450)),
  // Oran
  AgriculturalCenter(name: 'Chambre d\'Agriculture d\'Oran', wilaya: 'Oran', type: CenterType.chamber, position: LatLng(35.6969, -0.6331), phone: '+213 41 33 56 78'),
  AgriculturalCenter(name: 'Coopérative Habra', wilaya: 'Oran', type: CenterType.cooperative, position: LatLng(35.6200, -0.5900)),
  // Constantine
  AgriculturalCenter(name: 'Chambre d\'Agriculture de Constantine', wilaya: 'Constantine', type: CenterType.chamber, position: LatLng(36.3650, 6.6147), phone: '+213 31 92 34 56'),
  AgriculturalCenter(name: 'Centre ITDAS Constantine', wilaya: 'Constantine', type: CenterType.itdas, position: LatLng(36.3700, 6.6200)),
  // Annaba
  AgriculturalCenter(name: 'Chambre d\'Agriculture d\'Annaba', wilaya: 'Annaba', type: CenterType.chamber, position: LatLng(36.9000, 7.7667), phone: '+213 38 44 67 89'),
  // Sétif
  AgriculturalCenter(name: 'Chambre d\'Agriculture de Sétif', wilaya: 'Sétif', type: CenterType.chamber, position: LatLng(36.1911, 5.4139), phone: '+213 36 84 12 34'),
  AgriculturalCenter(name: 'Centre ITDAS Sétif', wilaya: 'Sétif', type: CenterType.itdas, position: LatLng(36.1950, 5.4200)),
  // Adrar
  AgriculturalCenter(name: 'Chambre d\'Agriculture d\'Adrar', wilaya: 'Adrar', type: CenterType.chamber, position: LatLng(27.8742, -0.2939)),
  AgriculturalCenter(name: 'Coopérative Touat', wilaya: 'Adrar', type: CenterType.cooperative, position: LatLng(27.8600, -0.2800)),
  // Tamanrasset
  AgriculturalCenter(name: 'Chambre d\'Agriculture de Tamanrasset', wilaya: 'Tamanrasset', type: CenterType.chamber, position: LatLng(22.7851, 5.5228)),

  AgriculturalCenter(name: 'Chambre d\'Agriculture Tizi Ouzou', wilaya: 'Tizi Ouzou', type: CenterType.chamber, position: LatLng(36.7169, 4.0497), phone: '+213 26 21 45 67'),
  AgriculturalCenter(name: 'Coopérative Kabyle', wilaya: 'Tizi Ouzou', type: CenterType.cooperative, position: LatLng(36.7100, 4.0400)),
  // Blida
  AgriculturalCenter(name: 'Chambre d\'Agriculture de Blida', wilaya: 'Blida', type: CenterType.chamber, position: LatLng(36.4703, 2.8277)),
  AgriculturalCenter(name: 'Centre ITDAS Blida', wilaya: 'Blida', type: CenterType.itdas, position: LatLng(36.4750, 2.8300)),
];

// ─── Distance helper ──────────────────────────────────────────────────────────

double _haversineKm(LatLng a, LatLng b) {
  const R = 6371.0;
  final dLat = (b.latitude  - a.latitude)  * pi / 180;
  final dLon = (b.longitude - a.longitude) * pi / 180;
  final h = sin(dLat / 2) * sin(dLat / 2) +
      cos(a.latitude * pi / 180) * cos(b.latitude * pi / 180) *
          sin(dLon / 2) * sin(dLon / 2);
  return R * 2 * atan2(sqrt(h), sqrt(1 - h));
}

// ─── Page ─────────────────────────────────────────────────────────────────────

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const Color primaryGreen = Color(0xFF2E7D32);

  final MapController _mapController = MapController();

  Position? _userPosition;
  bool _loadingLocation = true;
  String? _locationError;
  AgriculturalCenter? _selected;

  // Filter state
  final Set<CenterType> _activeFilters = {
    CenterType.chamber,
    CenterType.cooperative,
    CenterType.itdas,
  };

  List<AgriculturalCenter> get _filteredCenters =>
      kCenters.where((c) => _activeFilters.contains(c.type)).toList();

  @override
  void initState() {
    super.initState();
    _fetchLocation();
  }

  Future<void> _fetchLocation() async {
    setState(() { _loadingLocation = true; _locationError = null; });
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) throw Exception('Location services disabled');

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permission permanently denied');
      }

      final pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() { _userPosition = pos; _loadingLocation = false; });
      _mapController.move(LatLng(pos.latitude, pos.longitude), 10.0);
    } catch (e) {
      setState(() {
        _loadingLocation = false;
        _locationError = e.toString();
        // Default to Algiers center
        _mapController.move(const LatLng(36.7372, 3.0866), 6.0);
      });
    }
  }

  List<AgriculturalCenter> get _nearest {
    if (_userPosition == null) return [];
    final userLatLng = LatLng(_userPosition!.latitude, _userPosition!.longitude);
    final sorted = [..._filteredCenters]..sort(
      (a, b) => _haversineKm(userLatLng, a.position)
          .compareTo(_haversineKm(userLatLng, b.position)),
    );
    return sorted.take(3).toList();
  }

  void _openDirections(AgriculturalCenter center) async {
    final uri = Uri.parse(
      'https://www.google.com/maps/dir/?api=1&destination=${center.position.latitude},${center.position.longitude}',
    );
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  void _callCenter(String phone) async {
    final uri = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5DC),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryGreen),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Centres Agricoles',
          style: TextStyle(color: primaryGreen, fontWeight: FontWeight.w900, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.my_location, color: primaryGreen),
            onPressed: _fetchLocation,
            tooltip: 'Ma position',
          ),
        ],
      ),
      body: Column(
        children: [
          // ── Filter chips ────────────────────────────────────────────────
          Container(
            color: const Color(0xFFF5F5DC),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: CenterType.values.map((type) {
                  final center = kCenters.firstWhere((c) => c.type == type);
                  final active = _activeFilters.contains(type);
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(center.typeLabel, style: TextStyle(fontSize: 12, color: active ? Colors.white : center.typeColor)),
                      avatar: Icon(center.typeIcon, size: 16, color: active ? Colors.white : center.typeColor),
                      selected: active,
                      selectedColor: center.typeColor,
                      backgroundColor: center.typeColor.withOpacity(0.1),
                      checkmarkColor: Colors.white,
                      showCheckmark: false,
                      onSelected: (val) => setState(() {
                        if (val) { _activeFilters.add(type); } else { _activeFilters.remove(type); }
                      }),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: Stack(
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: const LatLng(28.0339, 1.6596), // Algeria center
                    initialZoom: 5.5,
                    onTap: (tapPosition, latLng) => setState(() => _selected = null),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.nabta.app',
                    ),
                    // Center markers
                    MarkerLayer(
                      markers: [
                        // User location marker
                        if (_userPosition != null)
                          Marker(
                            point: LatLng(_userPosition!.latitude, _userPosition!.longitude),
                            width: 40,
                            height: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 3),
                                boxShadow: [BoxShadow(color: Colors.blue.withOpacity(0.4), blurRadius: 12, spreadRadius: 4)],
                              ),
                              child: const Icon(Icons.person, color: Colors.white, size: 20),
                            ),
                          ),
                        // Center markers
                        ..._filteredCenters.map((c) {
                          final isSelected = _selected == c;
                          final isNearest = _nearest.contains(c);
                          return Marker(
                            point: c.position,
                            width: isSelected ? 52 : (isNearest ? 46 : 38),
                            height: isSelected ? 52 : (isNearest ? 46 : 38),
                            child: GestureDetector(
                              onTap: () {
                                setState(() => _selected = c);
                                _mapController.move(c.position, 12.0);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: c.typeColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: isSelected ? 3 : 2),
                                  boxShadow: [BoxShadow(color: c.typeColor.withOpacity(0.4), blurRadius: 8, spreadRadius: isNearest ? 3 : 1)],
                                ),
                                child: Icon(c.typeIcon, color: Colors.white, size: isSelected ? 26 : 20),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
                // Loading overlay
                if (_loadingLocation)
                  Container(
                    color: Colors.black26,
                    child: const Center(
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircularProgressIndicator(color: primaryGreen),
                              SizedBox(height: 12),
                              Text('Localisation en cours...', style: TextStyle(fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ),
 ),
                  ),
                // Selected center popup
                if (_selected != null)
                  Positioned(
                    left: 12, right: 12, bottom: 12,
                    child: _buildCenterCard(_selected!),
                  ),
              ],
            ),
          ),

          // ── Nearest centers list ─────────────────────────────────────────
          if (_userPosition != null && _nearest.isNotEmpty)
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Plus proches de vous', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black54)),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 90,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _nearest.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 10),
                              
                      itemBuilder: (context, i) => _buildNearestChip(_nearest[i]),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),

          // Error banner
          if (_locationError != null)
            Container(
              color: const Color(0xFFFFDAD6),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  const Icon(Icons.warning_amber, color: Color(0xFF93000A), size: 18),
                  const SizedBox(width: 8),
                  const Expanded(child: Text('Position non disponible — affichage de l\'Algérie', style: TextStyle(color: Color(0xFF93000A), fontSize: 12))),
                  TextButton(onPressed: _fetchLocation, child: const Text('Réessayer', style: TextStyle(fontSize: 12))),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCenterCard(AgriculturalCenter center) {
    final dist = _userPosition != null
        ? _haversineKm(LatLng(_userPosition!.latitude, _userPosition!.longitude), center.position)
        : null;
 return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: center.typeColor.withOpacity(0.12), shape: BoxShape.circle),
                  child: Icon(center.typeIcon, color: center.typeColor, size: 22),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(center.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      Text(center.typeLabel, style: TextStyle(color: center.typeColor, fontSize: 12, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                if (dist != null)
                  Text('${dist.toStringAsFixed(1)} km', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _openDirections(center),
                    icon: const Icon(Icons.directions, size: 18),
                    label: const Text('Itinéraire'),
                    style: OutlinedButton.styleFrom(foregroundColor: primaryGreen, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  ),
                ),
                if (center.phone != null) ...[
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _callCenter(center.phone!),
                      icon: const Icon(Icons.phone, size: 18),
                      label: const Text('Appeler'),
                      style: ElevatedButton.styleFrom(backgroundColor: primaryGreen, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNearestChip(AgriculturalCenter center) {
    final dist = _userPosition != null
        ? _haversineKm(LatLng(_userPosition!.latitude, _userPosition!.longitude), center.position)
        : null;
    return GestureDetector(
      onTap: () {
        setState(() => _selected = center);
        _mapController.move(center.position, 13.0);
      },
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: center.typeColor.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: center.typeColor.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(center.typeIcon, color: center.typeColor, size: 16),
                const SizedBox(width: 6),
                if (dist != null)
                  Text('${dist.toStringAsFixed(1)} km', style: TextStyle(color: center.typeColor, fontSize: 11, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 4),
            Text(center.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12), maxLines: 2, overflow: TextOverflow.ellipsis),
            Text(center.wilaya, style: const TextStyle(color: Colors.grey, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}