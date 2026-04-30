

// import 'package:app_3ouchba/Screens/AuthScreen.dart';
// import 'package:flutter/material.dart';

// class OnboardingPage extends StatefulWidget {
//   const OnboardingPage({super.key});

//   @override
//   State<OnboardingPage> createState() => _OnboardingPageState();
// }

// class _OnboardingPageState extends State<OnboardingPage> {
//   double _circleOffset = 0.0; 

//   void _navigateToAuth() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (_) => const AuthScreen()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(color: Color(0xFFD4EDDA)),
//         child: Stack(
//           children: [
//             // Feuilles décoratives
//             _buildLeaf(top: -10, left: -10, size: 120, rotation: -0.3),
//             _buildLeaf(top: 20, right: -10, size: 80, rotation: 0.5),
//             _buildLeaf(bottom: 120, right: 10, size: 70, rotation: 1.2),

//             // Ovale central
//             Center(
//               child: Container(
//                 width: 200,
//                 height: 220,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF5A9E6F),
//                   borderRadius: BorderRadius.circular(110),
//                 ),
//                 child: const Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.spa, size: 70, color: Colors.white),
//                     SizedBox(height: 16),
//                     Text('مرحبا بك', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
//                     Text('في عُشبة', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
//                   ],
//                 ),
//               ),
//             ),

//             // Bouton swipe 
//             Positioned(
//               bottom: 60,
//               left: 40,
//               right: 40,
//               child: Container(
//                 height: 56,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(30),
//                   boxShadow: [
//                     BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 2)),
//                   ],
//                 ),
//                 child: Row(
//                   children: [
//                     const SizedBox(width: 8),
//                     // Le cercle glissant (detecteur de geste)
//                     GestureDetector(
//                       onHorizontalDragStart: (_) {
//                         setState(() => _circleOffset = 0);
//                       },
//                       onHorizontalDragUpdate: (details) {
//                         setState(() {
//                           _circleOffset += details.delta.dx;
//                           if (_circleOffset < 0) _circleOffset = 0;
//                           if (_circleOffset > 100) _circleOffset = 100;
//                         });
//                         if (_circleOffset > 80) {
//                           _navigateToAuth();
//                         }
//                       },
//                       onHorizontalDragEnd: (_) {
//                         setState(() => _circleOffset = 0);
//                       },
//                       child: Transform.translate(
//                         offset: Offset(_circleOffset, 0),
//                         child: Container(
//                           width: 42,
//                           height: 42,
//                           decoration: const BoxDecoration(color: Color(0xFF5A9E6F), shape: BoxShape.circle),
//                           child: const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     // Texte et pointillés (fixes)
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text('اسحب هنا', style: TextStyle(fontSize: 12, color: Color(0xFF5A9E6F), fontWeight: FontWeight.w600), textDirection: TextDirection.rtl),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: List.generate(15, (i) => Container(width: 4, height: 1.5, margin: const EdgeInsets.symmetric(horizontal: 1.5), color: Colors.grey.shade400)),
//                           ),
//                           const Text('Swipe It', style: TextStyle(fontSize: 11, color: Colors.grey)),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildLeaf({double top = 0, double left = 0, double right = 0, double bottom = 0, required double size, required double rotation}) {
//     return Positioned(
//       top: top,
//       left: left,
//       right: right,
//       bottom: bottom,
//       child: Transform.rotate(
//         angle: rotation,
//         child: Icon(Icons.energy_savings_leaf, size: size, color: const Color(0xFF5A9E6F).withOpacity(0.6)),
//       ),
//     );
//   }
// }   




import 'package:flutter/material.dart';
import 'package:app_3ouchba/Screens/AuthScreen.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  double _circleOffset = 0.0;
  late double _maxOffset;

  void _navigateToAuth() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const AuthScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Image de fond
            Positioned.fill(
              child: Image.asset(
                'images/farmer.jpg',
                fit: BoxFit.cover,
              ),
            ),
            // Overlay sombre pour meilleure lisibilité (optionnel)
            Positioned.fill(
              child: Container(color: Colors.black.withOpacity(0.3)),
            ),
            // Bouton swipe en bas
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    _maxOffset = constraints.maxWidth - 58; // 42(cercle) + 16(marges)
                    return Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Texte centré
                          const Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'اسحب هنا',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF5A9E6F),
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'Swipe It',
                                  style: TextStyle(fontSize: 11, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          // Cercle glissant
                          Positioned(
                            left: _circleOffset,
                            top: 7,
                            child: GestureDetector(
                              onHorizontalDragUpdate: (details) {
                                setState(() {
                                  _circleOffset += details.delta.dx;
                                  if (_circleOffset < 0) _circleOffset = 0;
                                  if (_circleOffset > _maxOffset) _circleOffset = _maxOffset;
                                });
                                if (_circleOffset >= _maxOffset) {
                                  _navigateToAuth();
                                }
                              },
                              onHorizontalDragEnd: (_) {
                                setState(() => _circleOffset = 0);
                              },
                              child: Container(
                                width: 42,
                                height: 42,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF5A9E6F),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}