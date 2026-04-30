// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';

// // void main() => runApp(
// //   ChangeNotifierProvider(
    
// //     create: (context) => DiagnosticProvider(),
// //     child: const NabtaApp(),
// //   ),
// // );

// // class DiagnosticProvider with ChangeNotifier {
 
// //   String status = 'IDLE'; // IDLE, ANALYZING, RESULT
// //   Map<String, dynamic>? result;

// //   void analyze() async {
// //     status = 'ANALYZING';
// //     notifyListeners();
// //     // Simulate AI Delay
// //     await Future.delayed(const Duration(seconds: 2));
// //     result = {
// //       'pathology': 'Mildiou de la Tomate',
// //       'confidence': 94,
// //       'severity': 'Critique',
// //       'recommendations': [
// //         'Retirez immédiatement les feuilles infectées.',
// //         'Appliquez un fongicide à base de cuivre.'
// //       ]
// //     };
// //     status = 'RESULT';
// //     notifyListeners();
// //   }

// //   void reset() {
// //     status = 'IDLE';
// //     result = null;
// //     notifyListeners();
// //   }
// // }

// // class NabtaApp extends StatelessWidget {
// //   const NabtaApp({super.key});
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       theme: ThemeData(
// //         colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D631B)),
// //         useMaterial3: true,
// //       ),
// //       home: const DiagnosticScreen(),
// //     );
// //   }
// // }

// // class DiagnosticScreen extends StatelessWidget {
  
// //   const DiagnosticScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final state = Provider.of<DiagnosticProvider>(context);

// //     return Scaffold(
// //       backgroundColor: const Color(0xFFFBF9F8),
// //       appBar: AppBar(
// //         title: const Text('NABTA', style: TextStyle(fontWeight: FontWeight.w900)),
// //         backgroundColor: const Color(0xFFF5F5DC),
// //         actions: [IconButton(icon: const Icon(Icons.language), onPressed: () {})],
// //       ),
      
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(20),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             const Text('Diagnostic de culture', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold , color: Colors.green)),
// //             const SizedBox(height: 8),
// //             const Text('Prenez une photo claire pour identifier les maladies.', style: TextStyle(color: Colors.green)),
// //             const SizedBox(height: 24),
            
// //             if (state.status == 'IDLE')
// //               ElevatedButton(
// //                 onPressed: state.analyze,
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: const Color(0xFF2E7D32),
// //                   foregroundColor: Colors.white,
// //                   minimumSize: const Size(double.infinity, 120),
// //                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
// //                 ),
// //                 child: const Column(
// //                   children: [Icon(Icons.camera_alt, size: 48), Text('Prendre une Photo', style: TextStyle(fontSize: 20))],
// //                 ),
// //               ),
            
// //             if (state.status == 'ANALYZING')
// //               const Center(child: CircularProgressIndicator()),

// //             if (state.status == 'RESULT')
// //               Card(
// //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(20),
// //                   child: Column(
// //                     children: [
// //                       Text(state.result!['pathology'], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
// //                       const SizedBox(height: 10),
// //                       LinearProgressIndicator(value: state.result!['confidence']/100, minHeight: 10),
// //                       const SizedBox(height: 20),
// //                       ElevatedButton(onPressed: state.reset, child: const Text('Réessayer')),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }    


// // // // chatbot_page.dart
// // // import 'package:flutter/material.dart';

// // // class DiagnosticPage extends StatefulWidget {
// // //   const DiagnosticPage({super.key});

// // //   @override
// // //   State<DiagnosticPage> createState() => _DiagnosticPageState();
// // // }

// // // class _DiagnosticPageState extends State<DiagnosticPage> {
// // //   // Brand Colors
// // //   final Color primaryGreen = const Color(0xFF2E7D32);
// // //   final Color background = const Color(0xFFFBF9F8);
// // //   final Color surfaceBeige = const Color(0xFFF5F5DC);
// // //   final Color outlineColor = const Color(0xFFBFCABA);

