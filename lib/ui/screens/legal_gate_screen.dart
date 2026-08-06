import 'package:flutter/material.dart';
import '../../l10n/strings.dart';
import '../../theme/app_colors.dart';
import '../widgets/common.dart';

class LegalGateScreen extends StatelessWidget {
  const LegalGateScreen({super.key, required this.s, required this.onAccept});
  final S s;
  final VoidCallback onAccept;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrassChip(s.freeBadge, filled: true),
              const SizedBox(height: 18),
              Text(s.appName, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              Text(s.tagline, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 24),
              Expanded(
                child: SoftCard(
                  child: ListView(
                    children: [
                      SectionTitle(s.legalTitle),
                      const SizedBox(height: 12),
                      Text(s.legalBody, style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 16),
                      Text(s.educationOnly, style: Theme.of(context).textTheme.labelLarge),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: onAccept,
                  child: Text(s.acceptContinue),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: openDeskClub,
                  child: Text(
                    s.joinDeskClub,
                    style: const TextStyle(color: AppColors.brass),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
