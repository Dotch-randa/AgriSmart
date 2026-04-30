import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true; // true = connexion, false = inscription
  bool showPassword = false;
  bool showConfirmPassword = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  void submit() {
    if (!isLogin && passwordController.text != confirmController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("كلمة المرور غير متطابقة")),
      );
      return;
    }
    // Ici tu peux ajouter la logique (Navigator.push vers home)
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD4EDDA), // vert clair
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo ou titre principal
                const Icon(Icons.spa, size: 64, color: Color(0xFF5A9E6F)),
                const SizedBox(height: 10),
                Text(
                  isLogin ? "تسجيل الدخول" : "إنشاء حساب جديد",
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF2D5A2D)),
                ),
                const SizedBox(height: 30),

                // Champ email
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "اسم المستخدم / الإيميل",
                    hintText: "example@gmail.com",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 15),

                // Champ mot de passe
                TextField(
                  controller: passwordController,
                  obscureText: !showPassword,
                  decoration: InputDecoration(
                    labelText: "كلمة المرور",
                    suffixIcon: IconButton(
                      icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
                      onPressed: () => setState(() => showPassword = !showPassword),
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 15),

                // Champ confirmation (uniquement pour inscription)
                if (!isLogin)
                  Column(
                    children: [
                      TextField(
                        controller: confirmController,
                        obscureText: !showConfirmPassword,
                        decoration: InputDecoration(
                          labelText: "تأكيد كلمة المرور",
                          suffixIcon: IconButton(
                            icon: Icon(showConfirmPassword ? Icons.visibility : Icons.visibility_off),
                            onPressed: () => setState(() => showConfirmPassword = !showConfirmPassword),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),

                // Checkbox "Afficher le mot de passe" (optionnel mais simple)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("إظهار كلمة المرور", style: TextStyle(fontSize: 14)),
                    Checkbox(
                      value: showPassword,
                      onChanged: (val) => setState(() => showPassword = val ?? false),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Bouton principal
                ElevatedButton(
                  onPressed: submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5A9E6F),
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text(isLogin ? "الدخول" : "التسجيل", style: const TextStyle(fontSize: 18, color: Colors.white)),
                ),
                const SizedBox(height: 20),

                // Lien pour basculer entre connexion et inscription
                TextButton(
                  onPressed: () => setState(() => isLogin = !isLogin),
                  child: Text(
                    isLogin ? "ليس لديك حساب؟ إنشاء حساب جديد" : "لديك حساب؟ تسجيل الدخول",
                    style: const TextStyle(color: Color(0xFF5A9E6F)),
                  ),
                ),

                // Section "تسجيل الدخول بحسابات أخرى" (simple text + icônes)
                const SizedBox(height: 20),
                const Text("تسجيل الدخول بحسابات أخرى", style: TextStyle(fontSize: 14)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(backgroundColor: Colors.white, child: Text("f", style: TextStyle(color: Colors.blue[700]))),
                    const SizedBox(width: 20),
                    CircleAvatar(backgroundColor: Colors.white, child: Text("G", style: TextStyle(color: Colors.red[700]))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
