import 'package:flutter/material.dart';
import '../../l10n/strings.dart';
import '../../state/app_state.dart';
import '../../theme/app_colors.dart';
import '../widgets/common.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.state});
  final AppState state;

  S get s => state.s;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
      children: [
        Text(s.profileTitle, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        SoftCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(s.language),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: AppLang.values.map((l) {
                  final selected = state.lang == l;
                  return SizedBox(
                    width: (MediaQuery.sizeOf(context).width - 64) / 2,
                    child: _LangBtn(
                      label: l.nativeLabel,
                      selected: selected,
                      onTap: () => state.setLang(l),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SoftCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(s.streakLabel),
              const SizedBox(height: 8),
              Text(
                '14',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.brass),
              ),
              Text(s.demoArchiveLen, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SectionTitle(s.community),
        const SizedBox(height: 8),
        DeskClubButton(label: s.joinDeskClub, subtitle: s.deskClubSub),
        const SizedBox(height: 12),
        SoftCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(s.about),
              const SizedBox(height: 8),
              Text(s.aboutBody, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 10),
              Text(s.softAcademy, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 8),
              Text('source=${AppState.sourceTag}', style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SoftCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(s.visualGuide),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/macro-pulse-5-home.png',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: () async => state.resetLanguageChoice(),
          child: Text(
            switch (state.lang) {
              AppLang.ru => 'Сменить язык (с начала)',
              AppLang.es => 'Cambiar idioma (desde el inicio)',
              AppLang.pt => 'Mudar idioma (do início)',
              AppLang.en => 'Change language (from start)',
            },
          ),
        ),
        const SizedBox(height: 8),
        OutlinedButton(
          onPressed: () async => state.resetLegal(),
          child: Text(s.resetLegal),
        ),
        const SizedBox(height: 8),
        Text(s.educationOnly, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}

class _LangBtn extends StatelessWidget {
  const _LangBtn({required this.label, required this.selected, required this.onTap});
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.brass.withValues(alpha: 0.2) : AppColors.inkElevated,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: selected ? AppColors.brass : AppColors.inkLine),
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: selected ? AppColors.brass : AppColors.cream,
                ),
          ),
        ),
      ),
    );
  }
}
