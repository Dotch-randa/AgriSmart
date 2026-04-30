// // // import 'package:flutter/material.dart';
// // // import 'package:image_picker/image_picker.dart';
// // // import 'dart:io';
// // // import 'package:app_3ouchba/Screens/chatBotPage.dart'; // adapte le chemin
// // // import 'package:app_3ouchba/Screens/MapPage.dart';       // adapte le chemin

// // // class HomeScreen extends StatefulWidget {
// // //   const HomeScreen({super.key});

// // //   @override
// // //   State<HomeScreen> createState() => _HomeScreenState();
// // // }

// // // class _HomeScreenState extends State<HomeScreen> {
// // //   int _currentIndex = 0; // 0: accueil, 1: chat, 2: map
// // //   XFile? _selectedImage;

// // //   final List<Widget> _pages = [
// // //     const HomeContent(),
// // //     const Chatbotpage(),
// // //     const MapPage(),
// // //   ];

// // //   Future<void> _pickImage() async {
// // //     final picker = ImagePicker();
// // //     final image = await picker.pickImage(source: ImageSource.gallery);
// // //     if (image != null) {
// // //       setState(() => _selectedImage = image);
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Directionality(
// // //       textDirection: TextDirection.rtl,
// // //       child: Scaffold(
// // //         body: IndexedStack(
// // //           index: _currentIndex,
// // //           children: _pages,
// // //         ),
// // //         bottomNavigationBar: BottomNavigationBar(
// // //           currentIndex: _currentIndex,
// // //           onTap: (index) => setState(() => _currentIndex = index),
// // //           items: const [
// // //             BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
// // //             BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'دردشة'),
// // //             BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'خريطة'),
// // //           ],
// // //           backgroundColor: const Color(0xFFE8F5E9),
// // //           selectedItemColor: const Color(0xFF4A7A4A),
// // //           unselectedItemColor: Colors.grey,
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // // ===================== PAGE ACCUEIL AVEC SCAN IMAGE =====================
// // // class HomeContent extends StatelessWidget {
// // //   const HomeContent({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     // On récupère l'état parent pour accéder à _selectedImage et _pickImage
// // //     final state = context.findAncestorStateOfType<_HomeScreenState>();
// // //     return Scaffold(
// // //       backgroundColor: const Color(0xFFE8F5E9),
// // //       appBar: AppBar(
// // //         title: const Text('عشبة'),
// // //         backgroundColor: const Color(0xFF4A7A4A),
// // //         elevation: 0,
// // //       ),
// // //       body: SingleChildScrollView(
// // //         padding: const EdgeInsets.all(20),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             // Titre
// // //             const Text(
// // //               'وش حوال نباتات اليومي؟',
// // //               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF2D5A2D)),
// // //             ),
// // //             const SizedBox(height: 20),

// // //             // Bouton "استكشف نباتات أكثر!"
// // //             Center(
// // //               child: ElevatedButton(
// // //                 onPressed: () {},
// // //                 style: ElevatedButton.styleFrom(
// // //                   backgroundColor: const Color(0xFF4A7A4A),
// // //                   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
// // //                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
// // //                 ),
// // //                 child: const Text('استكشف نباتات أكثر!', style: TextStyle(fontSize: 16)),
// // //               ),
// // //             ),
// // //             const SizedBox(height: 40),

// // //             // Zone de scan / upload d'image
// // //             const Text(
// // //               '📸 ارفع صورة نباتك',
// // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2D5A2D)),
// // //             ),
// // //             const SizedBox(height: 12),
// // //             GestureDetector(
// // //               onTap: state?._pickImage,
// // //               child: Container(
// // //                 height: 200,
// // //                 width: double.infinity,
// // //                 decoration: BoxDecoration(
// // //                   color: Colors.white,
// // //                   borderRadius: BorderRadius.circular(20),
// // //                   border: Border.all(color: const Color(0xFF4A7A4A), width: 1.5),
// // //                 ),
// // //                 child: state?._selectedImage == null
// // //                     ? const Column(
// // //                         mainAxisAlignment: MainAxisAlignment.center,
// // //                         children: [
// // //                           Icon(Icons.cloud_upload, size: 50, color: Color(0xFF4A7A4A)),
// // //                           SizedBox(height: 8),
// // //                           Text('انقر لاختيار صورة من المعرض', style: TextStyle(color: Color(0xFF4A7A4A))),
// // //                         ],
// // //                       )
// // //                     : ClipRRect(
// // //                         borderRadius: BorderRadius.circular(20),
// // //                         child: Image.file(
// // //                           File(state!._selectedImage!.path),
// // //                           fit: BoxFit.cover,
// // //                           width: double.infinity,
// // //                           height: 200,
// // //                         ),
// // //                       ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }    

// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'dart:io';
// // import 'package:app_3ouchba/Screens/chatBotPage.dart';
// // import 'package:app_3ouchba/Screens/MapPage.dart';

// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});

// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen> {
// //   XFile? _selectedImage;

// //   Future<void> _pickImage() async {
// //     final picker = ImagePicker();
// //     final image = await picker.pickImage(source: ImageSource.gallery);
// //     if (image != null) {
// //       setState(() => _selectedImage = image);
// //     }
// //   }

// //   void _goToChat() {
// //     Navigator.push(context, MaterialPageRoute(builder: (_) => const Chatbotpage()));
// //   }

// //   void _goToMap() {
// //     Navigator.push(context, MaterialPageRoute(builder: (_) => const MapPage()));
// //   }

// //   void _goToProfile() {
// //     Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Directionality(
// //       textDirection: TextDirection.rtl,
// //       child: Scaffold(
// //         appBar: AppBar(
// //           backgroundColor: Colors.transparent,
// //           elevation: 0,
// //           // Logo à droite (leading en RTL) - Remplace le texte
// //           leading: Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Image.asset(
// //               'images/logo.jpg',
// //               width: 40,
// //               height: 40,
// //               fit: BoxFit.contain,
// //             ),
// //           ),
// //           // Pas de titre textuel
// //           title: const SizedBox.shrink(),
// //           // Actions: icônes de notification et profil à gauche (en RTL)
// //           actions: [
// //             IconButton(
// //               icon: const Icon(Icons.notifications_outlined, color: Color(0xFF2E7D32)),
// //               onPressed: () {},
// //             ),
// //             IconButton(
// //               icon: const Icon(Icons.person_outline, color: Color(0xFF2E7D32)),
// //               onPressed: _goToProfile,
// //             ),
// //           ],
// //         ),
// //         body: SingleChildScrollView(
// //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               // Carte d'accueil (inchangée)
// //               Container(
// //                 padding: const EdgeInsets.all(20),
// //                 decoration: BoxDecoration(
// //                   gradient: const LinearGradient(
// //                     colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
// //                     begin: Alignment.topLeft,
// //                     end: Alignment.bottomRight,
// //                   ),
// //                   borderRadius: BorderRadius.circular(30),
// //                 ),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: const [
// //                     Text('🌱 مرحباً بك في عشبة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF1B5E20))),
// //                     SizedBox(height: 12),
// //                     Text('وش حوال نباتات اليومي؟', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF2E7D32))),
// //                     Text('ساعدنا في حماية محصولك', style: TextStyle(fontSize: 14, color: Colors.grey)),
// //                   ],
// //                 ),
// //               ),
// //               const SizedBox(height: 28),
// //               Center(
// //                 child: ElevatedButton.icon(
// //                   onPressed: () {},
// //                   icon: const Icon(Icons.eco),
// //                   label: const Text('استكشف نباتات أكثر!'),
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: const Color(0xFF2E7D32),
// //                     foregroundColor: Colors.white,
// //                     padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
// //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(height: 32),
// //               Container(
// //                 decoration: BoxDecoration(
// //                   color: Colors.white,
// //                   borderRadius: BorderRadius.circular(32),
// //                   boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 20, offset: const Offset(0, 8))],
// //                 ),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     const Padding(
// //                       padding: EdgeInsets.all(20),
// //                       child: Text('📸 تشخيص النبات بالصورة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2E7D32))),
// //                     ),
// //                     GestureDetector(
// //                       onTap: _pickImage,
// //                       child: Container(
// //                         margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
// //                         height: 200,
// //                         decoration: BoxDecoration(
// //                           color: const Color(0xFFF5FBF5),
// //                           borderRadius: BorderRadius.circular(24),
// //                           border: Border.all(color: const Color(0xFFA5D6A7), width: 2, style: BorderStyle.solid),
// //                         ),
// //                         child: _selectedImage == null
// //                             ? Column(
// //                                 mainAxisAlignment: MainAxisAlignment.center,
// //                                 children: [
// //                                   Icon(Icons.cloud_upload_outlined, size: 60, color: const Color(0xFF66BB6A)),
// //                                   const SizedBox(height: 12),
// //                                   const Text('انقر لرفع صورة من المعرض', style: TextStyle(color: Color(0xFF2E7D32), fontSize: 14)),
// //                                   const SizedBox(height: 8),
// //                                   Text('أو التقط صورة', style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
// //                                 ],
// //                               )
// //                             : ClipRRect(
// //                                 borderRadius: BorderRadius.circular(24),
// //                                 child: Image.file(File(_selectedImage!.path), fit: BoxFit.cover, width: double.infinity, height: 200),
// //                               ),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 20),
// //                   ],
// //                 ),
// //               ),
// //               const SizedBox(height: 40),
// //             ],
// //           ),
// //         ),
// //         bottomNavigationBar: Container(
// //           margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //           decoration: BoxDecoration(
// //             color: Colors.white,
// //             borderRadius: BorderRadius.circular(40),
// //             boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, -2))],
// //           ),
// //           child: ClipRRect(
// //             borderRadius: BorderRadius.circular(40),
// //             child: BottomNavigationBar(
// //               type: BottomNavigationBarType.fixed,
// //               backgroundColor: Colors.white,
// //               selectedItemColor: const Color(0xFF2E7D32),
// //               unselectedItemColor: Colors.grey.shade500,
// //               items: const [
// //                 BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'الرئيسية'),
// //                 BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline_rounded), label: 'دردشة'),
// //                 BottomNavigationBarItem(icon: Icon(Icons.map_rounded), label: 'خريطة'),
// //               ],
// //               onTap: (index) {
// //                 if (index == 1) {
// //                   Navigator.push(context, MaterialPageRoute(builder: (_) => const Chatbotpage()));
// //                 } else if (index == 2) {
// //                   Navigator.push(context, MaterialPageRoute(builder: (_) => const MapPage()));
// //                 }
// //                 // index 0: بقاء في الصفحة الرئيسية
// //               },
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // صفحة الملف الشخصي (مبسطة)
// // class ProfilePage extends StatelessWidget {
// //   const ProfilePage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('الملف الشخصي'),
// //         backgroundColor: const Color(0xFF2E7D32),
// //       ),
// //       body: const Center(
// //         child: Text('صفحة الملف الشخصي\n(قيد الإعداد)', textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
// //       ),
// //     );
// //   }
// // }


// import 'package:app_3ouchba/Screens/ProfilePage.dart';
// import 'package:app_3ouchba/Widgets/analysis_result_modal.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:app_3ouchba/services/storage_service.dart';
// import 'package:app_3ouchba/services/plant_analysis_service.dart';
// import 'package:app_3ouchba/Screens/chatBotPage.dart';
// import 'package:app_3ouchba/Screens/MapPage.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   XFile? _selectedImage;
//   bool _isAnalyzing = false;

//   final _storageService = StorageService();
//   final _analysisService = PlantAnalysisService();

//   Future<void> _pickAndAnalyze() async {
//     final picker = ImagePicker();
//     final image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 85);
//     if (image == null) return;

//     setState(() {
//       _selectedImage = image;
//       _isAnalyzing = true;
//     });

//     try {
//      final user = Supabase.instance.client.auth.currentUser;
//       if (user == null) throw Exception('يجب تسجيل الدخول أولاً');

//       // 1. رفع الصورة لـ Firebase Storage
//       final imageUrl = await _storageService.uploadPlantImage(
//         File(image.path), user.id);

//       // 2. تحليل الصورة بالـ AI
//       final result = await _analysisService.analyzePlant(imageUrl);

//       setState(() => _isAnalyzing = false);

//       // 3. عرض النتيجة في Modal
//       if (mounted) _showAnalysisModal(result, imageUrl);

//     } catch (e) {
//       setState(() => _isAnalyzing = false);
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('خطأ: $e'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     }
//   }

//   void _showAnalysisModal(PlantAnalysisResult result, String imageUrl) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (_) => AnalysisResultModal(result: result, imageUrl: imageUrl),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: const Color(0xFFF0F7F0),
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           leading: Padding(
//             padding: const EdgeInsets.all(8),
//             child: Image.asset('images/logo.jpg', fit: BoxFit.contain),
//           ),
//           title: const SizedBox.shrink(),
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.notifications_outlined, color: Color(0xFF2E7D32)),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: const Icon(Icons.person_outline, color: Color(0xFF2E7D32)),
//               onPressed: () => Navigator.push(context,
//                   MaterialPageRoute(builder: (_) => const ProfilePage())),
//             ),
//           ],
//         ),
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // بطاقة ترحيب
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                     colors: [Color(0xFF1B5E20), Color(0xFF388E3C)],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: BorderRadius.circular(24),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text('🌱 مرحباً في عشبة',
//                         style: TextStyle(fontSize: 16, color: Colors.white70)),
//                     const SizedBox(height: 8),
//                     const Text('وش حوال نباتاتك اليوم؟',
//                         style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white)),
//                     const SizedBox(height: 4),
//                     const Text('ارفع صورة نبتتك نشخّصلك المشكلة',
//                         style: TextStyle(fontSize: 13, color: Colors.white60)),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 24),

//               // منطقة رفع الصورة
//               GestureDetector(
//                 onTap: _isAnalyzing ? null : _pickAndAnalyze,
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 300),
//                   height: 220,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(24),
//                     border: Border.all(
//                       color: _selectedImage != null
//                           ? const Color(0xFF2E7D32)
//                           : const Color(0xFFB0BEC5),
//                       width: 2,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.06),
//                         blurRadius: 20,
//                         offset: const Offset(0, 6),
//                       )
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(22),
//                     child: _isAnalyzing
//                         ? _buildAnalyzingState()
//                         : _selectedImage == null
//                             ? _buildUploadPrompt()
//                             : _buildImagePreview(),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 40),
//             ],
//           ),
//         ),
//         bottomNavigationBar: _buildBottomNav(),
//       ),
//     );
//   }

//   Widget _buildUploadPrompt() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: const Color(0xFFE8F5E9),
//             shape: BoxShape.circle,
//           ),
//           child: const Icon(Icons.add_a_photo_outlined,
//               size: 48, color: Color(0xFF2E7D32)),
//         ),
//         const SizedBox(height: 16),
//         const Text('انقر لرفع صورة النبات',
//             style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: Color(0xFF2E7D32))),
//         const SizedBox(height: 6),
//         Text('سنحلل المرض تلقائياً بالذكاء الاصطناعي',
//             style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
//       ],
//     );
//   }

//   Widget _buildAnalyzingState() {
//     return Container(
//       color: const Color(0xFFF1F8E9),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation(Color(0xFF2E7D32))),
//           const SizedBox(height: 16),
//           const Text('جاري تحليل النبات...',
//               style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Color(0xFF2E7D32))),
//           const SizedBox(height: 4),
//           Text('الذكاء الاصطناعي يفحص الصورة',
//               style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
//         ],
//       ),
//     );
//   }

//   Widget _buildImagePreview() {
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         Image.file(File(_selectedImage!.path), fit: BoxFit.cover),
//         Positioned(
//           bottom: 12,
//           right: 12,
//           child: ElevatedButton.icon(
//             onPressed: _pickAndAnalyze,
//             icon: const Icon(Icons.refresh, size: 16),
//             label: const Text('تحليل جديد'),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFF2E7D32),
//               foregroundColor: Colors.white,
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20)),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildBottomNav() {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(40),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black.withOpacity(0.07),
//               blurRadius: 20,
//               offset: const Offset(0, -4))
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(40),
//         child: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: Colors.white,
//           selectedItemColor: const Color(0xFF2E7D32),
//           unselectedItemColor: Colors.grey.shade400,
//           items: const [
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.home_rounded), label: 'الرئيسية'),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.chat_bubble_outline_rounded),
//                 label: 'دردشة'),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.map_rounded), label: 'خريطة'),
//           ],
//           onTap: (index) {
//             if (index == 1) {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (_) => const ChatbotPage()));
//             } else if (index == 2) {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (_) => const MapPage()));
//             }
//           },
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   XFile? _selectedImage;
//   bool _isAnalyzing = false;

