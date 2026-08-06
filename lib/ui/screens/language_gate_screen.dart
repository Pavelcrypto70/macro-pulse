import 'package:flutter/material.dart';
import '../../l10n/strings.dart';
import '../../theme/app_colors.dart';
import '../widgets/common.dart';

/// First screen: pick language before disclaimer / app.
class LanguageGateScreen extends StatelessWidget {
  const LanguageGateScreen({super.key, required this.onPick});

  final Future<void> Function(AppLang lang) onPick;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 36, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrassChip('FREE #3 · MACRO PULSE', filled: true),
              const SizedBox(height: 20),
              Text(
                'Choose your language',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Elige tu idioma · Escolha seu idioma · Выбери язык',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 28),
              Expanded(
                child: ListView(
                  children: [
                    for (final lang in AppLang.values) ...[
                      _LangCard(
                        title: lang.nativeLabel,
                        subtitle: switch (lang) {
                          AppLang.en => 'English',
                          AppLang.es => 'Latinoamérica · España',
                          AppLang.pt => 'Brasil · Portugal',
                          AppLang.ru => 'Русский',
                        },
                        onTap: () => onPick(lang),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ],
                ),
              ),
              Text(
                'You can change language later in Profile.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LangCard extends StatelessWidget {
  const _LangCard({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 4),
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.brass),
        ],
      ),
    );
  }
}
