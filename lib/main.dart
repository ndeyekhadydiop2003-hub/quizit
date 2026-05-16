import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(const QuizITApp());

class QuizITApp extends StatelessWidget {
  const QuizITApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuizIT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6366F1)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}




// import 'dart:async';
// import 'package:flutter/material.dart';

// void main() => runApp(const QuizITApp());

// class QuizITApp extends StatelessWidget {
//   const QuizITApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'QuizIT',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6366F1)),
//         useMaterial3: true,
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }

// // ==================== MODÈLES ====================

// class QuizQuestion {
//   final String question;
//   final List<String> options;
//   final int correct;
//   final String explanation;
//   const QuizQuestion({required this.question, required this.options, required this.correct, required this.explanation});
// }

// class QuizCategory {
//   final String id;
//   final String title;
//   final String description;
//   final List<Color> gradient; // Tailwind exact colors
//   final IconData icon;
//   final List<QuizQuestion> questions;
//   const QuizCategory({required this.id, required this.title, required this.description, required this.gradient, required this.icon, required this.questions});
//   int get duration => 4;
// }

// // ==================== DONNÉES EXACTES DU SITE ====================

// final List<QuizCategory> quizCategories = [

//   // --- Base de données (from-blue-500 to-cyan-500) ---
//   QuizCategory(
//     id: 'base-de-donnees',
//     title: 'Base de données',
//     description: 'SQL, modélisation, normalisation et SGBD',
//     gradient: const [Color(0xFF3B82F6), Color(0xFF06B6D4)],
//     icon: Icons.storage,
//     questions: const [
//       QuizQuestion(question: "Quelle commande SQL permet d'extraire des données d'une table ?", options: ['GET', 'SELECT', 'FETCH', 'EXTRACT'], correct: 1, explanation: "SELECT est la commande SQL standard pour interroger et récupérer des données."),
//       QuizQuestion(question: "Que signifie SGBD ?", options: ['Système de Gestion de Base de Données', 'Service Général de Bases Distribuées', 'Système Global de Backup Données', 'Stockage Généralisé de Bases Dynamiques'], correct: 0, explanation: "SGBD = Système de Gestion de Base de Données (DBMS en anglais)."),
//       QuizQuestion(question: "Quelle clause SQL filtre les lignes d'un résultat ?", options: ['FILTER', 'HAVING', 'WHERE', 'IF'], correct: 2, explanation: "WHERE filtre les lignes ; HAVING filtre les groupes après GROUP BY."),
//       QuizQuestion(question: "Une clé primaire doit être :", options: ['Nullable', 'Unique et non nulle', 'Toujours numérique', 'Composée'], correct: 1, explanation: "La clé primaire identifie chaque ligne : elle est unique et NOT NULL."),
//       QuizQuestion(question: "Quelle jointure retourne uniquement les lignes correspondantes des deux tables ?", options: ['LEFT JOIN', 'RIGHT JOIN', 'INNER JOIN', 'FULL JOIN'], correct: 2, explanation: "INNER JOIN ne retourne que les lignes ayant une correspondance dans les deux tables."),
//       QuizQuestion(question: "Quelle forme normale élimine les dépendances transitives ?", options: ['1NF', '2NF', '3NF', 'BCNF'], correct: 2, explanation: "La 3NF élimine les dépendances transitives entre attributs non-clés."),
//       QuizQuestion(question: "Quelle commande supprime une table entière ?", options: ['DELETE TABLE', 'DROP TABLE', 'REMOVE TABLE', 'ERASE TABLE'], correct: 1, explanation: "DROP TABLE supprime la structure et les données. DELETE supprime uniquement les lignes."),
//       QuizQuestion(question: "ACID signifie :", options: ['Atomicity, Consistency, Isolation, Durability', 'Access, Control, Index, Data', 'Atomic, Cached, Indexed, Distributed', 'Auth, Crypto, Integrity, Data'], correct: 0, explanation: "ACID = Atomicité, Cohérence, Isolation, Durabilité — propriétés des transactions."),
//     ],
//   ),