// // //   // Mock data for the GridView cards
// // //   final List<Map<String, String>> recentDiagnostics = [
// // //     {'title': 'مكتشف اللفحة', 'plant': 'طماطم', 'status': 'حرج'},
// // //     {'title': 'صدأ الأوراق', 'plant': 'قمح', 'status': 'متوسط'},
// // //     {'title': 'حشرة المن', 'plant': 'فلفل', 'status': 'بداية'},
// // //     {'title': 'نقص نيتروجين', 'plant': 'ذرة', 'status': 'مراقب'},
// // //   ];

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Directionality(
// // //       textDirection: TextDirection.rtl, // Set to RTL for Arabic
// // //       child: Scaffold(
// // //         backgroundColor: background,
// // //         appBar: AppBar(
// // //           backgroundColor: surfaceBeige,
// // //           elevation: 0,
// // //           centerTitle: true,
// // //           leading: IconButton(
// // //             icon: Icon(Icons.arrow_back, color: primaryGreen),
// // //             onPressed: () => Navigator.of(context).pop(),
// // //           ),
// // //           title: Text(
// // //             'NABTA',
// // //             style: TextStyle(
// // //               color: primaryGreen,
// // //               fontWeight: FontWeight.w900,
// // //               fontSize: 24,
// // //               letterSpacing: -1,
// // //             ),
// // //           ),
// // //           actions: [
// // //             IconButton(
// // //               icon: const Icon(Icons.language, color: Colors.grey),
// // //               onPressed: () {},
// // //             ),
// // //           ],
// // //         ),
// // //         body: SingleChildScrollView(
// // //           child: Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               // 1. Header Section
// // //               Padding(
// // //                 padding: const EdgeInsets.all(20.0),
// // //                 child: Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: [
// // //                     Text(
// // //                       'Diagnostic de culture',
// // //                       style: TextStyle(
// // //                         color: primaryGreen,
// // //                         fontSize: 28,
// // //                         fontWeight: FontWeight.bold,
// // //                         fontFamily: 'Public Sans',
// // //                       ),
// // //                     ),
// // //                     const SizedBox(height: 8),
// // //                     const Text(
// // //                       'Prenez une photo claire pour identifier les maladies.',
// // //                       style: TextStyle(
// // //                         color: Color(0xFF40493D),
// // //                         fontSize: 16,
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),

// // //               // 2. Main Action Button (Matching the Image)
// // //               Padding(
// // //                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
// // //                 child: InkWell(
// // //                   onTap: () {}, // Take Photo Logic
// // //                   child: Container(
// // //                     width: double.infinity,
// // //                     padding: const EdgeInsets.symmetric(vertical: 24),
// // //                     decoration: BoxDecoration(
// // //                       color: primaryGreen,
// // //                       borderRadius: BorderRadius.circular(20),
// // //                       boxShadow: [
// // //                         BoxShadow(
// // //                           color: Colors.black.withOpacity(0.1),
// // //                           blurRadius: 10,
// // //                           offset: const Offset(0, 4),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                     child: Column(
// // //                       children: const [
// // //                         Icon(Icons.camera_alt_rounded, color: Colors.white, size: 48),
// // //                         SizedBox(height: 12),
// // //                         Text(
// // //                           'Prendre une Photo',
// // //                           style: TextStyle(
// // //                             color: Colors.white,
// // //                             fontSize: 20,
// // //                             fontWeight: FontWeight.w600,
// // //                           ),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),

// // //               const SizedBox(height: 32),

// // //               // 3. Grid Section (The "missing cards" in gridview)
// // //               Padding(
// // //                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
// // //                 child: Row(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                   children: [
// // //                     Text(
// // //                       'التشخيصات الأخيرة',
// // //                       style: TextStyle(
// // //                         color: primaryGreen,
// // //                         fontSize: 18,
// // //                         fontWeight: FontWeight.bold,
// // //                       ),
// // //                     ),
// // //                     TextButton(
// // //                       onPressed: () {},
// // //                       child: const Text('عرض الكل'),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),

// // //               // Horizontal Padding for Grid
// // //               Padding(
// // //                 padding: const EdgeInsets.all(12),
// // //                 child: GridView.builder(
// // //                   shrinkWrap: true,
// // //                   physics: const NeverScrollableScrollPhysics(),
// // //                   itemCount: recentDiagnostics.length,
// // //                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// // //                     crossAxisCount: 2,
// // //                     crossAxisSpacing: 12,
// // //                     mainAxisSpacing: 12,
// // //                     childAspectRatio: 1.1,
// // //                   ),
// // //                   itemBuilder: (context, index) {
// // //                     final item = recentDiagnostics[index];
// // //                     return _buildDiagnosticCard(item);
// // //                   },
// // //                 ),
// // //               ),
              
