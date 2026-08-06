import 'package:flutter/material.dart';
import '../../data/glossary_catalog.dart';
import '../../l10n/strings.dart';
import '../../models/models.dart';
import '../../theme/app_colors.dart';
import '../widgets/common.dart';
import 'glossary_screen.dart';

class CardDetailScreen extends StatelessWidget {
  const CardDetailScreen({
    super.key,
    required this.day,
    required this.card,
    required this.s,
    required this.lang,
  });

  final PulseDay day;
  final PulseCard card;
  final S s;
  final AppLang lang;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(card.headline.of(lang)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          BrassChip(day.dateIso, filled: true),
          const SizedBox(height: 14),
          SoftCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(s.whatItMeans),
                const SizedBox(height: 8),
                Text(card.valueLabel.of(lang), style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 10),
                Text(card.plainMeaning.of(lang), style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SoftCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(s.forEquities),
                const SizedBox(height: 8),
                Text(card.forEquities.of(lang), style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SoftCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(s.whyItMatters),
                const SizedBox(height: 8),
                Text(card.whyItMatters.of(lang), style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SoftCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(s.commonMistake),
                const SizedBox(height: 8),
                Text(card.commonMistake.of(lang), style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
          const SizedBox(height: 18),
          SectionTitle(s.relatedTerms),
          const SizedBox(height: 10),
          ...card.glossaryIds.map((id) {
            final e = GlossaryCatalog.byId(id);
            if (e == null) return const SizedBox.shrink();
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: SoftCard(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => GlossaryDetailScreen(entry: e, s: s, lang: lang),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(e.title.of(lang), style: Theme.of(context).textTheme.titleMedium),
                          Text(e.subtitle.of(lang), style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: AppColors.muted),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: 12),
          DeskClubButton(label: s.joinDeskClub, subtitle: s.deskClubSub),
          const SizedBox(height: 12),
          Text(s.educationOnly, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