//   // --- Programmation (from-purple-500 to-pink-500) ---
//   QuizCategory(
//     id: 'programmation',
//     title: 'Programmation',
//     description: 'Algorithmique, paradigmes et langages',
//     gradient: const [Color(0xFFA855F7), Color(0xFFEC4899)],
//     icon: Icons.code,
//     questions: const [
//       QuizQuestion(question: "Quelle structure de données fonctionne en LIFO ?", options: ['File (Queue)', 'Pile (Stack)', 'Liste chaînée', 'Arbre'], correct: 1, explanation: "Une pile (Stack) fonctionne en Last In First Out."),
//       QuizQuestion(question: "Quelle est la complexité d'une recherche dichotomique ?", options: ['O(n)', 'O(n²)', 'O(log n)', 'O(1)'], correct: 2, explanation: "La recherche dichotomique divise l'espace de recherche par 2 : O(log n)."),
//       QuizQuestion(question: "Quel paradigme utilise des objets et des classes ?", options: ['Fonctionnel', 'Procédural', 'Orienté objet', 'Logique'], correct: 2, explanation: "La POO repose sur les concepts de classes, objets, héritage, encapsulation."),
//       QuizQuestion(question: "Que fait une fonction récursive ?", options: ["Appelle une autre fonction", "S'appelle elle-même", 'Boucle infinie', 'Retourne null'], correct: 1, explanation: "Une fonction récursive s'appelle elle-même avec un cas de base."),
//       QuizQuestion(question: "Quel langage est typé statiquement ?", options: ['Python', 'JavaScript', 'TypeScript', 'Ruby'], correct: 2, explanation: "TypeScript ajoute un typage statique à JavaScript."),
//       QuizQuestion(question: "Que signifie API ?", options: ['Application Programming Interface', 'Advanced Process Integration', 'Automated Program Instance', 'Application Process Indicator'], correct: 0, explanation: "API = Application Programming Interface."),
//       QuizQuestion(question: "Quel algorithme de tri a une complexité moyenne O(n log n) ?", options: ['Tri à bulles', 'Tri par insertion', 'Tri rapide (Quicksort)', 'Tri par sélection'], correct: 2, explanation: "Quicksort a une complexité moyenne en O(n log n)."),
//       QuizQuestion(question: "Le polymorphisme permet :", options: ["D'avoir plusieurs formes pour une même méthode", 'De cacher les données', "D'hériter d'une classe", 'De créer une instance'], correct: 0, explanation: "Le polymorphisme = une même interface, plusieurs implémentations."),
//     ],
//   ),

//   // --- Développement mobile (from-green-500 to-emerald-500) ---
//   QuizCategory(
//     id: 'developpement-mobile',
//     title: 'Développement mobile',
//     description: 'iOS, Android, frameworks cross-platform',
//     gradient: const [Color(0xFF22C55E), Color(0xFF10B981)],
//     icon: Icons.smartphone,
//     questions: const [
//       QuizQuestion(question: "Quel langage est natif pour Android ?", options: ['Swift', 'Kotlin', 'Dart', 'Objective-C'], correct: 1, explanation: "Kotlin (et Java) sont les langages officiels pour Android."),
//       QuizQuestion(question: "Quel langage est natif pour iOS ?", options: ['Kotlin', 'Java', 'Swift', 'C#'], correct: 2, explanation: "Swift est le langage moderne d'Apple pour iOS."),
//       QuizQuestion(question: "Quel framework utilise Dart ?", options: ['React Native', 'Flutter', 'Ionic', 'Xamarin'], correct: 1, explanation: "Flutter, créé par Google, utilise le langage Dart."),
//       QuizQuestion(question: "Que signifie APK ?", options: ['Android Package Kit', 'Apple Programming Kit', 'App Production Key', 'Android Process Kernel'], correct: 0, explanation: "APK = Android Package Kit, format d'installation Android."),
//       QuizQuestion(question: "React Native compile vers :", options: ['Du HTML', 'Des composants natifs', 'Du WebView', 'Du bytecode Java uniquement'], correct: 1, explanation: "React Native rend des composants natifs réels via un pont JS↔Native."),
//       QuizQuestion(question: "Quel store distribue les apps iOS ?", options: ['Google Play', 'App Store', 'Microsoft Store', 'Galaxy Store'], correct: 1, explanation: "L'App Store d'Apple est le store officiel iOS."),
//       QuizQuestion(question: "Une activité (Activity) en Android est :", options: ['Une classe utilitaire', "Un écran de l'application", 'Un service en arrière-plan', 'Une base de données'], correct: 1, explanation: "Une Activity représente un écran avec lequel l'utilisateur interagit."),
//       QuizQuestion(question: "Quel format est utilisé pour les layouts Android ?", options: ['JSON', 'YAML', 'XML', 'HTML'], correct: 2, explanation: "Les layouts Android sont définis en XML (ou en Jetpack Compose)."),
//     ],
//   ),