// // //               const SizedBox(height: 100), // Space for bottom nav
// // //             ],
// // //           ),
// // //         ),
        
// // //         // 4. Bottom Navbar (Matching the NABTA theme)
// // //         bottomNavigationBar: BottomNavigationBar(
// // //           type: BottomNavigationBarType.fixed,
// // //           backgroundColor: Colors.white,
// // //           selectedItemColor: primaryGreen,
// // //           unselectedItemColor: Colors.grey,
// // //           currentIndex: 0,
// // //           items: const [
// // //             BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'الرئيسية'),
// // //             BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'المساعد'),
// // //             BottomNavigationBarItem(icon: Icon(Icons.library_books_outlined), label: 'الفهارس'),
// // //             BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: 'الخريطة'),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   // Card Widget helper
// // //   Widget _buildDiagnosticCard(Map<String, String> data) {
// // //     return Container(
// // //       padding: const EdgeInsets.all(16),
// // //       decoration: BoxDecoration(
// // //         color: Colors.white,
// // //         borderRadius: BorderRadius.circular(16),
// // //         border: Border.all(color: outlineColor.withOpacity(0.3)),
// // //         boxShadow: [
// // //           BoxShadow(
// // //             color: Colors.black.withOpacity(0.02),
// // //             blurRadius: 4,
// // //             offset: const Offset(0, 2),
// // //           ),
// // //         ],
// // //       ),
// // //       child: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           Container(
// // //             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
// // //             decoration: BoxDecoration(
// // //               color: primaryGreen.withOpacity(0.1),
// // //               borderRadius: BorderRadius.circular(8),
// // //             ),
// // //             child: Text(
// // //               data['plant']!,
// // //               style: TextStyle(color: primaryGreen, fontSize: 10, fontWeight: FontWeight.bold),
// // //             ),
// // //           ),
// // //           const Spacer(),
// // //           Text(
// // //             data['title']!,
// // //             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
// // //           ),
// // //           const SizedBox(height: 4),
// // //           Row(
// // //             children: [
// // //               Icon(Icons.circle, color: _getStatusColor(data['status']!), size: 8),
// // //               const SizedBox(width: 4),
// // //               Text(data['status']!, style: const TextStyle(color: Colors.grey, fontSize: 12)),
// // //             ],
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Color _getStatusColor(String status) {
// // //     if (status == 'حرج') return Colors.red;
// // //     if (status == 'متوسط') return Colors.orange;
// // //     return Colors.green;
// // //   }
// // // }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';

// // ─── Provider ────────────────────────────────────────────────────────────────

// class DiagnosticProvider with ChangeNotifier {
//   String status = 'IDLE'; // IDLE, ANALYZING, RESULT
//   Map<String, dynamic>? result;
//   File? image;

//   Future<void> pickAndAnalyze() async {
//     final picker = ImagePicker();
//     final picked = await picker.pickImage(source: ImageSource.camera);
//     if (picked == null) return;

//     image = File(picked.path);
//     status = 'ANALYZING';
//     notifyListeners();

//     await Future.delayed(const Duration(seconds: 3));

//     result = {
//       'pathology': 'Mildiou de la Tomate',
//       'confidence': 94,
//       'severity': 'Critique',
//       'recommendations': [
//         'Retirez immédiatement les feuilles infectées et brûlez-les loin de la culture.',
//         'Appliquez un fongicide à base de cuivre tous les 7 à 10 jours.',
//       ],
//     };
//     status = 'RESULT';
//     notifyListeners();
//   }

//   void reset() {
//     status = 'IDLE';
//     result = null;
//     image = null;
//     notifyListeners();
//   }
// }

// // ─── Screen ──────────────────────────────────────────────────────────────────

// class DiagnosticScreen extends StatelessWidget {
//   const DiagnosticScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => DiagnosticProvider(),
//       child: const _DiagnosticView(),
//     );
//   }
// }

// class _DiagnosticView extends StatelessWidget {
//   const _DiagnosticView();

//   @override
//   Widget build(BuildContext context) {
//     final state = context.watch<DiagnosticProvider>();
//     const green = Color(0xFF1E7D34);

//     return Scaffold(
//       backgroundColor: const Color(0xFFF7F7F7),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFF0F4EC),
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black87),
//           onPressed: () => Navigator.maybePop(context),
//         ),
//         title: const Text(
//           'NABTA',
//           style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black87),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.language, color: Colors.black54),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // ── Header ──
//             const Text(
//               'Diagnostic de culture',
//               style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: green),
//             ),
//             const SizedBox(height: 6),
//             const Text(
//               'Prenez une photo claire des feuilles ou des\nfruits pour identifier les maladies\ninstantanément grâce à notre IA.',
//               style: TextStyle(color: Colors.black54, fontSize: 13, height: 1.5),
//             ),
//             const SizedBox(height: 20),

