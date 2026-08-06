enum AppLang { en, ru }

extension AppLangX on AppLang {
  bool get isRu => this == AppLang.ru;
  String get code => isRu ? 'ru' : 'en';
  AppLang get other => isRu ? AppLang.en : AppLang.ru;
}

/// Bilingual strings for Macro Pulse MVP.
class S {
  S(this.lang);
  final AppLang lang;
  bool get ru => lang.isRu;

  String get appName => 'Macro Pulse';
  String get tagline => ru
      ? 'Утренняя погода рынков · 5 карточек'
      : 'Morning market weather · 5 cards';
  String get freeBadge => ru ? 'FREE #3 · EN/RU' : 'FREE #3 · EN/RU';
  String get webBadge => 'WEB · r1';
  String get educationOnly =>
      ru ? 'Только обучение. Не финансовый совет.' : 'Education only. Not financial advice.';

  String get tabPulse => ru ? 'Пульс' : 'Pulse';
  String get tabArchive => ru ? 'Архив' : 'Archive';
  String get tabLearn => ru ? 'Обучение' : 'Learn';
  String get tabGlossary => ru ? 'Глоссарий' : 'Glossary';
  String get tabProfile => ru ? 'Профиль' : 'Profile';

  String get acceptContinue => ru ? 'Понятно, продолжить' : 'I understand — continue';
  String get legalTitle => ru ? 'Перед стартом' : 'Before you start';
  String get legalBody => ru
      ? 'Macro Pulse — образовательное приложение о макроэкономике и контексте фондового рынка.\n\n'
          '• Это не сигналы и не рекомендации купить/продать.\n'
          '• Цифры в веб-демо — учебный снимок (не живой терминал).\n'
          '• Решения на рынке принимаете только вы.\n'
          '• Сообщество: Desk Club (EN) — практика и грамотность, без «вход сейчас».'
      : 'Macro Pulse is an educational app about macroeconomics and equity-market context.\n\n'
          '• Not signals. Not buy/sell recommendations.\n'
          '• Web demo numbers are a curated educational snapshot (not a live terminal).\n'
          '• You alone are responsible for market decisions.\n'
          '• Community: Desk Club (EN) — practice & literacy, no “enter now”.';

  String get todayPulse => ru ? 'Пульс сегодня' : "Today's pulse";
  String get tapForDetail => ru ? 'Нажми для разбора' : 'Tap for detail';
  String get whatItMeans => ru ? 'Что это значит' : 'What this means';
  String get forEquities => ru ? 'Для акций' : 'For equities';
  String get whyItMatters => ru ? 'Почему важно' : 'Why it matters';
  String get commonMistake => ru ? 'Частая ошибка' : 'Common mistake';
  String get relatedTerms => ru ? 'Связанные термины' : 'Related terms';
  String get back => ru ? 'Назад' : 'Back';
  String get demoNote => ru
      ? 'Учебный снимок · не живые котировки'
      : 'Educational snapshot · not live quotes';
  String get archiveTitle => ru ? 'Архив 14 дней' : '14-day archive';
  String get archiveHint => ru
      ? 'Листай прошлые утренние сводки — привычка читать погоду, а не гнаться за новостью.'
      : 'Browse past morning briefs — build the habit of reading weather, not chasing headlines.';
  String get learnTitle => ru ? 'Как читать пульс' : 'How to read the pulse';
  String get learnIntro => ru
      ? 'Короткий гид: зачем пять карточек и как не превратить макро в сигналы.'
      : 'Short guide: why five cards exist and how not to turn macro into signals.';
  String get glossaryTitle => ru ? 'Общий язык' : 'Shared language';
  String get glossaryHint => ru
      ? 'Термины простым языком. Глубокая система — в Trade Master.'
      : 'Terms in plain language. Full curriculum lives in Trade Master.';
  String get profileTitle => ru ? 'Профиль' : 'Profile';
  String get language => ru ? 'Язык' : 'Language';
  String get community => ru ? 'Сообщество' : 'Community';
  String get joinDeskClub => ru ? 'Вступить в Desk Club' : 'Join Desk Club';
  String get deskClubSub => ru
      ? 'EN-хаб портфеля: практика · структура · академия'
      : 'EN hub: practice · structure · academy';
  String get softAcademy => ru
      ? 'Хочешь систему целиком → Trade Master (платно)'
      : 'Want the full system → Trade Master (paid)';
  String get about => ru ? 'О приложении' : 'About';
  String get aboutBody => ru
      ? 'Macro Pulse = Free #3 в воронке:\nPaper League + Structure Radar + Macro Pulse → Desk Club → Trade Master.\n\nЦель: ежедневная макро-грамотность за 2–3 минуты.'
      : 'Macro Pulse = Free #3 in the funnel:\nPaper League + Structure Radar + Macro Pulse → Desk Club → Trade Master.\n\nGoal: daily macro literacy in 2–3 minutes.';
  String get resetLegal => ru ? 'Показать дисклеймер снова' : 'Show disclaimer again';
  String get openLegal => ru ? 'Правила и дисклеймер' : 'Rules & disclaimer';
  String get visualGuide => ru ? 'Макеты экранов' : 'Screen concepts';
  String get streakLabel => ru ? 'Дней с пульсом (демо)' : 'Pulse days (demo)';
  String get cardRates => ru ? 'Ставки' : 'Rates';
  String get cardInflation => ru ? 'Инфляция' : 'Inflation';
  String get cardDollar => ru ? 'Доллар' : 'Dollar';
  String get cardMood => ru ? 'Настроение' : 'Risk mood';
  String get cardEquities => ru ? 'Для акций' : 'For equities';
}