//   // --- Développement web (from-orange-500 to-red-500) ---
//   QuizCategory(
//     id: 'developpement-web',
//     title: 'Développement web',
//     description: 'HTML, CSS, JavaScript et frameworks',
//     gradient: const [Color(0xFFF97316), Color(0xFFEF4444)],
//     icon: Icons.language,
//     questions: const [
//       QuizQuestion(question: "HTML signifie :", options: ['HyperText Markup Language', 'High Tech Modern Language', 'Home Tool Markup Language', 'Hyperlink and Text Markup Language'], correct: 0, explanation: "HTML = HyperText Markup Language."),
//       QuizQuestion(question: "Quelle balise crée un lien hypertexte ?", options: ['<link>', '<a>', '<href>', '<url>'], correct: 1, explanation: "La balise <a> avec l'attribut href crée un lien."),
//       QuizQuestion(question: "Quel sélecteur CSS cible un id ?", options: ['.id', '#id', '*id', '@id'], correct: 1, explanation: "Le caractère # cible un id ; le . cible une classe."),
//       QuizQuestion(question: "Quelle méthode HTTP est idempotente et sert à récupérer ?", options: ['POST', 'GET', 'PATCH', 'DELETE'], correct: 1, explanation: "GET est idempotente et utilisée pour lire des ressources."),
//       QuizQuestion(question: "Quel framework JS est maintenu par Meta ?", options: ['Vue', 'Angular', 'React', 'Svelte'], correct: 2, explanation: "React est développé et maintenu par Meta (Facebook)."),
//       QuizQuestion(question: "Que signifie CSS ?", options: ['Computer Style Sheets', 'Cascading Style Sheets', 'Creative Style System', 'Coded Styling Source'], correct: 1, explanation: "CSS = Cascading Style Sheets."),
//       QuizQuestion(question: "Quel code HTTP signifie 'Non trouvé' ?", options: ['200', '301', '404', '500'], correct: 2, explanation: "404 = Not Found ; 200 = OK ; 500 = Erreur serveur."),
//       QuizQuestion(question: "Quelle propriété CSS active Flexbox ?", options: ['display: flex', 'layout: flex', 'position: flex', 'flex: on'], correct: 0, explanation: "display: flex active le modèle Flexbox sur un conteneur."),
//     ],
//   ),

//   // --- Culture générale (from-yellow-500 to-amber-500) ---
//   QuizCategory(
//     id: 'culture-generale',
//     title: 'Culture générale informatique',
//     description: 'Histoire, concepts et grandes figures',
//     gradient: const [Color(0xFFEAB308), Color(0xFFF59E0B)],
//     icon: Icons.lightbulb,
//     questions: const [
//       QuizQuestion(question: "Qui est considéré comme le père de l'informatique ?", options: ['Bill Gates', 'Alan Turing', 'Steve Jobs', 'Linus Torvalds'], correct: 1, explanation: "Alan Turing a posé les fondements théoriques de l'informatique moderne."),
//       QuizQuestion(question: "Que signifie CPU ?", options: ['Central Processing Unit', 'Computer Personal Unit', 'Central Power Unit', 'Control Process Utility'], correct: 0, explanation: "CPU = Central Processing Unit, le processeur."),
//       QuizQuestion(question: "Combien de bits dans un octet ?", options: ['4', '8', '16', '32'], correct: 1, explanation: "1 octet = 8 bits."),
//       QuizQuestion(question: "Qui a créé le noyau Linux ?", options: ['Richard Stallman', 'Linus Torvalds', 'Ken Thompson', 'Dennis Ritchie'], correct: 1, explanation: "Linus Torvalds a créé le noyau Linux en 1991."),
//       QuizQuestion(question: "Que signifie RAM ?", options: ['Read Access Memory', 'Random Access Memory', 'Rapid Access Module', 'Run Active Memory'], correct: 1, explanation: "RAM = Random Access Memory, mémoire vive."),
//       QuizQuestion(question: "Le système binaire utilise :", options: ['0 et 1', '0 à 9', '0 à F', '1 à 10'], correct: 0, explanation: "Le binaire n'utilise que deux chiffres : 0 et 1."),
//       QuizQuestion(question: "Quelle entreprise a créé Windows ?", options: ['Apple', 'IBM', 'Microsoft', 'Google'], correct: 2, explanation: "Windows est développé par Microsoft depuis 1985."),
//       QuizQuestion(question: "Le World Wide Web a été inventé par :", options: ['Vint Cerf', 'Tim Berners-Lee', 'Bill Gates', 'Larry Page'], correct: 1, explanation: "Tim Berners-Lee a inventé le Web au CERN en 1989."),
//     ],
//   ),

