import 'package:flutter/material.dart';
import '../../state/app_state.dart';
import '../../theme/app_colors.dart';
import 'archive_screen.dart';
import 'glossary_screen.dart';
import 'language_gate_screen.dart';
import 'learn_screen.dart';
import 'legal_gate_screen.dart';
import 'profile_screen.dart';
import 'pulse_home_screen.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.state});
  final AppState state;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final s = state.s;
    final lang = state.lang;

    if (!state.ready) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(color: AppColors.brass)),
      );
    }

    // 1) Language first — never enter app UI before this.
    if (!state.languageChosen) {
      return LanguageGateScreen(onPick: state.chooseLanguage);
    }

    // 2) Then disclaimer in the chosen language.
    if (!state.legalAccepted) {
      return LegalGateScreen(s: s, onAccept: () => state.acceptLegal());
    }

    final pages = [
      PulseHomeScreen(state: state),
      ArchiveScreen(state: state),
      LearnScreen(s: s, lang: lang),
      GlossaryScreen(s: s, lang: lang),
      ProfileScreen(state: state),
    ];

    return Scaffold(
      body: SafeArea(child: pages[index]),
      bottomNavigationBar: NavigationBar(
        height: 68,
        backgroundColor: AppColors.inkElevated,
        indicatorColor: AppColors.brass.withValues(alpha: 0.18),
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: [
          NavigationDestination(icon: const Icon(Icons.wb_twilight_outlined), label: s.tabPulse),
          NavigationDestination(icon: const Icon(Icons.history), label: s.tabArchive),
          NavigationDestination(icon: const Icon(Icons.menu_book_outlined), label: s.tabLearn),
          NavigationDestination(icon: const Icon(Icons.translate), label: s.tabGlossary),
          NavigationDestination(icon: const Icon(Icons.person_outline), label: s.tabProfile),
        ],
      ),
    );
  }
}
