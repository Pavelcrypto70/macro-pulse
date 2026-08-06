import 'package:flutter/material.dart';
import '../../state/app_state.dart';
import '../widgets/common.dart';
import 'card_detail_screen.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key, required this.state});
  final AppState state;

  @override
  Widget build(BuildContext context) {
    final s = state.s;
    final lang = state.lang;
    final days = state.pulseDays;
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
      children: [
        Text(s.archiveTitle, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 8),
        Text(s.archiveHint, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 16),
        ...days.map((day) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SoftCard(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: const Color(0xFF121A2B),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                  ),
                  builder: (ctx) {
                    return SafeArea(
                      child: ListView(
                        padding: const EdgeInsets.all(20),
                        children: [
                          Text(day.dateIso, style: Theme.of(ctx).textTheme.labelLarge),
                          const SizedBox(height: 8),
                          Text(day.summary.of(lang), style: Theme.of(ctx).textTheme.titleMedium),
                          const SizedBox(height: 14),
                          ...day.cards.map((c) {
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(c.headline.of(lang)),
                              subtitle: Text(c.valueLabel.of(lang)),
                              trailing: const Icon(Icons.chevron_right),
                              onTap: () {
                                Navigator.pop(ctx);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => CardDetailScreen(
                                      day: day,
                                      card: c,
                                      s: s,
                                      lang: lang,
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(day.dateIso, style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: 6),
                  Text(day.summary.of(lang), style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