//   // --- Réseaux et sécurité (from-indigo-500 to-violet-500) ---
//   QuizCategory(
//     id: 'reseaux-securite',
//     title: 'Réseaux et sécurité',
//     description: 'Protocoles, modèle OSI et cybersécurité',
//     gradient: const [Color(0xFF6366F1), Color(0xFF8B5CF6)],
//     icon: Icons.shield,
//     questions: const [
//       QuizQuestion(question: "Combien de couches comporte le modèle OSI ?", options: ['4', '5', '7', '9'], correct: 2, explanation: "Le modèle OSI comporte 7 couches, de la couche physique à la couche application."),
//       QuizQuestion(question: "Quel protocole sécurise HTTP ?", options: ['FTP', 'TLS/SSL', 'SMTP', 'ARP'], correct: 1, explanation: "HTTPS utilise TLS (anciennement SSL) pour chiffrer les échanges."),
//       QuizQuestion(question: "Une adresse IPv4 est composée de :", options: ['32 bits', '64 bits', '128 bits', '256 bits'], correct: 0, explanation: "IPv4 utilise 32 bits, soit 4 octets séparés par des points."),
//       QuizQuestion(question: "Que fait un pare-feu (firewall) ?", options: ['Stocke les mots de passe', 'Filtre le trafic réseau selon des règles', 'Accélère la connexion', 'Génère des certificats'], correct: 1, explanation: "Un firewall contrôle le trafic entrant/sortant selon des règles de sécurité."),
//       QuizQuestion(question: "Le phishing est :", options: ['Un virus informatique', "Une technique d'hameçonnage par usurpation", 'Un protocole réseau', 'Un type de pare-feu'], correct: 1, explanation: "Le phishing usurpe une identité de confiance pour voler des informations."),
//       QuizQuestion(question: "Quel protocole résout les noms de domaine en IP ?", options: ['HTTP', 'DNS', 'DHCP', 'FTP'], correct: 1, explanation: "DNS (Domain Name System) traduit les noms en adresses IP."),
//       QuizQuestion(question: "Le chiffrement symétrique utilise :", options: ['Une paire de clés publique/privée', 'Une seule clé partagée', 'Aucune clé', 'Un certificat uniquement'], correct: 1, explanation: "Le chiffrement symétrique (AES, DES) utilise la même clé pour chiffrer et déchiffrer."),
//       QuizQuestion(question: "Une attaque DDoS vise à :", options: ['Voler des données', 'Saturer un service pour le rendre indisponible', 'Cracker un mot de passe', 'Installer un malware'], correct: 1, explanation: "DDoS = Distributed Denial of Service : saturer un serveur depuis de multiples sources."),
//     ],
//   ),
// ];

// // ==================== ÉCRAN D'ACCUEIL ====================

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFEEF2FF),
//       body: SafeArea(
//         child: Center(
//           child: ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: 1100),
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 24),
//                   const Text('QuizIT',
//                       style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold, color: Color(0xFF6366F1), letterSpacing: -1.5)),
//                   const SizedBox(height: 12),
//                   const Text(
//                     "Simulateur d'examen informatique — choisissez une matière et testez vos connaissances.",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 16, color: Color(0xFF64748B), height: 1.5),
//                   ),
//                   const SizedBox(height: 40),
//                   LayoutBuilder(builder: (context, constraints) {
//                     final cols = constraints.maxWidth > 600 ? 3 : 2;
//                     return GridView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: cols,
//                         crossAxisSpacing: 20,
//                         mainAxisSpacing: 20,
//                         mainAxisExtent: 200,
//                       ),
//                       itemCount: quizCategories.length,
//                       itemBuilder: (_, i) => _CategoryCard(category: quizCategories[i]),
//                     );
//                   }),
//                   const SizedBox(height: 32),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _CategoryCard extends StatelessWidget {
//   final QuizCategory category;
//   const _CategoryCard({required this.category});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => QuizScreen(category: category))),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 16, offset: const Offset(0, 4))],
//         ),
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: 56,
//               height: 56,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: category.gradient, begin: Alignment.topLeft, end: Alignment.bottomRight),
//                 borderRadius: BorderRadius.circular(14),
//               ),
//               child: Icon(category.icon, color: Colors.white, size: 28),
//             ),
//             const SizedBox(height: 14),
//             Text(category.title,
//                 style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
//                 maxLines: 2, overflow: TextOverflow.ellipsis),
//             const SizedBox(height: 5),
//             Text(category.description,
//                 style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
//                 maxLines: 2, overflow: TextOverflow.ellipsis),
//             const Spacer(),
//             Row(
//               children: [
//                 const Icon(Icons.quiz_outlined, size: 13, color: Color(0xFFB0C4D8)),
//                 const SizedBox(width: 4),
//                 Text('${category.questions.length} questions', style: const TextStyle(fontSize: 12, color: Color(0xFFB0C4D8))),
//                 const SizedBox(width: 10),
//                 const Icon(Icons.access_time, size: 13, color: Color(0xFFB0C4D8)),
//                 const SizedBox(width: 4),
//                 Text('${category.duration} min', style: const TextStyle(fontSize: 12, color: Color(0xFFB0C4D8))),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ==================== ÉCRAN QUIZ ====================