//             // ── Camera Button ──
//             if (state.status == 'IDLE') ...[
//               _CameraButton(onTap: state.pickAndAnalyze),
//               const SizedBox(height: 24),
//               _RecentGrid(),
//             ],

//             // ── Image + Analyzing ──
//             if (state.status == 'ANALYZING') ...[
//               _ImagePreview(image: state.image),
//               const SizedBox(height: 16),
//               _AnalyzingCard(),
//             ],

//             // ── Result ──
//             if (state.status == 'RESULT') ...[
//               _ImagePreview(image: state.image),
//               const SizedBox(height: 16),
//               _ResultCard(result: state.result!, onRetry: state.reset),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ─── Camera Button ───────────────────────────────────────────────────────────

// class _CameraButton extends StatelessWidget {
//   final VoidCallback onTap;
//   const _CameraButton({required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.symmetric(vertical: 28),
//         decoration: BoxDecoration(
//           color: const Color(0xFF1E7D34),
//           borderRadius: BorderRadius.circular(18),
//           boxShadow: [
//             BoxShadow(
//               color: const Color(0xFF1E7D34).withOpacity(0.35),
//               blurRadius: 14,
//               offset: const Offset(0, 6),
//             ),
//           ],
//         ),
//         child: const Column(
//           children: [
//             Icon(Icons.camera_alt_rounded, color: Colors.white, size: 44),
//             SizedBox(height: 10),
//             Text(
//               'Prendre une Photo',
//               style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ─── Recent Grid ─────────────────────────────────────────────────────────────

// class _RecentGrid extends StatelessWidget {
//   final List<Map<String, dynamic>> items = const [
//     {'title': 'Mildiou', 'plant': 'Tomate', 'status': 'Critique', 'color': Colors.red},
//     {'title': 'Rouille', 'plant': 'Blé', 'status': 'Modéré', 'color': Colors.orange},
//     {'title': 'Pucerons', 'plant': 'Poivron', 'status': 'Début', 'color': Colors.green},
//     {'title': 'Carence N', 'plant': 'Maïs', 'status': 'Surveiller', 'color': Colors.blue},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               'Diagnostics récents',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             TextButton(
//               onPressed: () {},
//               child: const Text('Voir tout', style: TextStyle(color: Color(0xFF1E7D34))),
//             ),
//           ],
//         ),
//         const SizedBox(height: 8),
//         GridView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: items.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 12,
//             mainAxisSpacing: 12,
//             childAspectRatio: 1.2,
//           ),
//           itemBuilder: (_, i) => _GridCard(data: items[i]),
//         ),
//       ],
//     );
//   }
// }

// class _GridCard extends StatelessWidget {
//   final Map<String, dynamic> data;
//   const _GridCard({required this.data});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6)],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
//             decoration: BoxDecoration(
//               color: const Color(0xFF1E7D34).withOpacity(0.1),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Text(
//               data['plant'],
//               style: const TextStyle(color: Color(0xFF1E7D34), fontSize: 11, fontWeight: FontWeight.bold),
//             ),
//           ),
//           const Spacer(),
//           Text(data['title'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
//           const SizedBox(height: 4),
//           Row(
//             children: [
//               Icon(Icons.circle, size: 8, color: data['color'] as Color),
//               const SizedBox(width: 4),
//               Text(data['status'], style: const TextStyle(color: Colors.black45, fontSize: 12)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ─── Image Preview ───────────────────────────────────────────────────────────

// class _ImagePreview extends StatelessWidget {
//   final File? image;
//   const _ImagePreview({this.image});

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(18),
//       child: image != null
//           ? Image.file(image!, height: 220, width: double.infinity, fit: BoxFit.cover)
//           : Container(
//               height: 220,
//               color: Colors.grey.shade200,
//               child: const Icon(Icons.image, size: 60, color: Colors.grey),
//             ),
//     );
//   }
// }

