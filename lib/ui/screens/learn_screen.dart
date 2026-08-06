import 'package:flutter/material.dart';
import '../../data/guide_catalog.dart';
import '../../l10n/strings.dart';
import '../widgets/common.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key, required this.s, required this.isRu});
  final S s;
  final bool isRu;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
      children: [
        Text(s.learnTitle, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 8),
        Text(s.learnIntro, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 16),
        SoftCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(isRu ? 'Визуальный якорь' : 'Visual anchor'),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/macro-pulse-5-home.png',
                  fit: BoxFit.cover,
                  height: 220,
                  width: double.infinity,
                  errorBuilder: (_, __, ___) => const SizedBox(height: 120),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                isRu
                    ? 'Концепт главного экрана: пять карточек утреннего пульса.'
                    : 'Home concept: five morning pulse cards.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        ...GuideCatalog.lessons.map((lesson) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SoftCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(lesson.title.of(isRu), style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text(lesson.body.of(isRu), style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 10),
                  SectionTitle(isRu ? 'Вывод' : 'Takeaway'),
                  const SizedBox(height: 6),
                  Text(lesson.takeaway.of(isRu), style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
          );
        }),
        DeskClubButton(label: s.joinDeskClub, subtitle: s.deskClubSub),
      ],
    );
  }
}