// class QuizScreen extends StatefulWidget {
//   final QuizCategory category;
//   const QuizScreen({super.key, required this.category});
//   @override
//   State<QuizScreen> createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
//   int _currentIndex = 0;
//   late List<int?> _answers; // null=non répondu | -1=temps écoulé | 0-3=réponse
//   Timer? _questionTimer;    // compte à rebours
//   Timer? _advanceTimer;     // auto-avancement (équivalent useRef du setTimeout)
//   int _timeLeft = 15;
//   static const int _totalTime = 15;
//   bool _locked = false;

//   @override
//   void initState() {
//     super.initState();
//     _answers = List.filled(widget.category.questions.length, null);
//     _startTimer();
//   }

//   @override
//   void dispose() {
//     _questionTimer?.cancel();
//     _advanceTimer?.cancel();
//     super.dispose();
//   }

//   // ─── Timer ────────────────────────────────────────────────

//   void _startTimer() {
//     _questionTimer?.cancel();
//     _advanceTimer?.cancel();
//     final alreadyAnswered = _answers[_currentIndex] != null;
//     setState(() {
//       _locked = alreadyAnswered;
//       _timeLeft = alreadyAnswered ? 0 : _totalTime;
//     });
//     if (alreadyAnswered) return; // question déjà répondue → pas de timer

//     _questionTimer = Timer.periodic(const Duration(seconds: 1), (t) {
//       if (!mounted) { t.cancel(); return; }
//       setState(() => _timeLeft--);
//       if (_timeLeft <= 0) {
//         t.cancel();
//         _onTimeUp();
//       }
//     });
//   }

//   void _onTimeUp() {
//     if (!mounted || _locked) return;
//     setState(() {
//       _answers[_currentIndex] = -1; // -1 = temps écoulé
//       _locked = true;
//     });
//     _scheduleAdvance();
//   }

//   void _scheduleAdvance() {
//     _advanceTimer?.cancel();
//     if (_currentIndex < widget.category.questions.length - 1) {
//       _advanceTimer = Timer(const Duration(milliseconds: 1200), () {
//         if (mounted) _goTo(_currentIndex + 1);
//       });
//     }
//   }

//   // ─── Navigation ───────────────────────────────────────────

//   void _goTo(int index) {
//     _questionTimer?.cancel();
//     _advanceTimer?.cancel();
//     setState(() => _currentIndex = index);
//     _startTimer();
//   }

//   void _select(int index) {
//     if (_locked) return;
//     _questionTimer?.cancel();
//     setState(() {
//       _answers[_currentIndex] = index;
//       _locked = true;
//     });
//     _scheduleAdvance();
//   }

//   // Précédent : fonctionne même si la question a été répondue
//   void _goPrev() {
//     if (_currentIndex > 0) _goTo(_currentIndex - 1);
//   }

//   // Suivant : annule l'auto-avancement et passe manuellement
//   void _goNext() {
//     _advanceTimer?.cancel();
//     if (_currentIndex < widget.category.questions.length - 1) {
//       _goTo(_currentIndex + 1);
//     }
//   }