//   // Couleurs du thème Nabta
//   static const Color primaryGreen = Color(0xFF2E7D32);
//   static const Color surfaceBeige = Color(0xFFF5F5DC);
//   static const Color darkGreen = Color(0xFF0D631B);
//   static const Color errorRed = Color(0xFFba1a1a);
//   static const Color errorContainer = Color(0xFFFFDAD6);

//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 85);
//     if (image != null) {
//       setState(() => _selectedImage = image);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl, // Support Arabe
//       child: Scaffold(
//         backgroundColor: surfaceBeige,
//         appBar: AppBar(
//           backgroundColor: surfaceBeige,
//           elevation: 0,
//           leading: IconButton(
//             icon: const Icon(Icons.menu, color: primaryGreen),
//             onPressed: () {},
//           ),
//           title: const Text(
//             'NABTA',
//             style: TextStyle(
//               color: primaryGreen,
//               fontWeight: FontWeight.w900,
//               fontSize: 22,
//               letterSpacing: -0.5,
//             ),
//           ),
//           actions: [
//             _buildLanguageSelector(),
//             const SizedBox(width: 8),
//           ],
//         ),
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 16),
//               _buildHeroSection(),
//               const SizedBox(height: 16),
//               _buildQuickStats(),
//               const SizedBox(height: 20),
//               _buildActionGrid(),
//               const SizedBox(height: 24),
//               const Text(
//                 'Conseils du jour',
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
//               ),
//               const SizedBox(height: 16),
//               _buildDailyAdvice(),
//               const SizedBox(height: 16),
//               _buildAlertCard(),
//               const SizedBox(height: 100), // Espace pour la barre de navigation
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: _pickImage,
//           backgroundColor: darkGreen,
//           elevation: 4,
//           child: const Icon(Icons.photo_camera, color: Colors.white, size: 28),
//         ),
//         bottomNavigationBar: _buildBottomNav(),
//       ),
//     );
//   }