// // ─── Analyzing Card ──────────────────────────────────────────────────────────

// class _AnalyzingCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
//       ),
//       child: const Row(
//         children: [
//           SizedBox(
//             width: 32,
//             height: 32,
//             child: CircularProgressIndicator(strokeWidth: 3, color: Color(0xFF1E7D34)),
//           ),
//           SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Analyse en cours...', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
//                 SizedBox(height: 4),
//                 Text('Identification de la pathologie végétale', style: TextStyle(color: Colors.black45, fontSize: 12)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ─── Result Card ─────────────────────────────────────────────────────────────

// class _ResultCard extends StatelessWidget {
//   final Map<String, dynamic> result;
//   final VoidCallback onRetry;
//   const _ResultCard({required this.result, required this.onRetry});

//   @override
//   Widget build(BuildContext context) {
//     final confidence = result['confidence'] as int;
//     final recommendations = result['recommendations'] as List;

//     return Column(
//       children: [
//         // Severity badge + title
//         Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(18),
//             boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   const Text(
//                     'RÉSULTAT DÉTECTÉ',
//                     style: TextStyle(fontSize: 11, color: Colors.black45, fontWeight: FontWeight.w600, letterSpacing: 0.5),
//                   ),
//                   const Spacer(),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                     decoration: BoxDecoration(
//                       color: Colors.red.shade50,
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(color: Colors.red.shade200),
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(Icons.warning_amber_rounded, size: 13, color: Colors.red.shade600),
//                         const SizedBox(width: 4),
//                         Text(result['severity'], style: TextStyle(color: Colors.red.shade600, fontSize: 12, fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 result['pathology'],
//                 style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, height: 1.2),
//               ),
//               const SizedBox(height: 14),
//               // Confidence bar
//               Row(
//                 children: [
//                   const Text('Confiance de l\'IA', style: TextStyle(color: Colors.black45, fontSize: 12)),
//                   const Spacer(),
//                   Text('$confidence%', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E7D34))),
//                 ],
//               ),
//               const SizedBox(height: 6),
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: LinearProgressIndicator(
//                   value: confidence / 100,
//                   minHeight: 8,
//                   backgroundColor: Colors.grey.shade200,
//                   valueColor: const AlwaysStoppedAnimation(Color(0xFF1E7D34)),
//                 ),
//               ),
//             ],
//           ),
//         ),

//         const SizedBox(height: 14),

//         // Recommendations
//         Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(18),
//             boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(6),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF1E7D34).withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: const Icon(Icons.eco_rounded, color: Color(0xFF1E7D34), size: 18),
//                   ),
//                   const SizedBox(width: 10),
//                   const Text('Traitement Recommandé', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
//                 ],
//               ),
//               const SizedBox(height: 14),
//               ...recommendations.map((rec) => Padding(
//                 padding: const EdgeInsets.only(bottom: 10),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Icon(Icons.check_circle, color: Color(0xFF1E7D34), size: 18),
//                     const SizedBox(width: 10),
//                     Expanded(child: Text(rec, style: const TextStyle(fontSize: 13, height: 1.4, color: Colors.black87))),
//                   ],
//                 ),
//               )),
//               const SizedBox(height: 6),
//               SizedBox(
//                 width: double.infinity,
//                 child: OutlinedButton(
//                   onPressed: () {},
//                   style: OutlinedButton.styleFrom(
//                     side: const BorderSide(color: Color(0xFF1E7D34)),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                   ),
//                   child: const Text('Consulter un expert NABTA', style: TextStyle(color: Color(0xFF1E7D34), fontWeight: FontWeight.w600)),
//                 ),
//               ),
//             ],
//           ),
//         ),

//         const SizedBox(height: 14),

//         // Retry
//         TextButton.icon(
//           onPressed: onRetry,
//           icon: const Icon(Icons.refresh, color: Colors.black45),
//           label: const Text('Réessayer', style: TextStyle(color: Colors.black45)),
//         ),
//         const SizedBox(height: 30),
//       ],
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'chatBotPage.dart'; // adjust path if needed

// ─────────────────────────────────────────────────────────────────────────────
// CONFIG — change IP to your machine's local IP
// ─────────────────────────────────────────────────────────────────────────────
const String _inferenceUrl = 'http://192.168.137.197:8000'; // inference server
const String _chatbotUrl   = 'http://192.168.137.197:8001'; // chatbot server

// ─────────────────────────────────────────────────────────────────────────────
// PROVIDER
// ─────────────────────────────────────────────────────────────────────────────

class DiagnosticProvider with ChangeNotifier {
  String status = 'IDLE'; // IDLE | ANALYZING | RESULT | ERROR
  Map<String, dynamic>? result;
  String? treatment;       // auto-fetched from chatbot
  File? image;
  String? errorMessage;

  Future<void> pickAndAnalyze({required ImageSource source}) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: source,
      imageQuality: 85,
    );
    if (picked == null) return;

    image = File(picked.path);
    status = 'ANALYZING';
    treatment = null;
    errorMessage = null;
    notifyListeners();

    try {
      // ── 1. Send image to inference server ────────────────────────────
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$_inferenceUrl/predict'),
      );
      request.files.add(
        await http.MultipartFile.fromPath('file', image!.path),
      );

      final response = await request.send().timeout(
        const Duration(seconds: 30),
      );
      final body = await response.stream.bytesToString();

      if (response.statusCode != 200) {
        throw Exception('Inference server error: ${response.statusCode}');
      }

      final data = jsonDecode(body);
      result = data;
      status = 'RESULT';
      notifyListeners();

      // ── 2. Auto-fetch treatment from chatbot if disease recognized ───
      if (data['unrecognized'] == false) {
        await _fetchTreatment(data['class']);
      }
    } catch (e) {
      status = 'ERROR';
      errorMessage = 'Connexion impossible. Vérifiez que le serveur est actif.';
      notifyListeners();
    }
  }

  Future<void> _fetchTreatment(String diseaseClass) async {
    try {
      final response = await http.post(
        Uri.parse('$_chatbotUrl/chat'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'message': 'Quels sont les symptômes, le traitement et la prévention pour cette maladie?',
          'disease_context': diseaseClass,
        }),
      ).timeout(const Duration(seconds: 20));

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        treatment = data['response'];
        notifyListeners();
      }
    } catch (_) {
      // Treatment fetch failed silently — result still shows
    }
  }

  void reset() {
    status = 'IDLE';
    result = null;
    treatment = null;
    image = null;
    errorMessage = null;
    notifyListeners();
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SCREEN
// ─────────────────────────────────────────────────────────────────────────────

class DiagnosticScreen extends StatelessWidget {
  const DiagnosticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DiagnosticProvider(),
      child: const _DiagnosticView(),
    );
  }
}