//   void _finish() {
//     _questionTimer?.cancel();
//     _advanceTimer?.cancel();
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (_) => ResultScreen(
//           category: widget.category,
//           userAnswers: List.from(_answers),
//         ),
//       ),
//     );
//   }

//   // ─── Couleur du timer : vert >10s, orange >5s, rouge ≤5s ──

//   Color get _timerColor {
//     if (_timeLeft > 10) return const Color(0xFF22C55E);
//     if (_timeLeft > 5)  return const Color(0xFFF97316);
//     return const Color(0xFFEF4444);
//   }

//   // ─── Couleurs des options ─────────────────────────────────

//   int  get _correct => widget.category.questions[_currentIndex].correct;
//   int? get _sel     => _answers[_currentIndex];

//   Color _optBg(int i) {
//     if (!_locked) return Colors.white;
//     if (i == _correct) return const Color(0xFFF0FDF4);
//     if (_sel == i)     return const Color(0xFFFFF1F2);
//     return const Color(0xFFF8FAFC);
//   }

//   Color _optBorder(int i) {
//     if (!_locked) return const Color(0xFFE2E8F0);
//     if (i == _correct) return const Color(0xFF86EFAC);
//     if (_sel == i)     return const Color(0xFFFCA5A5);
//     return const Color(0xFFE2E8F0);
//   }

//   Color _optText(int i) {
//     if (!_locked) return const Color(0xFF1E293B);
//     if (i == _correct) return const Color(0xFF15803D);
//     if (_sel == i)     return const Color(0xFFDC2626);
//     return const Color(0xFF94A3B8);
//   }

//   Color _badgeBg(int i) {
//     if (!_locked) return const Color(0xFFEEF2FF);
//     if (i == _correct) return const Color(0xFF22C55E);
//     if (_sel == i)     return const Color(0xFFEF4444);
//     return const Color(0xFFE2E8F0);
//   }

//   Color _badgeText(int i) {
//     if (!_locked) return const Color(0xFF6366F1);
//     if (i == _correct || _sel == i) return Colors.white;
//     return const Color(0xFF94A3B8);
//   }

//   Widget? _trailingIcon(int i) {
//     if (!_locked) return null;
//     if (i == _correct) return const Icon(Icons.check_circle, color: Color(0xFF22C55E), size: 20);
//     if (_sel == i && i != _correct) return const Icon(Icons.cancel, color: Color(0xFFEF4444), size: 20);
//     return null;
//   }

//   // ─── Build ────────────────────────────────────────────────

//   @override
//   Widget build(BuildContext context) {
//     final q     = widget.category.questions[_currentIndex];
//     final total = widget.category.questions.length;
//     final a           = _answers[_currentIndex];
//     final isTimedOut  = a == -1;
//     final isAnswered  = a != null;
//     final isCorrect   = a != null && a != -1 && a == _correct;

//     return Scaffold(
//       backgroundColor: const Color(0xFFEEF2FF),
//       body: SafeArea(
//         child: Center(
//           child: ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: 780),
//             child: Padding(
//               padding: const EdgeInsets.all(24),
//               child: Column(
//                 children: [
//                   // ── Barre supérieure ──────────────────────
//                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                     OutlinedButton.icon(
//                       onPressed: () {
//                         _questionTimer?.cancel();
//                         _advanceTimer?.cancel();
//                         Navigator.popUntil(context, (r) => r.isFirst);
//                       },
//                       icon: const Icon(Icons.home_outlined, size: 16),
//                       label: const Text('Accueil'),
//                       style: OutlinedButton.styleFrom(
//                         foregroundColor: const Color(0xFF1E293B),
//                         side: const BorderSide(color: Color(0xFFCBD5E1)),
//                         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                       ),
//                     ),
//                     Text('Question ${_currentIndex + 1} sur $total',
//                         style: const TextStyle(fontSize: 14, color: Color(0xFF64748B), fontWeight: FontWeight.w500)),
//                   ]),
//                   const SizedBox(height: 20),

//                   // ── Carte quiz ────────────────────────────
//                   Expanded(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                         boxShadow: [BoxShadow(
//                           color: Colors.black.withOpacity(0.07),
//                           blurRadius: 20,
//                           offset: const Offset(0, 4),
//                         )],
//                       ),
//                       padding: const EdgeInsets.all(28),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Catégorie + badge timer
//                           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                             Text(widget.category.title,
//                                 style: const TextStyle(fontSize: 13, color: Color(0xFF94A3B8))),
//                             Row(children: [
//                               Icon(Icons.timer_outlined, color: _timerColor, size: 16),
//                               const SizedBox(width: 4),
//                               Text('${_timeLeft}s', style: TextStyle(
//                                 color: _timerColor, fontWeight: FontWeight.bold, fontSize: 14,
//                               )),
//                             ]),
//                           ]),
//                           const SizedBox(height: 10),

//                           // Barre timer 15s (vert → orange → rouge)
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(4),
//                             child: LinearProgressIndicator(
//                               value: _timeLeft / _totalTime,
//                               backgroundColor: const Color(0xFFE2E8F0),
//                               valueColor: AlwaysStoppedAnimation<Color>(_timerColor),
//                               minHeight: 6,
//                             ),
//                           ),
//                           const SizedBox(height: 6),

//                           // Barre progression globale (indigo)
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(4),
//                             child: LinearProgressIndicator(
//                               value: (_currentIndex + 1) / total,
//                               backgroundColor: const Color(0xFFE2E8F0),
//                               valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF6366F1)),
//                               minHeight: 6,
//                             ),
//                           ),
//                           const SizedBox(height: 24),

//                           // Question
//                           Text(q.question, style: const TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold,
//                             color: Color(0xFF1E293B), height: 1.45,
//                           )),
//                           const SizedBox(height: 20),

//                           // Options + encart explication
//                           Expanded(
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 children: [
//                                   // Options A / B / C / D
//                                   ...List.generate(q.options.length, (i) {
//                                     const labels  = ['A', 'B', 'C', 'D'];
//                                     final trailing = _trailingIcon(i);
//                                     final isActive = _locked && (i == _correct || _sel == i);
//                                     return Padding(
//                                       padding: const EdgeInsets.only(bottom: 12),
//                                       child: GestureDetector(
//                                         onTap: () => _select(i),
//                                         child: AnimatedContainer(
//                                           duration: const Duration(milliseconds: 300),
//                                           decoration: BoxDecoration(
//                                             color: _optBg(i),
//                                             borderRadius: BorderRadius.circular(12),
//                                             border: Border.all(
//                                               color: _optBorder(i),
//                                               width: isActive ? 2 : 1,
//                                             ),
//                                           ),
//                                           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//                                           child: Row(children: [
//                                             AnimatedContainer(
//                                               duration: const Duration(milliseconds: 300),
//                                               width: 34, height: 34,
//                                               decoration: BoxDecoration(color: _badgeBg(i), shape: BoxShape.circle),
//                                               child: Center(child: Text(labels[i], style: TextStyle(
//                                                 fontWeight: FontWeight.bold, fontSize: 14, color: _badgeText(i),
//                                               ))),
//                                             ),
//                                             const SizedBox(width: 14),
//                                             Expanded(child: Text(q.options[i], style: TextStyle(
//                                               fontSize: 15, color: _optText(i),
//                                               fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
//                                             ))),
//                                             if (trailing != null) ...[const SizedBox(width: 8), trailing],
//                                           ]),
//                                         ),
//                                       ),
//                                     );
//                                   }),

//                                   // ── Encart explication (après réponse ou timeout) ──
//                                   if (isAnswered) ...[
//                                     Container(
//                                       width: double.infinity,
//                                       padding: const EdgeInsets.all(14),
//                                       decoration: BoxDecoration(
//                                         color: isTimedOut
//                                             ? const Color(0xFFFFFBEB)
//                                             : (isCorrect ? const Color(0xFFF0FDF4) : const Color(0xFFFFF1F2)),
//                                         borderRadius: BorderRadius.circular(12),
//                                         border: Border.all(
//                                           color: isTimedOut
//                                               ? const Color(0xFFFCD34D)
//                                               : (isCorrect ? const Color(0xFF86EFAC) : const Color(0xFFFCA5A5)),
//                                           width: 1.5,
//                                         ),
//                                       ),
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             isTimedOut
//                                                 ? '⏰ Temps écoulé !'
//                                                 : (isCorrect ? '✓ Bonne réponse !' : '✗ Mauvaise réponse'),
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 14,
//                                               color: isTimedOut
//                                                   ? const Color(0xFF92400E)
//                                                   : (isCorrect ? const Color(0xFF15803D) : const Color(0xFFDC2626)),
//                                             ),
//                                           ),
//                                           const SizedBox(height: 6),
//                                           Text(q.explanation, style: TextStyle(
//                                             fontSize: 13,
//                                             height: 1.4,
//                                             color: isTimedOut
//                                                 ? const Color(0xFF78350F)
//                                                 : (isCorrect ? const Color(0xFF16A34A) : const Color(0xFF6366F1)),
//                                           )),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 18),

//                   // ── Boutons navigation ────────────────────
//                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                     // Précédent — toujours fonctionnel (désactivé sur Q1)
//                     OutlinedButton(
//                       onPressed: _currentIndex > 0 ? _goPrev : null,
//                       style: OutlinedButton.styleFrom(
//                         foregroundColor: const Color(0xFF475569),
//                         disabledForegroundColor: const Color(0xFFCBD5E1),
//                         side: BorderSide(
//                           color: _currentIndex > 0 ? const Color(0xFFCBD5E1) : const Color(0xFFECF0F1),
//                         ),
//                         padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                       ),
//                       child: const Row(mainAxisSize: MainAxisSize.min, children: [
//                         Icon(Icons.arrow_back, size: 16),
//                         SizedBox(width: 6),
//                         Text('Précédent', style: TextStyle(fontSize: 15)),
//                       ]),
//                     ),

//                     // Suivant / Terminer — toujours visible
//                     // Si auto-avancement en cours : affiche spinner + bouton skip
//                     if (_locked && _currentIndex < total - 1)
//                       Row(children: [
//                         // Spinner auto-avancement
//                         Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//                           decoration: BoxDecoration(
//                             color: const Color(0xFFF1F5F9),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: const Row(mainAxisSize: MainAxisSize.min, children: [
//                             SizedBox(width: 15, height: 15,
//                                 child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF6366F1))),
//                             SizedBox(width: 7),
//                             Text('Suite...', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13)),
//                           ]),
//                         ),
//                         const SizedBox(width: 8),
//                         // Bouton pour passer immédiatement
//                         ElevatedButton.icon(
//                           onPressed: _goNext,
//                           icon: const Icon(Icons.skip_next, size: 18),
//                           label: const Text('Suivant'),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white,
//                             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                             elevation: 0,
//                           ),
//                         ),
//                       ])
//                     else
//                       ElevatedButton(
//                         onPressed: _currentIndex < total - 1 ? _goNext : _finish,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                           elevation: 0,
//                         ),
//                         child: Row(mainAxisSize: MainAxisSize.min, children: [
//                           Text(
//                             _currentIndex < total - 1 ? 'Suivant' : 'Terminer',
//                             style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
//                           ),
//                           const SizedBox(width: 6),
//                           Icon(
//                             _currentIndex < total - 1 ? Icons.arrow_forward : Icons.flag,
//                             size: 16,
//                           ),
//                         ]),
//                       ),
//                   ]),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ==================== ÉCRAN RÉSULTATS ====================

// class ResultScreen extends StatelessWidget {
//   final QuizCategory category;
//   final List<int?> userAnswers;
//   const ResultScreen({super.key, required this.category, required this.userAnswers});

//   int get _score => userAnswers.asMap().entries.where((e) => e.value == category.questions[e.key].correct).length;

//   @override
//   Widget build(BuildContext context) {
//     final total = category.questions.length;
//     final score = _score;
//     final pct = (score / total * 100).round();

//     return Scaffold(
//       backgroundColor: const Color(0xFFEEF2FF),
//       body: SafeArea(
//         child: Center(
//           child: ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: 780),
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(28),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 12),
//                   Text('Résultats — ${category.title}',
//                       style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
//                   const SizedBox(height: 4),
//                   const Text('Vous avez obtenu', style: TextStyle(fontSize: 14, color: Color(0xFF94A3B8))),
//                   const SizedBox(height: 14),
//                   Text('$score / $total',
//                       style: const TextStyle(fontSize: 56, fontWeight: FontWeight.bold, color: Color(0xFF6366F1), height: 1)),
//                   const SizedBox(height: 6),
//                   Text('Score : $pct%', style: const TextStyle(fontSize: 16, color: Color(0xFF64748B))),
//                   const SizedBox(height: 28),

//                   ...List.generate(category.questions.length, (i) {
//                     final q = category.questions[i];
//                     final correct = userAnswers[i] == q.correct;
//                     return Padding(
//                       padding: const EdgeInsets.only(bottom: 12),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: correct ? const Color(0xFFF0FDF4) : const Color(0xFFFFF1F2),
//                           borderRadius: BorderRadius.circular(12),
//                           border: Border.all(color: correct ? const Color(0xFF86EFAC) : const Color(0xFFFCA5A5)),
//                         ),
//                         padding: const EdgeInsets.all(16),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                               Icon(correct ? Icons.check_circle : Icons.cancel,
//                                   color: correct ? const Color(0xFF22C55E) : const Color(0xFFEF4444), size: 20),
//                               const SizedBox(width: 10),
//                               Expanded(child: Text('${i + 1}. ${q.question}',
//                                   style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Color(0xFF1E293B), height: 1.4))),
//                             ]),
//                             const SizedBox(height: 6),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 30),
//                               child: Text(q.explanation,
//                                   style: TextStyle(fontSize: 13,
//                                       color: correct ? const Color(0xFF16A34A) : const Color(0xFF6366F1), height: 1.4)),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   }),

//                   const SizedBox(height: 20),
//                   Row(children: [
//                     Expanded(child: ElevatedButton.icon(
//                       onPressed: () => Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (_) => QuizScreen(category: category))),
//                       icon: const Icon(Icons.refresh, size: 18),
//                       label: const Text('Recommencer', style: TextStyle(fontSize: 15)),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), elevation: 0,
//                       ),
//                     )),
//                     const SizedBox(width: 14),
//                     Expanded(child: OutlinedButton.icon(
//                       onPressed: () => Navigator.popUntil(context, (r) => r.isFirst),
//                       icon: const Icon(Icons.home_outlined, size: 18),
//                       label: const Text('Accueil', style: TextStyle(fontSize: 15)),
//                       style: OutlinedButton.styleFrom(
//                         foregroundColor: const Color(0xFF1E293B),
//                         side: const BorderSide(color: Color(0xFFCBD5E1)),
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                       ),
//                     )),
//                   ]),
//                   const SizedBox(height: 24),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }