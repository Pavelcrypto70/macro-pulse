import '../models/models.dart';

class GuideCatalog {
  static const lessons = <GuideLesson>[
    GuideLesson(
      id: 'why_five',
      title: LocalizedText(
        en: 'Why exactly five cards?',
        ru: 'Зачем ровно пять карточек?',
      ),
      body: LocalizedText(
        en: 'Five is enough to cover the core weather system — rates, inflation, dollar, risk mood, equity context — without drowning you in a news firehose. The goal is a 2–3 minute ritual.',
        ru: 'Пяти хватает, чтобы закрыть ядро погоды — ставки, инфляция, доллар, настроение, контекст акций — без пожарного шланга новостей. Цель — ритуал на 2–3 минуты.',
      ),
      takeaway: LocalizedText(
        en: 'Finish all five before opening a charting rabbit hole.',
        ru: 'Дочитай все пять, прежде чем нырять в графики.',
      ),
    ),
    GuideLesson(
      id: 'weather_not_tips',
      title: LocalizedText(
        en: 'Weather ≠ trade tips',
        ru: 'Погода ≠ торговые советы',
      ),
      body: LocalizedText(
        en: 'Macro Pulse describes conditions. It does not tell you what to buy. If a sentence starts to sound like an entry, stop — re-read the disclaimer.',
        ru: 'Macro Pulse описывает условия. Он не говорит, что купить. Если фраза звучит как вход — стоп, перечитай дисклеймер.',
      ),
      takeaway: LocalizedText(
        en: 'Ask “what regime am I in?” not “what ticker now?”',
        ru: 'Спрашивай «в каком я режиме?», а не «какой тикер сейчас?».',
      ),
    ),
    GuideLesson(
      id: 'order',
      title: LocalizedText(
        en: 'Suggested reading order',
        ru: 'Порядок чтения',
      ),
      body: LocalizedText(
        en: '1) Rates 2) Inflation 3) Dollar 4) Risk mood 5) Equities bridge. The last card only makes sense after the first four.',
        ru: '1) Ставки 2) Инфляция 3) Доллар 4) Настроение 5) Мост к акциям. Пятая карточка имеет смысл только после первых четырёх.',
      ),
      takeaway: LocalizedText(
        en: 'Don’t jump to equities first.',
        ru: 'Не прыгай сразу к акциям.',
      ),
    ),
    GuideLesson(
      id: 'archive_habit',
      title: LocalizedText(
        en: 'Use the archive',
        ru: 'Пользуйся архивом',
      ),
      body: LocalizedText(
        en: 'Comparing yesterday vs today trains pattern recognition: did mood flip, or is it noise? The archive exists for habit, not nostalgia.',
        ru: 'Сравнение вчера/сегодня тренирует паттерны: настроение сменилось или это шум? Архив — для привычки, не для ностальгии.',
      ),
      takeaway: LocalizedText(
        en: 'Once a week, skim 5 prior days.',
        ru: 'Раз в неделю пробеги 5 прошлых дней.',
      ),
    ),
    GuideLesson(
      id: 'community',
      title: LocalizedText(
        en: 'Discuss in Desk Club',
        ru: 'Обсуждай в Desk Club',
      ),
      body: LocalizedText(
        en: 'Bring process questions to the EN community — not “guaranteed setups”. Pair with Paper League (practice) and Structure Radar (structure literacy).',
        ru: 'Неси в EN-сообщество вопросы процесса — не «гарантированные сетапы». Рядом Paper League (практика) и Structure Radar (структура).',
      ),
      takeaway: LocalizedText(
        en: 'Apps → Community → Academy.',
        ru: 'Приложения → Сообщество → Академия.',
      ),
    ),
    GuideLesson(
      id: 'demo_data',
      title: LocalizedText(
        en: 'About WEB demo data',
        ru: 'Про данные веб-демо',
      ),
      body: LocalizedText(
        en: 'This GitHub Pages build ships a curated educational snapshot. It is not a live Bloomberg/terminal feed. Treat numbers as teaching props.',
        ru: 'Сборка на GitHub Pages несёт учебный снимок. Это не живой терминал. Цифры — реквизит для обучения.',
      ),
      takeaway: LocalizedText(
        en: 'Learn the language first; live feeds can come later.',
        ru: 'Сначала язык; живые фиды — позже.',
      ),
    ),
  ];
}