class _DiagnosticView extends StatelessWidget {
  const _DiagnosticView();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DiagnosticProvider>();
    const green = Color(0xFF1E7D34);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF0F4EC),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text(
          'NABTA',
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black87),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.language, color: Colors.black54),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Diagnostic de culture',
              style: TextStyle(
                  fontSize: 26, fontWeight: FontWeight.bold, color: green),
            ),
            const SizedBox(height: 6),
            const Text(
              'Prenez une photo claire des feuilles ou des\nfruits pour identifier les maladies\ninstantanément grâce à notre IA.',
              style: TextStyle(
                  color: Colors.black54, fontSize: 13, height: 1.5),
            ),
            const SizedBox(height: 20),

            // IDLE
            if (state.status == 'IDLE') ...[
              _CameraButton(onTap: (source) =>
                  state.pickAndAnalyze(source: source)),
              const SizedBox(height: 24),
              _RecentGrid(),
            ],

            // ANALYZING
            if (state.status == 'ANALYZING') ...[
              _ImagePreview(image: state.image),
              const SizedBox(height: 16),
              _AnalyzingCard(),
            ],

            // ERROR
            if (state.status == 'ERROR') ...[
              _ErrorCard(
                message: state.errorMessage ?? 'Erreur inconnue.',
                onRetry: state.reset,
              ),
            ],

            // RESULT
            if (state.status == 'RESULT') ...[
              _ImagePreview(image: state.image),
              const SizedBox(height: 16),
              _ResultCard(
                result: state.result!,
                treatment: state.treatment,
                onRetry: state.reset,
                onAskMore: () {
                  // Navigate to chatbot with disease context
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatbotPage(
                        diseaseContext: state.result!['class'],
                      ),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// CAMERA BUTTON — gallery + camera options
// ─────────────────────────────────────────────────────────────────────────────

class _CameraButton extends StatelessWidget {
  final Function(ImageSource) onTap;
  const _CameraButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => onTap(ImageSource.camera),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 28),
            decoration: BoxDecoration(
              color: const Color(0xFF1E7D34),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF1E7D34).withOpacity(0.35),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: const Column(
              children: [
                Icon(Icons.camera_alt_rounded, color: Colors.white, size: 44),
                SizedBox(height: 10),
                Text(
                  'Prendre une Photo',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () => onTap(ImageSource.gallery),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFF1E7D34)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.photo_library_rounded,
                    color: Color(0xFF1E7D34), size: 22),
                SizedBox(width: 8),
                Text(
                  'Choisir depuis la galerie',
                  style: TextStyle(
                      color: Color(0xFF1E7D34),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// RECENT GRID
// ─────────────────────────────────────────────────────────────────────────────

class _RecentGrid extends StatelessWidget {
  final List<Map<String, dynamic>> items = const [
    {'title': 'Mildiou', 'plant': 'Tomate', 'status': 'Critique', 'color': Colors.red},
    {'title': 'Rouille', 'plant': 'Blé', 'status': 'Modéré', 'color': Colors.orange},
    {'title': 'Pucerons', 'plant': 'Poivron', 'status': 'Début', 'color': Colors.green},
    {'title': 'Carence N', 'plant': 'Maïs', 'status': 'Surveiller', 'color': Colors.blue},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Diagnostics récents',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            TextButton(
              onPressed: () {},
              child: const Text('Voir tout',
                  style: TextStyle(color: Color(0xFF1E7D34))),
            ),
          ],
        ),
        const SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (_, i) => _GridCard(data: items[i]),
        ),
      ],
    );
  }
}

