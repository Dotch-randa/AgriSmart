import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatbotPage extends StatefulWidget {
  final String? diseaseContext; // optional — pass disease name from prediction screen

  const ChatbotPage({super.key, this.diseaseContext});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // ── Change this to your machine's local IP ────────────────────────────
  static const String _baseUrl = 'http://192.168.137.197:8001';
  // ──────────────────────────────────────────────────────────────────────

  final List<Map<String, String>> _messages = [];
  bool _isLoading = false;

  // Earth & Growth Theme Palette
  final Color primaryGreen = const Color(0xFF2E7D32);
  final Color background = const Color(0xFFFBF9F8);
  final Color surfaceBeige = const Color(0xFFF5F5DC);
  final Color lightGray = const Color(0xFFE4E2E1);
  final Color surfaceWhite = const Color(0xFFFFFFFF);

  @override
  void initState() {
    super.initState();

    // Welcome message
    _messages.add({
      'text': 'مرحباً! كيف يمكنني مساعدتك في مزرعتك اليوم؟',
      'sender': 'bot',
    });

    // If disease context passed from prediction screen, auto-send
    if (widget.diseaseContext != null &&
        widget.diseaseContext!.isNotEmpty &&
        widget.diseaseContext != 'Unrecognized / Low Confidence') {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _sendMessage(
          overrideMessage: 'ما هو العلاج المناسب لمرض ${widget.diseaseContext}؟',
          diseaseContext: widget.diseaseContext,
        );
      });
    }
  }

  Future<void> _sendMessage({
    String? overrideMessage,
    String? diseaseContext,
  }) async {
    final text = overrideMessage ?? _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add({'text': text, 'sender': 'user'});
      _isLoading = true;
      _controller.clear();
    });

    _scrollToBottom();

    try {
      final body = <String, dynamic>{'message': text};
      if (diseaseContext != null) {
        body['disease_context'] = diseaseContext;
      }

      final response = await http.post(
        Uri.parse('$_baseUrl/chat'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        setState(() {
          _messages.add({
            'text': data['response'] ?? 'لم أتمكن من الحصول على إجابة.',
            'sender': 'bot',
          });
        });
      } else {
        _addErrorMessage();
      }
    } catch (e) {
      _addErrorMessage();
    } finally {
      setState(() => _isLoading = false);
      _scrollToBottom();
    }
  }

  void _addErrorMessage() {
    setState(() {
      _messages.add({
        'text': 'تعذر الاتصال بالخادم. تحقق من اتصالك وحاول مجدداً.',
        'sender': 'bot',
      });
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _goBackToHome() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: surfaceBeige,
          elevation: 0,
          leadingWidth: 56,
          leading: IconButton(
            icon: Icon(Icons.menu, color: primaryGreen),
            onPressed: () {},
          ),
          title: Text(
            'NABTA',
            style: TextStyle(
              color: primaryGreen,
              fontWeight: FontWeight.w900,
              fontSize: 22,
              letterSpacing: -0.5,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: _goBackToHome,
              icon: const Icon(
                Icons.arrow_left,
                color: Colors.green,
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(color: lightGray, height: 1),
          ),
        ),
        body: Column(
          children: [
            // Disease context banner — shown when coming from prediction
            if (widget.diseaseContext != null &&
                widget.diseaseContext != 'Unrecognized / Low Confidence')
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: const Color(0xFFE8F5E9),
                child: Text(
                  'السياق: ${widget.diseaseContext}',
                  style: TextStyle(
                    color: primaryGreen,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

            // Messages list
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final msg = _messages[index];
                  final isUser = msg['sender'] == 'user';
                  return Align(
                    alignment:
                        isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.78,
                      ),
                      decoration: BoxDecoration(
                        color: isUser
                            ? const Color(0xFFC8E6C9)
                            : surfaceWhite,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(20),
                          topRight: const Radius.circular(20),
                          bottomLeft: isUser
                              ? const Radius.circular(20)
                              : const Radius.circular(4),
                          bottomRight: isUser
                              ? const Radius.circular(4)
                              : const Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        msg['text']!,
                        style: TextStyle(
                          color: isUser
                              ? const Color(0xFF1B5E20)
                              : Colors.black87,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Loading indicator
            if (_isLoading)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: surfaceWhite,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: primaryGreen,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'جاري التفكير...',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            // Input bar
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: surfaceWhite,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        hintText: 'اكتب سؤالك هنا...',
                        hintStyle: const TextStyle(
                            color: Colors.grey, fontSize: 14),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: primaryGreen,
                    radius: 24,
                    child: IconButton(
                      icon: const Icon(Icons.send,
                          color: Colors.white, size: 20),
                      onPressed: _isLoading ? null : () => _sendMessage(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}