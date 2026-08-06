import 'package:flutter/material.dart';
import 'state/app_state.dart';
import 'theme/app_theme.dart';
import 'ui/screens/app_shell.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MacroPulseApp());
}

class MacroPulseApp extends StatefulWidget {
  const MacroPulseApp({super.key});

  @override
  State<MacroPulseApp> createState() => _MacroPulseAppState();
}

class _MacroPulseAppState extends State<MacroPulseApp> {
  final AppState state = AppState();

  @override
  void initState() {
    super.initState();
    state.load();
    state.addListener(_onState);
  }

  void _onState() => setState(() {});

  @override
  void dispose() {
    state.removeListener(_onState);
    state.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Macro Pulse',
      debugShowCheckedModeBanner: false,
      theme: buildMacroTheme(),
      home: AppShell(state: state),
    );
  }
}