class _GridCard extends StatelessWidget {
  final Map<String, dynamic> data;
  const _GridCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05), blurRadius: 6)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: const Color(0xFF1E7D34).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              data['plant'],
              style: const TextStyle(
                  color: Color(0xFF1E7D34),
                  fontSize: 11,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          Text(data['title'],
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.circle, size: 8, color: data['color'] as Color),
              const SizedBox(width: 4),
              Text(data['status'],
                  style: const TextStyle(
                      color: Colors.black45, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// IMAGE PREVIEW
// ─────────────────────────────────────────────────────────────────────────────

class _ImagePreview extends StatelessWidget {
  final File? image;
  const _ImagePreview({this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: image != null
          ? Image.file(image!,
              height: 220, width: double.infinity, fit: BoxFit.cover)
          : Container(
              height: 220,
              color: Colors.grey.shade200,
              child:
                  const Icon(Icons.image, size: 60, color: Colors.grey),
            ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// ANALYZING CARD
// ─────────────────────────────────────────────────────────────────────────────

class _AnalyzingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05), blurRadius: 8)
        ],
      ),
      child: const Row(
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: CircularProgressIndicator(
                strokeWidth: 3, color: Color(0xFF1E7D34)),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Analyse en cours...',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
                SizedBox(height: 4),
                Text('Identification de la pathologie végétale',
                    style:
                        TextStyle(color: Colors.black45, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// ERROR CARD
// ─────────────────────────────────────────────────────────────────────────────

class _ErrorCard extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorCard({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Column(
        children: [
          const Icon(Icons.wifi_off, color: Colors.red, size: 40),
          const SizedBox(height: 12),
          Text(message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red, fontSize: 14)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E7D34)),
            child: const Text('Réessayer',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// RESULT CARD
// ─────────────────────────────────────────────────────────────────────────────

class _ResultCard extends StatelessWidget {
  final Map<String, dynamic> result;
  final String? treatment;
  final VoidCallback onRetry;
  final VoidCallback onAskMore;

  const _ResultCard({
    required this.result,
    required this.treatment,
    required this.onRetry,
    required this.onAskMore,
  });

  String _formatClassName(String raw) {
    // "Tomato___Late_blight" → "Tomate — Mildiou tardif"
    return raw.replaceAll('___', ' — ').replaceAll('_', ' ');
  }

  Color _confidenceColor(double conf) {
    if (conf >= 0.80) return Colors.green;
    if (conf >= 0.60) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final isUnrecognized = result['unrecognized'] == true;
    final confidence = (result['confidence'] as double);
    final top3 = result['top3'] as List;

    return Column(
      children: [
        // ── Main result card ──────────────────────────────────────────
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05), blurRadius: 8)
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'RÉSULTAT DÉTECTÉ',
                    style: TextStyle(
                        fontSize: 11,
                        color: Colors.black45,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5),
                  ),
                  const Spacer(),
                  if (isUnrecognized)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(color: Colors.orange.shade200),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.help_outline,
                              size: 13,
                              color: Colors.orange.shade700),
                          const SizedBox(width: 4),
                          Text('Non identifié',
                              style: TextStyle(
                                  color: Colors.orange.shade700,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  else
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.red.shade200),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.warning_amber_rounded,
                              size: 13,
                              color: Colors.red.shade600),
                          const SizedBox(width: 4),
                          Text('Maladie détectée',
                              style: TextStyle(
                                  color: Colors.red.shade600,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                isUnrecognized
                    ? 'Non reconnu / Faible confiance'
                    : _formatClassName(result['class']),
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1.2),
              ),
              const SizedBox(height: 4),
              if (!isUnrecognized)
                Text(
                  result['class'],
                  style: const TextStyle(
                      color: Colors.black45, fontSize: 12),
                ),
              const SizedBox(height: 14),

              // Confidence bar
              Row(
                children: [
                  const Text('Confiance de l\'IA',
                      style:
                          TextStyle(color: Colors.black45, fontSize: 12)),
                  const Spacer(),
                  Text(
                    '${(confidence * 100).round()}%',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _confidenceColor(confidence)),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: confidence,
                  minHeight: 8,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation(
                      _confidenceColor(confidence)),
                ),
              ),

              const SizedBox(height: 16),

              // Top 3
              const Text('Top 3 probabilités',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black54)),
              const SizedBox(height: 8),
              ...top3.map((item) {
                final label = item[0] as String;
                final prob = item[1] as double;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          _formatClassName(label),
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black87),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: prob,
                            minHeight: 6,
                            backgroundColor: Colors.grey.shade200,
                            valueColor:
                                const AlwaysStoppedAnimation(
                                    Color(0xFF1E7D34)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text('${(prob * 100).round()}%',
                          style: const TextStyle(
                              fontSize: 11,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),

        const SizedBox(height: 14),

        // ── Treatment card (auto from chatbot) ────────────────────────
        if (!isUnrecognized)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8)
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color:
                            const Color(0xFF1E7D34).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.eco_rounded,
                          color: Color(0xFF1E7D34), size: 18),
                    ),
                    const SizedBox(width: 10),
                    const Text('Traitement Recommandé',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  ],
                ),
                const SizedBox(height: 14),

                // Treatment from chatbot or loading
                treatment == null
                    ? const Row(
                        children: [
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Color(0xFF1E7D34)),
                          ),
                          SizedBox(width: 10),
                          Text('Génération du traitement...',
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 13)),
                        ],
                      )
                    : Text(
                        treatment!,
                        style: const TextStyle(
                            fontSize: 13,
                            height: 1.6,
                            color: Colors.black87),
                      ),

                const SizedBox(height: 16),

                // Ask more button → opens chatbot
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: onAskMore,
                    icon: const Icon(Icons.chat_bubble_outline,
                        color: Color(0xFF1E7D34), size: 18),
                    label: const Text('Poser plus de questions',
                        style: TextStyle(
                            color: Color(0xFF1E7D34),
                            fontWeight: FontWeight.w600)),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF1E7D34)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      padding:
                          const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),

        // ── Unrecognized advice ───────────────────────────────────────
        if (isUnrecognized)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.orange.shade200),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.info_outline,
                        color: Colors.orange, size: 20),
                    SizedBox(width: 8),
                    Text('Conseils',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.orange)),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  '• Photographiez une feuille unique avec un bon éclairage\n'
                  '• Évitez les photos de fruits ou de tiges\n'
                  '• Rapprochez-vous de la zone malade\n'
                  '• Consultez notre chatbot pour plus d\'aide',
                  style: TextStyle(
                      fontSize: 13,
                      height: 1.6,
                      color: Colors.black87),
                ),
              ],
            ),
          ),

        const SizedBox(height: 14),

        // Retry button
        TextButton.icon(
          onPressed: onRetry,
          icon: const Icon(Icons.refresh, color: Colors.black45),
          label: const Text('Réessayer',
              style: TextStyle(color: Colors.black45)),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
