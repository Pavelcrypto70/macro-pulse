import '../l10n/strings.dart';

enum PulseCardKind { rates, inflation, dollar, mood, equities }

class LocalizedText {
  const LocalizedText({
    required this.en,
    required this.ru,
    required this.es,
    required this.pt,
  });

  final String en;
  final String ru;
  final String es;
  final String pt;

  String of(AppLang lang) => switch (lang) {
        AppLang.en => en,
        AppLang.ru => ru,
        AppLang.es => es,
        AppLang.pt => pt,
      };
}

LocalizedText L(String en, String ru, String es, String pt) =>
    LocalizedText(en: en, ru: ru, es: es, pt: pt);

class PulseCard {
  const PulseCard({
    required this.kind,
    required this.headline,
    required this.valueLabel,
    required this.plainMeaning,
    required this.forEquities,
    required this.whyItMatters,
    required this.commonMistake,
    required this.glossaryIds,
  });

  final PulseCardKind kind;
  final LocalizedText headline;
  final LocalizedText valueLabel;
  final LocalizedText plainMeaning;
  final LocalizedText forEquities;
  final LocalizedText whyItMatters;
  final LocalizedText commonMistake;
  final List<String> glossaryIds;
}

class PulseDay {
  const PulseDay({
    required this.dateIso,
    required this.summary,
    required this.cards,
  });

  final String dateIso;
  final LocalizedText summary;
  final List<PulseCard> cards;
}

class GlossaryEntry {
  const GlossaryEntry({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.mechanics,
    required this.limits,
  });

  final String id;
  final LocalizedText title;
  final LocalizedText subtitle;
  final LocalizedText body;
  final LocalizedText mechanics;
  final LocalizedText limits;
}

class GuideLesson {
  const GuideLesson({
    required this.id,
    required this.title,
    required this.body,
    required this.takeaway,
  });

  final String id;
  final LocalizedText title;
  final LocalizedText body;
  final LocalizedText takeaway;
}
