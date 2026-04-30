import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────────────────────
// DATA MODEL
// ─────────────────────────────────────────────────────────────────────────────

class CropFact {
  final String name;
  final String nameAr;
  final String emoji;
  final String plantingCalendar;
  final String waterNeeds;
  final List<String> commonDiseases;
  final String averageYield;
  final String description;
  final Color color;

  const CropFact({
    required this.name,
    required this.nameAr,
    required this.emoji,
    required this.plantingCalendar,
    required this.waterNeeds,
    required this.commonDiseases,
    required this.averageYield,
    required this.description,
    required this.color,
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// DATABASE — Algeria's 10 key crops
// ─────────────────────────────────────────────────────────────────────────────

const List<CropFact> cropDatabase = [
  CropFact(
    name: 'Blé',
    nameAr: 'القمح',
    emoji: '🌾',
    plantingCalendar: 'Semis: Oct–Nov | Récolte: Juin–Juil',
    waterNeeds: '400–600 mm/an — Irrigation modérée',
    commonDiseases: ['Rouille jaune', 'Septoriose', 'Fusariose des épis', 'Oïdium'],
    averageYield: '15–25 q/ha (pluvial) | 40–60 q/ha (irrigué)',
    description: 'Culture céréalière principale en Algérie. Adapté aux zones semi-arides du Tell. La variété dure est dominante.',
    color: Color(0xFFF9A825),
  ),
  CropFact(
    name: 'Tomate',
    nameAr: 'الطماطم',
    emoji: '🍅',
    plantingCalendar: 'Semis: Fév–Mar | Plantation: Avr–Mai | Récolte: Juil–Sep',
    waterNeeds: '600–800 mm/cycle — Irrigation régulière',
    commonDiseases: ['Mildiou', 'Alternariose', 'Fusariose', 'Virus TYLCV', 'Botrytis'],
    averageYield: '40–80 t/ha (sous serre) | 25–40 t/ha (plein champ)',
    description: 'Culture maraîchère stratégique. Produite dans les régions du Mitidja, Annaba et Mostaganem.',
    color: Color(0xFFE53935),
  ),
  CropFact(
    name: 'Olive',
    nameAr: 'الزيتون',
    emoji: '🫒',
    plantingCalendar: 'Plantation: Oct–Nov ou Mar–Avr | Récolte: Nov–Jan',
    waterNeeds: '300–600 mm/an — Résistant à la sécheresse',
    commonDiseases: ['Œil de paon', 'Verticilliose', 'Mouche de l\'olive', 'Fumagine'],
    averageYield: '2–4 t/ha (huile) | 8–15 t/ha (olives de table)',
    description: 'Culture emblématique de la Kabylie. L\'Algérie compte plus de 40 millions d\'oliviers.',
    color: Color(0xFF558B2F),
  ),
  CropFact(
    name: 'Palmier Dattier',
    nameAr: 'النخيل',
    emoji: '🌴',
    plantingCalendar: 'Plantation: Mar–Avr | Récolte: Sep–Nov',
    waterNeeds: '1500–2000 mm/an — Irrigation intensive',
    commonDiseases: ['Bayoud', 'Pourriture des inflorescences', 'Cochenille blanche'],
    averageYield: '50–100 kg/régime | 5–10 t/ha',
    description: 'Symbole du Sahara algérien. La variété Deglet Nour est mondialement reconnue. Biskra et Ouargla sont les wilayas leaders.',
    color: Color(0xFFFF8F00),
  ),
  CropFact(
    name: 'Pomme de Terre',
    nameAr: 'البطاطا',
    emoji: '🥔',
    plantingCalendar: 'Plantation: Fév–Mar (printemps) | Sep–Oct (automne) | Récolte: 90–120 jours après',
    waterNeeds: '500–700 mm/cycle — Irrigation fréquente',
    commonDiseases: ['Mildiou', 'Alternariose', 'Gale commune', 'Rhizoctone', 'Virus PVY'],
    averageYield: '20–35 t/ha',
    description: 'Deuxième culture vivrière après le blé. Deux cycles par an possibles. Forte demande locale et export vers l\'Europe.',
    color: Color(0xFF795548),
  ),
  CropFact(
    name: 'Oignon',
    nameAr: 'البصل',
    emoji: '🧅',
    plantingCalendar: 'Semis: Sep–Oct | Repiquage: Nov–Déc | Récolte: Avr–Juin',
    waterNeeds: '350–500 mm/cycle — Irrigation modérée',
    commonDiseases: ['Mildiou de l\'oignon', 'Botrytis', 'Fusariose', 'Thrips'],
    averageYield: '15–30 t/ha',
    description: 'Culture maraîchère de base très consommée. Produite principalement dans les régions de Mostaganem, Mascara et Relizane.',
    color: Color(0xFFAB47BC),
  ),
  CropFact(
    name: 'Poivron',
    nameAr: 'الفلفل',
    emoji: '🫑',
    plantingCalendar: 'Semis: Jan–Fév | Plantation: Mar–Avr | Récolte: Juin–Oct',
    waterNeeds: '500–700 mm/cycle — Irrigation régulière',
    commonDiseases: ['Anthracnose', 'Botrytis', 'Phytophthora', 'Virus CMV', 'Verticilliose'],
    averageYield: '20–40 t/ha (plein champ) | 60–100 t/ha (sous serre)',
    description: 'Culture maraîchère en forte expansion. La production sous serre dans les régions côtières permet une récolte prolongée.',
    color: Color(0xFF43A047),
  ),
  CropFact(
    name: 'Pastèque',
    nameAr: 'البطيخ',
    emoji: '🍉',
    plantingCalendar: 'Semis: Mar–Avr | Récolte: Juin–Août',
    waterNeeds: '400–600 mm/cycle — Goutte-à-goutte recommandé',
    commonDiseases: ['Fusariose vasculaire', 'Oïdium', 'Anthracnose', 'Virus WMV'],
    averageYield: '25–50 t/ha',
    description: 'Culture d\'été très populaire. Les régions de Biskra, El Oued et Adrar sont les principales zones de production.',
    color: Color(0xFFE91E63),
  ),
  CropFact(
    name: 'Agrumes',
    nameAr: 'الحمضيات',
    emoji: '🍊',
    plantingCalendar: 'Plantation: Mar–Avr | Récolte: Oct–Mar (selon variété)',
    waterNeeds: '800–1200 mm/an — Irrigation régulière',
    commonDiseases: ['Tristeza', 'Gomme des citrus', 'Cochenille', 'Alternariose', 'Psylle des agrumes'],
    averageYield: '15–30 t/ha',
    description: 'Principalement cultivés dans les régions côtières: Blida, Tizi Ouzou, Jijel. La clémentine algérienne est exportée vers l\'Europe.',
    color: Color(0xFFFF7043),
  ),
  CropFact(
    name: 'Orge',
    nameAr: 'الشعير',
    emoji: '🌿',
    plantingCalendar: 'Semis: Oct–Nov | Récolte: Mai–Juin',
    waterNeeds: '250–450 mm/an — Très résistant à la sécheresse',
    commonDiseases: ['Rouille naine', 'Helminthosporiose', 'Rhynchosporiose', 'Oïdium'],
    averageYield: '10–20 q/ha (pluvial) | 30–50 q/ha (irrigué)',
    description: 'Céréale secondaire très résistante à la sécheresse. Utilisée principalement pour l\'alimentation animale. Cultivée dans les zones steppiques.',
    color: Color(0xFF8D6E63),
  ),
];

// ─────────────────────────────────────────────────────────────────────────────
// FICHES LIST PAGE
// ─────────────────────────────────────────────────────────────────────────────

class FichesPage extends StatefulWidget {
  const FichesPage({super.key});

  @override
  State<FichesPage> createState() => _FichesPageState();
}

class _FichesPageState extends State<FichesPage> {
  final TextEditingController _searchController = TextEditingController();
  List<CropFact> _filtered = cropDatabase;

  static const Color primaryGreen = Color(0xFF2E7D32);
  static const Color surfaceBeige = Color(0xFFF5F5DC);
  static const Color lightGray = Color(0xFFE4E2E1);

  void _onSearch(String query) {
    setState(() {
      _filtered = cropDatabase.where((c) {
        final q = query.toLowerCase();
        return c.name.toLowerCase().contains(q) ||
            c.nameAr.contains(q) ||
            c.commonDiseases.any((d) => d.toLowerCase().contains(q));
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: surfaceBeige,
        appBar: AppBar(
          backgroundColor: surfaceBeige,
          elevation: 0,
          title: const Text(
            'Fiches Cultures',
            style: TextStyle(
              color: primaryGreen,
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: primaryGreen),
            onPressed: () => Navigator.pop(context),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(color: lightGray, height: 1),
          ),
        ),
        body: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _searchController,
                onChanged: _onSearch,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  hintText: 'Rechercher une culture ou maladie...',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  prefixIcon: const Icon(Icons.search, color: primaryGreen),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, color: Colors.grey),
                          onPressed: () {
                            _searchController.clear();
                            _onSearch('');
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // Count
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '${_filtered.length} culture(s)',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // List
            Expanded(
              child: _filtered.isEmpty
                  ? const Center(
                      child: Text(
                        'Aucune culture trouvée',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _filtered.length,
                      itemBuilder: (context, index) {
                        final crop = _filtered[index];
                        return _buildCropCard(context, crop);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCropCard(BuildContext context, CropFact crop) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CropDetailPage(crop: crop),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Emoji icon
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: crop.color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(crop.emoji, style: const TextStyle(fontSize: 28)),
              ),
            ),
            const SizedBox(width: 16),

            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        crop.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        crop.nameAr,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    crop.plantingCalendar,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  // Disease tags — show first 2
                  Wrap(
                    spacing: 4,
                    children: crop.commonDiseases.take(2).map((d) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: crop.color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          d,
                          style: TextStyle(
                            color: crop.color,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            const Icon(Icons.chevron_left, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// CROP DETAIL PAGE
// ─────────────────────────────────────────────────────────────────────────────

class CropDetailPage extends StatelessWidget {
  final CropFact crop;
  const CropDetailPage({super.key, required this.crop});

  static const Color primaryGreen = Color(0xFF2E7D32);
  static const Color surfaceBeige = Color(0xFFF5F5DC);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: surfaceBeige,
        body: CustomScrollView(
          slivers: [
            // Hero header
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              backgroundColor: crop.color,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: crop.color,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      Text(crop.emoji,
                          style: const TextStyle(fontSize: 64)),
                      const SizedBox(height: 8),
                      Text(
                        crop.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        crop.nameAr,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Content
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Description
                    _buildSection(
                      icon: Icons.info_outline,
                      title: 'Description',
                      child: Text(
                        crop.description,
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black87, height: 1.5),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Planting calendar
                    _buildSection(
                      icon: Icons.calendar_month,
                      title: 'Calendrier Cultural',
                      child: Text(
                        crop.plantingCalendar,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            height: 1.5),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Water needs
                    _buildSection(
                      icon: Icons.water_drop,
                      title: 'Besoins en Eau',
                      child: Row(
                        children: [
                          Icon(Icons.water_drop,
                              color: Colors.blue[300], size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              crop.waterNeeds,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Average yield
                    _buildSection(
                      icon: Icons.bar_chart,
                      title: 'Rendement Moyen',
                      child: Row(
                        children: [
                          Icon(Icons.trending_up,
                              color: primaryGreen, size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              crop.averageYield,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Common diseases
                    _buildSection(
                      icon: Icons.bug_report,
                      title: 'Maladies Fréquentes',
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: crop.commonDiseases.map((disease) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.red.withOpacity(0.2)),
                            ),
                            child: Text(
                              disease,
                              style: const TextStyle(
                                color: Color(0xFFB71C1C),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: primaryGreen, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}
