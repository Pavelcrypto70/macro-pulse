import 'package:flutter/material.dart';
import '../../data/pulse_catalog.dart';
import '../../l10n/strings.dart';
import '../../models/models.dart';
import '../../theme/app_colors.dart';
import '../widgets/common.dart';
import 'card_detail_screen.dart';

class PulseHomeScreen extends StatelessWidget {
  const PulseHomeScreen({super.key, required this.s, required this.isRu});
  final S s;
  final bool isRu;

  @override
  Widget build(BuildContext context) {
    final day = PulseCatalog.today;
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
                    BrassChip(PulseCatalog.stamp),
                  ],
                ),
                const SizedBox(height: 16),
                Text(s.appName, style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 6),
                Text(s.tagline, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 10),
                Text(s.demoNote, style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 16),
                SoftCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle(s.todayPulse),
                      const SizedBox(height: 8),
                      Text(
                        day.dateIso,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        day.summary.of(isRu),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
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
                isRu: isRu,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => CardDetailScreen(
                        day: day,
                        card: card,
                        s: s,
                        isRu: isRu,
                      ),
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
            child: DeskClubButton(
              label: s.joinDeskClub,
              subtitle: s.deskClubSub,
            ),
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
    required this.isRu,
    required this.onTap,
  });

  final int index;
  final PulseCard card;
  final S s;
  final bool isRu;
  final VoidCallback onTap;

  String get _kindLabel {
    switch (card.kind) {
      case PulseCardKind.rates:
        return s.cardRates;
      case PulseCardKind.inflation:
        return s.cardInflation;
      case PulseCardKind.dollar:
        return s.cardDollar;
      case PulseCardKind.mood:
        return s.cardMood;
      case PulseCardKind.equities:
        return s.cardEquities;
    }
  }

  IconData get _icon {
    switch (card.kind) {
      case PulseCardKind.rates:
        return Icons.account_balance_outlined;
      case PulseCardKind.inflation:
        return Icons.shopping_bag_outlined;
      case PulseCardKind.dollar:
        return Icons.attach_money;
      case PulseCardKind.mood:
        return Icons.psychology_alt_outlined;
      case PulseCardKind.equities:
        return Icons.show_chart;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.inkElevated,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.inkLine),
            ),
            child: Icon(_icon, color: AppColors.brass, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '$index · $_kindLabel',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const Spacer(),
                    Text(
                      s.tapForDetail,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.brassDim,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  card.headline.of(isRu),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 6),
                Text(
                  card.valueLabel.of(isRu),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
