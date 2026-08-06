import 'package:flutter/material.dart';
import '../../l10n/strings.dart';
import '../../models/models.dart';
import '../../state/app_state.dart';
import '../../theme/app_colors.dart';
import '../widgets/common.dart';
import 'card_detail_screen.dart';

class PulseHomeScreen extends StatelessWidget {
  const PulseHomeScreen({super.key, required this.state});
  final AppState state;

  @override
  Widget build(BuildContext context) {
    final s = state.s;
    final lang = state.lang;
    final day = state.todayPulse;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BrassChip(s.freeBadge, filled: true),
                    const SizedBox(width: 8),
                    BrassChip(state.pulseStamp),
                    if (state.pulseLoading) ...[
                      const SizedBox(width: 8),
                      const SizedBox(
                        width: 14,
                        height: 14,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.brass,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 16),
                Text(s.appName, style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 6),
                Text(s.tagline, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 10),
                Text(
                  state.pulseIsLive ? s.liveDataNote : s.demoNote,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                if (state.pulseAsOf != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    s.dataAsOf(state.pulseAsOf!),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: state.pulseLoading ? null : () => state.refreshPulse(),
                    icon: const Icon(Icons.refresh, size: 18),
                    label: Text(s.refreshData),
                  ),
                ),
                const SizedBox(height: 8),
                SoftCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle(s.todayPulse),
                      const SizedBox(height: 8),
                      Text(day.dateIso, style: Theme.of(context).textTheme.labelLarge),
                      const SizedBox(height: 8),
                      Text(day.summary.of(lang), style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          sliver: SliverList.separated(
            itemCount: day.cards.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, i) {
              final card = day.cards[i];
              return _PulseCardTile(
                index: i + 1,
                card: card,
                s: s,
                lang: lang,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => CardDetailScreen(day: day, card: card, s: s, lang: lang),
                    ),
                  );
                },
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
            child: DeskClubButton(label: s.joinDeskClub, subtitle: s.deskClubSub),
          ),
        ),
      ],
    );
  }
}

class _PulseCardTile extends StatelessWidget {
  const _PulseCardTile({
    required this.index,
    required this.card,
    required this.s,
    required this.lang,
    required this.onTap,
  });

  final int index;
  final PulseCard card;
  final S s;
  final AppLang lang;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            index.toString().padLeft(2, '0'),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.brass),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(card.headline.of(lang), style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 6),
                Text(card.valueLabel.of(lang), style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 8),
                Text(s.tapForDetail, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.brass),
        ],
      ),
    );
  }
}
