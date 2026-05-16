import 'package:flutter/material.dart';
import '../models/quiz_question.dart';
import '../models/quiz_category.dart';

final List<QuizCategory> quizCategories = [

  // --- Base de données ---
  QuizCategory(
    id: 'base-de-donnees',
    title: 'Base de données',
    description: 'SQL, modélisation, normalisation et SGBD',
    gradient: const [Color(0xFF3B82F6), Color(0xFF06B6D4)],
    icon: Icons.storage,
    questions: const [
      QuizQuestion(question: "Quelle commande SQL permet d'extraire des données d'une table ?", options: ['GET', 'SELECT', 'FETCH', 'EXTRACT'], correct: 1, explanation: "SELECT est la commande SQL standard pour interroger et récupérer des données."),
      QuizQuestion(question: "Que signifie SGBD ?", options: ['Système de Gestion de Base de Données', 'Service Général de Bases Distribuées', 'Système Global de Backup Données', 'Stockage Généralisé de Bases Dynamiques'], correct: 0, explanation: "SGBD = Système de Gestion de Base de Données (DBMS en anglais)."),
      QuizQuestion(question: "Quelle clause SQL filtre les lignes d'un résultat ?", options: ['FILTER', 'HAVING', 'WHERE', 'IF'], correct: 2, explanation: "WHERE filtre les lignes ; HAVING filtre les groupes après GROUP BY."),
      QuizQuestion(question: "Une clé primaire doit être :", options: ['Nullable', 'Unique et non nulle', 'Toujours numérique', 'Composée'], correct: 1, explanation: "La clé primaire identifie chaque ligne : elle est unique et NOT NULL."),
      QuizQuestion(question: "Quelle jointure retourne uniquement les lignes correspondantes des deux tables ?", options: ['LEFT JOIN', 'RIGHT JOIN', 'INNER JOIN', 'FULL JOIN'], correct: 2, explanation: "INNER JOIN ne retourne que les lignes ayant une correspondance dans les deux tables."),
      QuizQuestion(question: "Quelle forme normale élimine les dépendances transitives ?", options: ['1NF', '2NF', '3NF', 'BCNF'], correct: 2, explanation: "La 3NF élimine les dépendances transitives entre attributs non-clés."),
      QuizQuestion(question: "Quelle commande supprime une table entière ?", options: ['DELETE TABLE', 'DROP TABLE', 'REMOVE TABLE', 'ERASE TABLE'], correct: 1, explanation: "DROP TABLE supprime la structure et les données. DELETE supprime uniquement les lignes."),
      QuizQuestion(question: "ACID signifie :", options: ['Atomicity, Consistency, Isolation, Durability', 'Access, Control, Index, Data', 'Atomic, Cached, Indexed, Distributed', 'Auth, Crypto, Integrity, Data'], correct: 0, explanation: "ACID = Atomicité, Cohérence, Isolation, Durabilité — propriétés des transactions."),
    ],
  ),

  // --- Programmation ---
  QuizCategory(
    id: 'programmation',
    title: 'Programmation',
    description: 'Algorithmique, paradigmes et langages',
    gradient: const [Color(0xFFA855F7), Color(0xFFEC4899)],
    icon: Icons.code,
    questions: const [
      QuizQuestion(question: "Quelle structure de données fonctionne en LIFO ?", options: ['File (Queue)', 'Pile (Stack)', 'Liste chaînée', 'Arbre'], correct: 1, explanation: "Une pile (Stack) fonctionne en Last In First Out."),
      QuizQuestion(question: "Quelle est la complexité d'une recherche dichotomique ?", options: ['O(n)', 'O(n²)', 'O(log n)', 'O(1)'], correct: 2, explanation: "La recherche dichotomique divise l'espace de recherche par 2 : O(log n)."),
      QuizQuestion(question: "Quel paradigme utilise des objets et des classes ?", options: ['Fonctionnel', 'Procédural', 'Orienté objet', 'Logique'], correct: 2, explanation: "La POO repose sur les concepts de classes, objets, héritage, encapsulation."),
      QuizQuestion(question: "Que fait une fonction récursive ?", options: ["Appelle une autre fonction", "S'appelle elle-même", 'Boucle infinie', 'Retourne null'], correct: 1, explanation: "Une fonction récursive s'appelle elle-même avec un cas de base."),
      QuizQuestion(question: "Quel langage est typé statiquement ?", options: ['Python', 'JavaScript', 'TypeScript', 'Ruby'], correct: 2, explanation: "TypeScript ajoute un typage statique à JavaScript."),
      QuizQuestion(question: "Que signifie API ?", options: ['Application Programming Interface', 'Advanced Process Integration', 'Automated Program Instance', 'Application Process Indicator'], correct: 0, explanation: "API = Application Programming Interface."),
      QuizQuestion(question: "Quel algorithme de tri a une complexité moyenne O(n log n) ?", options: ['Tri à bulles', 'Tri par insertion', 'Tri rapide (Quicksort)', 'Tri par sélection'], correct: 2, explanation: "Quicksort a une complexité moyenne en O(n log n)."),
      QuizQuestion(question: "Le polymorphisme permet :", options: ["D'avoir plusieurs formes pour une même méthode", 'De cacher les données', "D'hériter d'une classe", 'De créer une instance'], correct: 0, explanation: "Le polymorphisme = une même interface, plusieurs implémentations."),
    ],
  ),

  // --- Développement mobile ---
  QuizCategory(
    id: 'developpement-mobile',
    title: 'Développement mobile',
    description: 'iOS, Android, frameworks cross-platform',
    gradient: const [Color(0xFF22C55E), Color(0xFF10B981)],
    icon: Icons.smartphone,
    questions: const [
      QuizQuestion(question: "Quel langage est natif pour Android ?", options: ['Swift', 'Kotlin', 'Dart', 'Objective-C'], correct: 1, explanation: "Kotlin (et Java) sont les langages officiels pour Android."),
      QuizQuestion(question: "Quel langage est natif pour iOS ?", options: ['Kotlin', 'Java', 'Swift', 'C#'], correct: 2, explanation: "Swift est le langage moderne d'Apple pour iOS."),
      QuizQuestion(question: "Quel framework utilise Dart ?", options: ['React Native', 'Flutter', 'Ionic', 'Xamarin'], correct: 1, explanation: "Flutter, créé par Google, utilise le langage Dart."),
      QuizQuestion(question: "Que signifie APK ?", options: ['Android Package Kit', 'Apple Programming Kit', 'App Production Key', 'Android Process Kernel'], correct: 0, explanation: "APK = Android Package Kit, format d'installation Android."),
      QuizQuestion(question: "React Native compile vers :", options: ['Du HTML', 'Des composants natifs', 'Du WebView', 'Du bytecode Java uniquement'], correct: 1, explanation: "React Native rend des composants natifs réels via un pont JS↔Native."),
      QuizQuestion(question: "Quel store distribue les apps iOS ?", options: ['Google Play', 'App Store', 'Microsoft Store', 'Galaxy Store'], correct: 1, explanation: "L'App Store d'Apple est le store officiel iOS."),
      QuizQuestion(question: "Une activité (Activity) en Android est :", options: ['Une classe utilitaire', "Un écran de l'application", 'Un service en arrière-plan', 'Une base de données'], correct: 1, explanation: "Une Activity représente un écran avec lequel l'utilisateur interagit."),
      QuizQuestion(question: "Quel format est utilisé pour les layouts Android ?", options: ['JSON', 'YAML', 'XML', 'HTML'], correct: 2, explanation: "Les layouts Android sont définis en XML (ou en Jetpack Compose)."),
    ],
  ),

  // --- Développement web ---
  QuizCategory(
    id: 'developpement-web',
    title: 'Développement web',
    description: 'HTML, CSS, JavaScript et frameworks',
    gradient: const [Color(0xFFF97316), Color(0xFFEF4444)],
    icon: Icons.language,
    questions: const [
      QuizQuestion(question: "HTML signifie :", options: ['HyperText Markup Language', 'High Tech Modern Language', 'Home Tool Markup Language', 'Hyperlink and Text Markup Language'], correct: 0, explanation: "HTML = HyperText Markup Language."),
      QuizQuestion(question: "Quelle balise crée un lien hypertexte ?", options: ['<link>', '<a>', '<href>', '<url>'], correct: 1, explanation: "La balise <a> avec l'attribut href crée un lien."),
      QuizQuestion(question: "Quel sélecteur CSS cible un id ?", options: ['.id', '#id', '*id', '@id'], correct: 1, explanation: "Le caractère # cible un id ; le . cible une classe."),
      QuizQuestion(question: "Quelle méthode HTTP est idempotente et sert à récupérer ?", options: ['POST', 'GET', 'PATCH', 'DELETE'], correct: 1, explanation: "GET est idempotente et utilisée pour lire des ressources."),
      QuizQuestion(question: "Quel framework JS est maintenu par Meta ?", options: ['Vue', 'Angular', 'React', 'Svelte'], correct: 2, explanation: "React est développé et maintenu par Meta (Facebook)."),
      QuizQuestion(question: "Que signifie CSS ?", options: ['Computer Style Sheets', 'Cascading Style Sheets', 'Creative Style System', 'Coded Styling Source'], correct: 1, explanation: "CSS = Cascading Style Sheets."),
      QuizQuestion(question: "Quel code HTTP signifie 'Non trouvé' ?", options: ['200', '301', '404', '500'], correct: 2, explanation: "404 = Not Found ; 200 = OK ; 500 = Erreur serveur."),
      QuizQuestion(question: "Quelle propriété CSS active Flexbox ?", options: ['display: flex', 'layout: flex', 'position: flex', 'flex: on'], correct: 0, explanation: "display: flex active le modèle Flexbox sur un conteneur."),
    ],
  ),

  // --- Culture générale ---
  QuizCategory(
    id: 'culture-generale',
    title: 'Culture générale informatique',
    description: 'Histoire, concepts et grandes figures',
    gradient: const [Color(0xFFEAB308), Color(0xFFF59E0B)],
    icon: Icons.lightbulb,
    questions: const [
      QuizQuestion(question: "Qui est considéré comme le père de l'informatique ?", options: ['Bill Gates', 'Alan Turing', 'Steve Jobs', 'Linus Torvalds'], correct: 1, explanation: "Alan Turing a posé les fondements théoriques de l'informatique moderne."),
      QuizQuestion(question: "Que signifie CPU ?", options: ['Central Processing Unit', 'Computer Personal Unit', 'Central Power Unit', 'Control Process Utility'], correct: 0, explanation: "CPU = Central Processing Unit, le processeur."),
      QuizQuestion(question: "Combien de bits dans un octet ?", options: ['4', '8', '16', '32'], correct: 1, explanation: "1 octet = 8 bits."),
      QuizQuestion(question: "Qui a créé le noyau Linux ?", options: ['Richard Stallman', 'Linus Torvalds', 'Ken Thompson', 'Dennis Ritchie'], correct: 1, explanation: "Linus Torvalds a créé le noyau Linux en 1991."),
      QuizQuestion(question: "Que signifie RAM ?", options: ['Read Access Memory', 'Random Access Memory', 'Rapid Access Module', 'Run Active Memory'], correct: 1, explanation: "RAM = Random Access Memory, mémoire vive."),
      QuizQuestion(question: "Le système binaire utilise :", options: ['0 et 1', '0 à 9', '0 à F', '1 à 10'], correct: 0, explanation: "Le binaire n'utilise que deux chiffres : 0 et 1."),
      QuizQuestion(question: "Quelle entreprise a créé Windows ?", options: ['Apple', 'IBM', 'Microsoft', 'Google'], correct: 2, explanation: "Windows est développé par Microsoft depuis 1985."),
      QuizQuestion(question: "Le World Wide Web a été inventé par :", options: ['Vint Cerf', 'Tim Berners-Lee', 'Bill Gates', 'Larry Page'], correct: 1, explanation: "Tim Berners-Lee a inventé le Web au CERN en 1989."),
    ],
  ),

  // --- Réseaux et sécurité ---
  QuizCategory(
    id: 'reseaux-securite',
    title: 'Réseaux et sécurité',
    description: 'Protocoles, modèle OSI et cybersécurité',
    gradient: const [Color(0xFF6366F1), Color(0xFF8B5CF6)],
    icon: Icons.shield,
    questions: const [
      QuizQuestion(question: "Combien de couches comporte le modèle OSI ?", options: ['4', '5', '7', '9'], correct: 2, explanation: "Le modèle OSI comporte 7 couches, de la couche physique à la couche application."),
      QuizQuestion(question: "Quel protocole sécurise HTTP ?", options: ['FTP', 'TLS/SSL', 'SMTP', 'ARP'], correct: 1, explanation: "HTTPS utilise TLS (anciennement SSL) pour chiffrer les échanges."),
      QuizQuestion(question: "Une adresse IPv4 est composée de :", options: ['32 bits', '64 bits', '128 bits', '256 bits'], correct: 0, explanation: "IPv4 utilise 32 bits, soit 4 octets séparés par des points."),
      QuizQuestion(question: "Que fait un pare-feu (firewall) ?", options: ['Stocke les mots de passe', 'Filtre le trafic réseau selon des règles', 'Accélère la connexion', 'Génère des certificats'], correct: 1, explanation: "Un firewall contrôle le trafic entrant/sortant selon des règles de sécurité."),
      QuizQuestion(question: "Le phishing est :", options: ['Un virus informatique', "Une technique d'hameçonnage par usurpation", 'Un protocole réseau', 'Un type de pare-feu'], correct: 1, explanation: "Le phishing usurpe une identité de confiance pour voler des informations."),
      QuizQuestion(question: "Quel protocole résout les noms de domaine en IP ?", options: ['HTTP', 'DNS', 'DHCP', 'FTP'], correct: 1, explanation: "DNS (Domain Name System) traduit les noms en adresses IP."),
      QuizQuestion(question: "Le chiffrement symétrique utilise :", options: ['Une paire de clés publique/privée', 'Une seule clé partagée', 'Aucune clé', 'Un certificat uniquement'], correct: 1, explanation: "Le chiffrement symétrique (AES, DES) utilise la même clé pour chiffrer et déchiffrer."),
      QuizQuestion(question: "Une attaque DDoS vise à :", options: ['Voler des données', 'Saturer un service pour le rendre indisponible', 'Cracker un mot de passe', 'Installer un malware'], correct: 1, explanation: "DDoS = Distributed Denial of Service : saturer un serveur depuis de multiples sources."),
    ],
  ),
];