//   Widget _buildLanguageSelector() {
//     return Center(
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.withOpacity(0.3)),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: const [
//             Icon(Icons.language, size: 18, color: Colors.black87),
//             SizedBox(width: 4),
//             Text('FR', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 12)),
//             Icon(Icons.expand_more, size: 16, color: Colors.black87),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHeroSection() {
//     return Container(
//       height: 200,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(24),
//         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)],
//         image: const DecorationImage(
//           image: NetworkImage('https://images.unsplash.com/photo-1500651230702-0e2d8a49d4ad?auto=format&fit=crop&q=80&w=1000'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(24),
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
//           ),
//         ),
//         padding: const EdgeInsets.all(20),
//         alignment: Alignment.bottomRight,
//         child: const Text(
//           "L'expertise agricole dans ta poche",
//           style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold, height: 1.2),
//         ),
//       ),
//     );
//   }

//   Widget _buildQuickStats() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(24),
//         border: Border.all(color: Colors.grey.shade200),
//       ),
//       child: Row(
//         children: [
//           Expanded(child: _buildStatItem('Météo', '28°C', Icons.sunny)),
//           Container(width: 1, height: 40, color: Colors.grey.shade100),
//           Expanded(child: _buildStatItem('État Sol', 'Optimal', Icons.water_drop)),
//         ],
//       ),
//     );
//   }

//   Widget _buildStatItem(String label, String value, IconData icon) {
//     return Column(
//       children: [
//         Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500)),
//         const SizedBox(height: 4),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, color: primaryGreen, size: 20),
//             const SizedBox(width: 4),
//             Text(value, style: const TextStyle(color: primaryGreen, fontSize: 20, fontWeight: FontWeight.bold)),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildActionGrid() {
//     return GridView.count(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       crossAxisCount: 2,
//       crossAxisSpacing: 16,
//       mainAxisSpacing: 16,
//       childAspectRatio: 1.1,
//       children: [
//         _buildActionCard('Assistant', Icons.chat_bubble, true),
//         _buildActionCard('Diagnostic', Icons.biotech, false),
//         _buildActionCard('Fiches', Icons.library_books, false),
//         _buildActionCard('Carte', Icons.explore, false),
//       ],
//     );
//   }

//   Widget _buildActionCard(String label, IconData icon, bool isActive) {
//     return InkWell(
//       onTap: () {},
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(24),
//           border: Border.all(color: Colors.grey.shade100),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: isActive ? primaryGreen : const Color(0xFFE8F5E9),
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(icon, color: isActive ? Colors.white : primaryGreen, size: 30),
//             ),
//             const SizedBox(height: 12),
//             Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87)),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDailyAdvice() {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: primaryGreen,
//         borderRadius: BorderRadius.circular(24),
//         image: DecorationImage(
//           image: const NetworkImage('https://www.transparenttextures.com/patterns/leaf.png'),
//           colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.05), BlendMode.srcIn),
//           repeat: ImageRepeat.repeat,
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//             decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(10)),
//             child: const Text('SAISON DES OLIVES', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
//           ),
//           const SizedBox(height: 12),
//           const Text('Irrigation pré-récolte', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 8),
//           const Text(
//             'Maintenez un apport régulier pour assurer un bon calibre de fruit...',
//             style: TextStyle(color: Colors.white70, fontSize: 14),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildAlertCard() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: errorContainer,
//         borderRadius: BorderRadius.circular(24),
//         border: Border.all(color: errorContainer),
//       ),
//       child: Row(
//         children: const [
//           Icon(Icons.warning_amber_rounded, color: Color(0xFF93000A), size: 28),
//           SizedBox(width: 16),
//           Expanded(
//             child: Text(
//               'Alerte Météo : Vents violents prévus à Biskra demain matin.',
//               style: TextStyle(color: Color(0xFF93000A), fontWeight: FontWeight.bold, fontSize: 14),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBottomNav() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
//       ),
//       child: BottomNavigationBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         type: BottomNavigationBarType.fixed,
//         currentIndex: 0,
//         selectedItemColor: primaryGreen,
//         unselectedItemColor: Colors.grey,
//         selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
//         unselectedLabelStyle: TextStyle(fontWeight: FontWeight.medium, fontSize: 12),
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Accueil'),
//           BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Assistant'),
//           BottomNavigationBarItem(icon: Icon(Icons.library_books_outlined), label: 'Fiches'),
//           BottomNavigationBarItem(icon: Icon(Icons.event_note_outlined), label: 'Journal'),
//           BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: 'Carte'),
//         ],
//       ),
//     );
//   }
// }






// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// void main() {
//   runApp(const MaterialApp(
//     home: HomeScreen(),
//     debugShowCheckedModeBanner: false,
//   ));
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   XFile? _selectedImage;
//   int _currentIndex = 0; // Pour gérer le changement d'onglets

//   // Couleurs du thème Nabta
//   static const Color primaryGreen = Color(0xFF2E7D32);
//   static const Color surfaceBeige = Color(0xFFF5F5DC);
//   static const Color darkGreen = Color(0xFF0D631B);
//   static const Color errorRed = Color(0xFFba1a1a);
//   static const Color errorContainer = Color(0xFFFFDAD6);

//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final image = await picker.pickImage(
//       source: ImageSource.gallery, 
//       imageQuality: 85,
//     );
//     if (image != null) {
//       setState(() => _selectedImage = image);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl, // Support Arabe/RTL
//       child: Scaffold(
//         backgroundColor: surfaceBeige,
//         appBar: AppBar(
//           backgroundColor: surfaceBeige,
//           elevation: 0,
//           leading: IconButton(
//             icon: const Icon(Icons.menu, color: primaryGreen),
//             onPressed: () {},
//           ),
//           title: const Text(
//             'NABTA',
//             style: TextStyle(
//               color: primaryGreen,
//               fontWeight: FontWeight.w900,
//               fontSize: 22,
//               letterSpacing: -0.5,
//             ),
//           ),
//           actions: [
//             _buildLanguageSelector(),
//             const SizedBox(width: 8),
//           ],
//         ),
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 16),
              
//               // Affichage de l'image sélectionnée si elle existe
//               if (_selectedImage != null) _buildImagePreview(),

//               _buildHeroSection(),
//               const SizedBox(height: 16),
//               _buildQuickStats(),
//               const SizedBox(height: 20),
//               _buildActionGrid(),
//               const SizedBox(height: 24),
//               const Text(
//                 'Conseils du jour',
//                 style: TextStyle(
//                   fontSize: 22, 
//                   fontWeight: FontWeight.bold, 
//                   color: Colors.black87,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               _buildDailyAdvice(),
//               const SizedBox(height: 16),
//               _buildAlertCard(),
//               const SizedBox(height: 100), 
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: _pickImage,
//           backgroundColor: darkGreen,
//           elevation: 4,
//           child: const Icon(Icons.photo_camera, color: Colors.white, size: 28),
//         ),
//         bottomNavigationBar: _buildBottomNav(),
//       ),
//     );
//   }

//   // --- Widgets de composants ---

//   Widget _buildImagePreview() {
//     return Container(
//     //  margin: const EdgeInsets.bottom(16),
//       height: 200,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(24),
//         border: Border.all(color: primaryGreen, width: 2),
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(22),
//         child: Image.file(
//           File(_selectedImage!.path),
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }

//   Widget _buildLanguageSelector() {
//     return Center(
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.withOpacity(0.3)),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: const Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(Icons.language, size: 18, color: Colors.black87),
//             SizedBox(width: 4),
//             Text('FR', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 12)),
//             Icon(Icons.expand_more, size: 16, color: Colors.black87),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHeroSection() {
//     return Container(
//       height: 200,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(24),
//        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)],
//         image: const DecorationImage(
//           image: NetworkImage('https://images.unsplash.com/photo-1500651230702-0e2d8a49d4ad?auto=format&fit=crop&q=80&w=1000'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(24),
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
//           ),
//         ),
//         padding: const EdgeInsets.all(20),
//         alignment: Alignment.bottomRight,
//         child: const Text(
//           "L'expertise agricole dans ta poche",
//           style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold, height: 1.2),
//         ),
//       ),
//     );
//   }

//   Widget _buildQuickStats() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(24),
//         border: Border.all(color: Colors.grey.shade200),
//       ),
//       child: Row(
//         children: [
//           Expanded(child: _buildStatItem('Météo', '28°C', Icons.sunny)),
//           Container(width: 1, height: 40, color: Colors.grey.shade100),
//           Expanded(child: _buildStatItem('État Sol', 'Optimal', Icons.water_drop)),
//         ],
//       ),
//     );
//   }

//   Widget _buildStatItem(String label, String value, IconData icon) {
//     return Column(
//       children: [
//         Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500)),
//         const SizedBox(height: 4),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, color: primaryGreen, size: 20),
//             const SizedBox(width: 4),
//             Text(value, style: const TextStyle(color: primaryGreen, fontSize: 20, fontWeight: FontWeight.bold)),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildActionGrid() {
//     return GridView.count(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       crossAxisCount: 2,
//       crossAxisSpacing: 16,
//       mainAxisSpacing: 16,
//       childAspectRatio: 1.1,
//       children: [
//         _buildActionCard('Assistant', Icons.chat_bubble, true),
//         _buildActionCard('Diagnostic', Icons.biotech, false),
//         _buildActionCard('Fiches', Icons.library_books, false),
//         _buildActionCard('Carte', Icons.explore, false),
//       ],
//     );
//   }

//   Widget _buildActionCard(String label, IconData icon, bool isActive) {
//     return InkWell(
//       onTap: () {},
//       borderRadius: BorderRadius.circular(24),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(24),
//           border: Border.all(color: Colors.grey.shade100),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: isActive ? primaryGreen : const Color(0xFFE8F5E9),
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(icon, color: isActive ? Colors.white : primaryGreen, size: 30),
//             ),
//             const SizedBox(height: 12),
//             Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87)),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDailyAdvice() {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: primaryGreen,
//         borderRadius: BorderRadius.circular(24),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//             decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(10)),
//             child: const Text('SAISON DES OLIVES', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
//           ),
//           const SizedBox(height: 12),
//           const Text('Irrigation pré-récolte', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 8),
//           const Text(
//             'Maintenez un apport régulier pour assurer un bon calibre de fruit...',
//             style: TextStyle(color: Colors.white70, fontSize: 14),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildAlertCard() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: errorContainer,
//         borderRadius: BorderRadius.circular(24),
//         border: Border.all(color: errorRed.withOpacity(0.2)),
//       ),
//       child: const Row(
//         children: [
//           Icon(Icons.warning_amber_rounded, color: Color(0xFF93000A), size: 28),
//           SizedBox(width: 16),
//           Expanded(
//             child: Text(
//               'Alerte Météo : Vents violents prévus à Biskra demain matin.',
//               style: TextStyle(color: Color(0xFF93000A), fontWeight: FontWeight.bold, fontSize: 14),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBottomNav() {
//     return BottomNavigationBar(
//       currentIndex: _currentIndex,
//       onTap: (index) {
//         setState(() {
//           _currentIndex = index;
//         });
//       },
//       elevation: 8,
//       backgroundColor: Colors.white,
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: primaryGreen,
//       unselectedItemColor: Colors.grey,
//       selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
//       unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Accueil'),
//         BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Assistant'),
//         BottomNavigationBarItem(icon: Icon(Icons.library_books_outlined), label: 'Fiches'),
//         BottomNavigationBarItem(icon: Icon(Icons.event_note_outlined), label: 'Journal'),
//         BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: 'Carte'),
//       ],
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// void main() {
//   runApp(const MaterialApp(
//     home: HomeScreen(),
//     debugShowCheckedModeBanner: false,
//   ));
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   XFile? _selectedImage;
//   //int _currentIndex = 0; // Gardé au cas où tu veux l'utiliser plus tard

//   // Couleurs du thème Nabta
//   static const Color primaryGreen = Color(0xFF2E7D32);
//   static const Color surfaceBeige = Color(0xFFF5F5DC);
//   static const Color darkGreen = Color(0xFF0D631B);
//   static const Color errorRed = Color(0xFFba1a1a);
//   static const Color errorContainer = Color(0xFFFFDAD6);

//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final image = await picker.pickImage(
//       source: ImageSource.gallery,
//       imageQuality: 85,
//     );
//     if (image != null) {
//       setState(() => _selectedImage = image);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: surfaceBeige,
//         appBar: AppBar(
//           backgroundColor: surfaceBeige,
//           elevation: 0,
//           leading: IconButton(
//             icon: const Icon(Icons.menu, color: primaryGreen),
//             onPressed: () {},
//           ),
//           title: const Text(
//             'NABTA',
//             style: TextStyle(
//               color: primaryGreen,
//               fontWeight: FontWeight.w900,
//               fontSize: 22,
//               letterSpacing: -0.5,
//             ),
//           ),
//           actions: [
//             _buildLanguageSelector(),
//             const SizedBox(width: 8),
//           ],
//         ),
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 16),

//               // Affichage de l'image sélectionnée
//               if (_selectedImage != null) _buildImagePreview(),

//               _buildHeroSection(),
//               const SizedBox(height: 16),
//               _buildQuickStats(),
//               const SizedBox(height: 20),
//               _buildActionGrid(),
//               const SizedBox(height: 24),
//               const Text(
//                 'Conseils du jour',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               _buildDailyAdvice(),
//               const SizedBox(height: 16),
//               _buildAlertCard(),
//               const SizedBox(height: 100), // Espace en bas
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: _pickImage,
//           backgroundColor: darkGreen,
//           elevation: 4,
//           child: const Icon(Icons.photo_camera, color: Colors.white, size: 28),
//         ),
//         // BottomNavigationBar supprimée comme demandé
//       ),
//     );
//   }

//   // ====================== Widgets ======================

//   Widget _buildImagePreview() {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       height: 200,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(24),
//         border: Border.all(color: primaryGreen, width: 2),
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(22),
//         child: Image.file(
//           File(_selectedImage!.path),
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }

//   Widget _buildLanguageSelector() {
//     return Center(
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.withOpacity(0.3)),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: const Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(Icons.language, size: 18, color: Colors.black87),
//             SizedBox(width: 4),
//             Text('FR',
//                 style: TextStyle(
//                     color: Colors.black87,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 12)),
//             Icon(Icons.expand_more, size: 16, color: Colors.black87),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHeroSection() {
//     return Container(
//       height: 200,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(24),
//         boxShadow: [
//           BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)
//         ],
//         image: const DecorationImage(
//           image: NetworkImage(
//               'https://images.unsplash.com/photo-1500651230702-0e2d8a49d4ad?auto=format&fit=crop&q=80&w=1000'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(24),
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.transparent, Colors.black.withAlpha(179)],
//           ),
//         ),
//         padding: const EdgeInsets.all(20),
//         alignment: Alignment.bottomRight,
//         child: const Text(
//           "L'expertise agricole dans ta poche",
//           style: TextStyle(
//               color: Colors.white,
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//               height: 1.2),
//         ),
//       ),
//     );
//   }

//   Widget _buildQuickStats() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(24),
//         border: Border.all(color: Colors.grey.shade200),
//       ),
//       child: Row(
//         children: [
//           Expanded(child: _buildStatItem('Météo', '28°C', Icons.sunny)),
//           Container(width: 1, height: 40, color: Colors.grey.shade100),
//           Expanded(child: _buildStatItem('État Sol', 'Optimal', Icons.water_drop)),
//         ],
//       ),
//     );
//   }

//   Widget _buildStatItem(String label, String value, IconData icon) {
//     return Column(
//       children: [
//         Text(label,
//             style: const TextStyle(
//                 color: Colors.grey,
//                 fontSize: 12,
//                 fontWeight: FontWeight.w500)),
//         const SizedBox(height: 4),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, color: primaryGreen, size: 20),
//             const SizedBox(width: 4),
//             Text(value,
//                 style: const TextStyle(
//                     color: primaryGreen,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold)),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildActionGrid() {
//     return GridView.count(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       crossAxisCount: 2,
//       crossAxisSpacing: 16,
//       mainAxisSpacing: 16,
//       childAspectRatio: 1.1,
//       children: [
//         _buildActionCard('Assistant', Icons.chat_bubble, true),
//         _buildActionCard('Diagnostic', Icons.biotech, false),
//         _buildActionCard('Fiches', Icons.library_books, false),
//         _buildActionCard('Carte', Icons.explore, false),
//       ],
//     );
//   }

//   Widget _buildActionCard(String label, IconData icon, bool isActive) {
//     return InkWell(
//       onTap: () {},
//       borderRadius: BorderRadius.circular(24),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(24),
//           border: Border.all(color: Colors.grey.shade100),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: isActive ? primaryGreen : const Color(0xFFE8F5E9),
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(
//                 icon,
//                 color: isActive ? Colors.white : primaryGreen,
//                 size: 30,
//               ),
//             ),
//             const SizedBox(height: 12),
//             Text(label,
//                 style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                     color: Colors.black87)),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDailyAdvice() {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: primaryGreen,
//         borderRadius: BorderRadius.circular(24),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//             decoration: BoxDecoration(
//                 color: Colors.white24,
//                 borderRadius: BorderRadius.circular(10)),
//             child: const Text('SAISON DES OLIVES',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 10,
//                     fontWeight: FontWeight.bold)),
//           ),
//           const SizedBox(height: 12),
//           const Text('Irrigation pré-récolte',
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold)),
//           const SizedBox(height: 8),
//           const Text(
//             'Maintenez un apport régulier pour assurer un bon calibre de fruit...',
//             style: TextStyle(color: Colors.white70, fontSize: 14),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildAlertCard() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: errorContainer,
//         borderRadius: BorderRadius.circular(24),
//         border: Border.all(color: errorRed.withOpacity(0.2)),
//       ),
//       child: const Row(
//         children: [
//           Icon(Icons.warning_amber_rounded,
//               color: Color(0xFF93000A), size: 28),
//           SizedBox(width: 16),
//           Expanded(
//             child: Text(
//               'Alerte Météo : Vents violents prévus à Biskra demain matin.',
//               style: TextStyle(
//                   color: Color(0xFF93000A),
//                   fontWeight: FontWeight.bold,
//                   fontSize: 14),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }  


import 'dart:convert';
import 'package:app_3ouchba/Screens/diagnosticpage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'chatBotPage.dart';
import 'fiches_page.dart';
import 'MapPage.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

// ─── Weather model ────────────────────────────────────────────────────────────

class WeatherData {
  final double tempC;
  final String description;
  final String icon;       // OWM icon code e.g. "01d"
  final double humidity;
  final String cityName;

  const WeatherData({
    required this.tempC,
    required this.description,
    required this.icon,
    required this.humidity,
    required this.cityName,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
    tempC:       (json['main']['temp'] as num).toDouble() - 273.15,
    description: json['weather'][0]['description'] as String,
    icon:        json['weather'][0]['icon'] as String,
    humidity:    (json['main']['humidity'] as num).toDouble(),
    cityName:    json['name'] as String,
  );

  IconData get flutterIcon {
    // Map OWM icon codes to Material icons
    if (icon.startsWith('01')) return Icons.wb_sunny;
    if (icon.startsWith('02') ) return Icons.cloud;
    if (icon.startsWith('03') ) return Icons.cloud;
    if (icon.startsWith('04') ) return Icons.cloud;
    if (icon.startsWith('09') || icon.startsWith('10')) return Icons.grain;
    if (icon.startsWith('11')) return Icons.bolt;
    if (icon.startsWith('13')) return Icons.ac_unit;
    if (icon.startsWith('50')) return Icons.foggy;
    return Icons.wb_sunny;
  }
}

// ─── Home Screen ──────────────────────────────────────────────────────────────

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? _selectedImage;
  WeatherData? _weather;
  bool _loadingWeather = false;
  String? _weatherError;

  // ── Replace with your actual OWM API key ──────────────────────────────────
  static const String _owmApiKey = 'b3f551464860e72f790075b223e15277';

  static const Color primaryGreen   = Color(0xFF2E7D32);
  static const Color surfaceBeige   = Color(0xFFF5F5DC);
  static const Color darkGreen      = Color(0xFF0D631B);
  static const Color errorRed       = Color(0xFFba1a1a);
  static const Color errorContainer = Color(0xFFFFDAD6);

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  // ── Location + Weather ──────────────────────────────────────────────────────

