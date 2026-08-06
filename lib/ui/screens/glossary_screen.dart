import 'package:flutter/material.dart';
import '../../data/glossary_catalog.dart';
import '../../l10n/strings.dart';
import '../../models/models.dart';
import '../widgets/common.dart';

class GlossaryScreen extends StatelessWidget {
  const GlossaryScreen({super.key, required this.s, required this.lang});
  final S s;
  final AppLang lang;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
      children: [
        Text(s.glossaryTitle, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 8),
        Text(s.glossaryHint, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 16),
        ...GlossaryCatalog.entries.map((e) {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(e.title.of(lang), style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(e.subtitle.of(lang), style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}

class GlossaryDetailScreen extends StatelessWidget {
  const GlossaryDetailScreen({
    super.key,
    required this.entry,
    required this.s,
    required this.lang,
  });

  final GlossaryEntry entry;
  final S s;
  final AppLang lang;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(entry.title.of(lang))),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Text(entry.subtitle.of(lang), style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 14),
          SoftCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(s.meaning),
                const SizedBox(height: 8),
                Text(entry.body.of(lang), style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SoftCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(s.howToRead),
                const SizedBox(height: 8),
                Text(entry.mechanics.of(lang), style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SoftCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(s.limits),
                const SizedBox(height: 8),
                Text(entry.limits.of(lang), style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Text(s.educationOnly, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