  Future<void> _fetchWeather() async {
    setState(() { _loadingWeather = true; _weatherError = null; });
    try {
      final pos = await _getUserPosition();
      final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather'
        '?lat=${pos.latitude}&lon=${pos.longitude}'
        '&appid=$_owmApiKey&lang=fr',
      );
      final res = await http.get(url).timeout(const Duration(seconds: 8));
      if (res.statusCode == 200) {
        final data = WeatherData.fromJson(jsonDecode(res.body) as Map<String, dynamic>);
        setState(() { _weather = data; _loadingWeather = false; });
      } else {
        throw Exception('OWM ${res.statusCode}');
      }
    } catch (e) {
      setState(() { _loadingWeather = false; _weatherError = e.toString(); });
    }
  }

  Future<Position> _getUserPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) throw Exception('Location services disabled');

    LocationPermission perm = await Geolocator.checkPermission();
    if (perm == LocationPermission.denied) perm = await Geolocator.requestPermission();
    if (perm == LocationPermission.deniedForever) throw Exception('Permission denied');

    return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  }
// ── Image picker ────────────────────────────────────────────────────────────

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 85);
    if (image != null) setState(() => _selectedImage = image);
  }

  // ── Build ───────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: surfaceBeige,
        appBar: AppBar(
          backgroundColor: surfaceBeige,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: primaryGreen),
            onPressed: () {},
          ),
          title: const Text(
            'NABTA',
            style: TextStyle(color: primaryGreen, fontWeight: FontWeight.w900, fontSize: 22, letterSpacing: -0.5),
          ),
          actions: [
            _buildLanguageSelector(),
            const SizedBox(width: 8),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              if (_selectedImage != null) _buildImagePreview(),
              _buildHeroSection(),
              const SizedBox(height: 16),
              _buildQuickStats(),
              const SizedBox(height: 20),
              _buildActionGrid(),
              const SizedBox(height: 24),
              const Text('Conseils du jour', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87)),
              const SizedBox(height: 16),
              _buildDailyAdvice(),
              const SizedBox(height: 16),
              _buildAlertCard(),
              const SizedBox(height: 100),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _pickImage,
          backgroundColor: darkGreen,
          elevation: 4,
          child: const Icon(Icons.photo_camera, color: Colors.white, size: 28),
        ),
      ),
    );
  }

  // ── Widgets ─────────────────────────────────────────────────────────────────

  Widget _buildImagePreview() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: primaryGreen, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Image.file(File(_selectedImage!.path), fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildLanguageSelector() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.language, size: 18, color: Colors.black87),
            SizedBox(width: 4),
            Text('FR', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 12)),
            Icon(Icons.expand_more, size: 16, color: Colors.black87),
          ],
        ),
      ),
    );
  }
Widget _buildHeroSection() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)],
        image: const DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1500651230702-0e2d8a49d4ad?auto=format&fit=crop&q=80&w=1000'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black.withAlpha(179)],
          ),
        ),
        padding: const EdgeInsets.all(20),
        alignment: Alignment.bottomRight,
        child: const Text(
          "L'expertise agricole dans ta poche",
          style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold, height: 1.2),
        ),
      ),
    );
  }

  /// Real weather from OpenWeatherMap — falls back to skeleton on error/loading.
  Widget _buildQuickStats() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Expanded(child: _buildWeatherStat()),
          Container(width: 1, height: 40, color: Colors.grey.shade100),
          Expanded(child: _buildHumidityStat()),
        ],
      ),
    );
  }

  Widget _buildWeatherStat() {
    if (_loadingWeather) {
      return _buildStatItem('Météo', '...', Icons.cloud, subtitle: 'Chargement');
    }
    if (_weather != null) {
      return _buildStatItem(
        _weather!.cityName,
        '${_weather!.tempC.toStringAsFixed(1)}°C',
        _weather!.flutterIcon,
        subtitle: _weather!.description,
      );
    }
    return GestureDetector(
      onTap: _fetchWeather,
      child: _buildStatItem('Météo', '--', Icons.cloud_off, subtitle: 'Appuyer pour réessayer'),
    );
  }

  Widget _buildHumidityStat() {
    if (_loadingWeather) return _buildStatItem('Humidité', '...', Icons.water_drop);
    if (_weather != null) {
      return _buildStatItem(
        'Humidité',
        '${_weather!.humidity.toInt()}%',
        Icons.water_drop,
      );
    }
    return _buildStatItem('Humidité', '--', Icons.water_drop);
  }

  Widget _buildStatItem(String label, String value, IconData icon, {String? subtitle}) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500), maxLines: 1, overflow: TextOverflow.ellipsis),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: primaryGreen, size: 20),
            const SizedBox(width: 4),
            Flexible(child: Text(value, style: const TextStyle(color: primaryGreen, fontSize: 18, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis)),
          ],
        ),
        if (subtitle != null)
          Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 10), maxLines: 1, overflow: TextOverflow.ellipsis),
      ],
    );
  }
  Widget _buildActionGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.1,
      children: [
        _buildActionCard('Assistant',  Icons.chat_bubble,  true,  () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ChatbotPage()))),
        _buildActionCard('Diagnostic', Icons.biotech,      false, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DiagnosticScreen()))),
        _buildActionCard('Fiches',     Icons.library_books,false, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FichesPage()))),
        _buildActionCard('Carte',      Icons.explore,      false, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MapPage()))),
      ],
    );
  }

  Widget _buildActionCard(String label, IconData icon, bool isActive, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey.shade100),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isActive ? primaryGreen : const Color(0xFFE8F5E9),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: isActive ? Colors.white : primaryGreen, size: 30),
            ),
            const SizedBox(height: 12),
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87)),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyAdvice() {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(color: primaryGreen, borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(10)),
            child: const Text('SAISON DES OLIVES', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          const Text('Irrigation pré-récolte', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            'Maintenez un apport régulier pour assurer un bon calibre de fruit...',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: errorContainer,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: errorRed.withOpacity(0.2)),
      ),
      child: const Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: Color(0xFF93000A), size: 28),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              'Alerte Météo : Vents violents prévus à Biskra demain matin.',
              style: TextStyle(color: Color(0xFF93000A), fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}