enum AppLang { en, ru, es, pt }

extension AppLangX on AppLang {
  String get code => switch (this) {
        AppLang.en => 'en',
        AppLang.ru => 'ru',
        AppLang.es => 'es',
        AppLang.pt => 'pt',
      };

  String get nativeLabel => switch (this) {
        AppLang.en => 'English',
        AppLang.ru => 'Русский',
        AppLang.es => 'Español',
        AppLang.pt => 'Português',
      };
}

AppLang appLangFromCode(String? code) => switch (code) {
      'ru' => AppLang.ru,
      'es' => AppLang.es,
      'pt' => AppLang.pt,
      _ => AppLang.en,
    };

/// UI chrome strings — EN / RU / ES / PT (LATAM).
class S {
  S(this.lang);
  final AppLang lang;

  String _t(String en, String ru, String es, String pt) => switch (lang) {
        AppLang.en => en,
        AppLang.ru => ru,
        AppLang.es => es,
        AppLang.pt => pt,
      };

  String get appName => 'Macro Pulse';
  String get tagline => _t(
        'Morning market weather · 5 cards',
        'Утренняя погода рынков · 5 карточек',
        'Clima matutino del mercado · 5 tarjetas',
        'Clima matinal do mercado · 5 cartões',
      );
  String get freeBadge => 'FREE #3 · EN/RU/ES/PT';
  String get webBadge => 'WEB · r8';
  String get educationOnly => _t(
        'Education only. Not financial advice.',
        'Только обучение. Не финансовый совет.',
        'Solo educación. No es consejo financiero.',
        'Apenas educação. Não é aconselhamento financeiro.',
      );

  String get tabPulse => _t('Pulse', 'Пульс', 'Pulso', 'Pulso');
  String get tabArchive => _t('Archive', 'Архив', 'Archivo', 'Arquivo');
  String get tabLearn => _t('Learn', 'Обучение', 'Aprender', 'Aprender');
  String get tabGlossary => _t('Glossary', 'Глоссарий', 'Glosario', 'Glossário');
  String get tabProfile => _t('Profile', 'Профиль', 'Perfil', 'Perfil');

  String get acceptContinue => _t(
        'I understand — continue',
        'Понятно, продолжить',
        'Entiendo — continuar',
        'Entendi — continuar',
      );
  String get legalTitle => _t(
        'Before you start',
        'Перед стартом',
        'Antes de empezar',
        'Antes de começar',
      );
  String get legalBody => _t(
        'Macro Pulse is an educational app about macroeconomics and equity-market context.\n\n'
            '• Not signals. Not buy/sell recommendations.\n'
            '• Numbers are delayed public educational data (FRED / Yahoo / FX) — not a live trading terminal.\n'
            '• You alone are responsible for market decisions.\n'
            '• Community: Desk Club (EN) — practice & literacy, no “enter now”.',
        'Macro Pulse — образовательное приложение о макроэкономике и контексте фондового рынка.\n\n'
            '• Это не сигналы и не рекомендации купить/продать.\n'
            '• Цифры — отложенные публичные данные (FRED / Yahoo / FX), не живой торговый терминал.\n'
            '• Решения на рынке принимаете только вы.\n'
            '• Сообщество: Desk Club (EN) — практика и грамотность, без «вход сейчас».',
        'Macro Pulse es una app educativa sobre macroeconomía y contexto de acciones.\n\n'
            '• No son señales ni recomendaciones de compra/venta.\n'
            '• Los números son datos públicos diferidos (FRED / Yahoo / FX) — no un terminal en vivo.\n'
            '• Tú eres responsable de tus decisiones de mercado.\n'
            '• Comunidad: Desk Club (EN) — práctica y alfabetización, sin “entra ahora”.',
        'Macro Pulse é um app educativo sobre macroeconomia e contexto de ações.\n\n'
            '• Não são sinais nem recomendações de compra/venda.\n'
            '• Os números são dados públicos defasados (FRED / Yahoo / FX) — não um terminal ao vivo.\n'
            '• Você é responsável pelas suas decisões de mercado.\n'
            '• Comunidade: Desk Club (EN) — prática e alfabetização, sem “entre agora”.',
      );

  String get todayPulse => _t("Today's pulse", 'Пульс сегодня', 'Pulso de hoy', 'Pulso de hoje');
  String get tapForDetail => _t('Tap for detail', 'Нажми для разбора', 'Toca para detalle', 'Toque para detalhe');
  String get whatItMeans => _t('What this means', 'Что это значит', 'Qué significa', 'O que isso significa');
  String get forEquities => _t('For equities', 'Для акций', 'Para acciones', 'Para ações');
  String get whyItMatters => _t('Why it matters', 'Почему важно', 'Por qué importa', 'Por que importa');
  String get commonMistake => _t('Common mistake', 'Частая ошибка', 'Error común', 'Erro comum');
  String get relatedTerms => _t('Related terms', 'Связанные термины', 'Términos relacionados', 'Termos relacionados');
  String get back => _t('Back', 'Назад', 'Atrás', 'Voltar');
  String get demoNote => _t(
        'Educational framing · delayed public data',
        'Обучающий разбор · отложенные публичные данные',
        'Enfoque educativo · datos públicos diferidos',
        'Leitura educativa · dados públicos defasados',
      );
  String get liveDataNote => _t(
        'Live pull · delayed public series · not a trading terminal',
        'Подтянуто · отложенные публичные ряды · не торговый терминал',
        'Datos traídos · series públicas diferidas · no es terminal',
        'Dados puxados · séries públicas defasadas · não é terminal',
      );
  String dataAsOf(String iso) => _t(
        'As of $iso',
        'На дату $iso',
        'Al $iso',
        'Em $iso',
      );
  String get refreshData => _t(
        'Refresh data',
        'Обновить данные',
        'Actualizar datos',
        'Atualizar dados',
      );
  String get archiveTitle => _t('14-day archive', 'Архив 14 дней', 'Archivo 14 días', 'Arquivo 14 dias');
  String get archiveHint => _t(
        'Browse past morning briefs — build the habit of reading weather, not chasing headlines.',
        'Листай прошлые утренние сводки — привычка читать погоду, а не гнаться за новостью.',
        'Revisa resúmenes pasados — hábito de leer el clima, no perseguir titulares.',
        'Revise resumos passados — hábito de ler o clima, não perseguir manchetes.',
      );
  String get learnTitle => _t('How to read the pulse', 'Как читать пульс', 'Cómo leer el pulso', 'Como ler o pulso');
  String get learnIntro => _t(
        'Short guide: why five cards exist and how not to turn macro into signals.',
        'Короткий гид: зачем пять карточек и как не превратить макро в сигналы.',
        'Guía corta: por qué hay cinco tarjetas y cómo no convertir macro en señales.',
        'Guia curta: por que existem cinco cartões e como não transformar macro em sinais.',
      );
  String get glossaryTitle => _t('Shared language', 'Общий язык', 'Lenguaje compartido', 'Linguagem compartilhada');
  String get glossaryHint => _t(
        'Terms in plain language. Full curriculum lives in Trade Master.',
        'Термины простым языком. Глубокая система — в Trade Master.',
        'Términos en lenguaje claro. El currículo completo está en Trade Master.',
        'Termos em linguagem clara. O currículo completo está no Trade Master.',
      );
  String get profileTitle => _t('Profile', 'Профиль', 'Perfil', 'Perfil');
  String get language => _t('Language', 'Язык', 'Idioma', 'Idioma');
  String get community => _t('Community', 'Сообщество', 'Comunidad', 'Comunidade');
  String get joinDeskClub => _t('Join Desk Club', 'Вступить в Desk Club', 'Unirse a Desk Club', 'Entrar no Desk Club');
  String get deskClubSub => _t(
        'EN hub: practice · structure · academy',
        'EN-хаб портфеля: практика · структура · академия',
        'Hub EN: práctica · estructura · academia',
        'Hub EN: prática · estrutura · academia',
      );
  String get joinTradeMaster => _t(
        'Continue in Trade Master',
        'Продолжить в Trade Master',
        'Continuar en Trade Master',
        'Continuar no Trade Master',
      );
  String get tradeMasterSub => _t(
        'Full curriculum: lessons · quizzes · certificate',
        'Полный курс: уроки · квизы · сертификат',
        'Currículo completo: lecciones · quizzes · certificado',
        'Currículo completo: lições · quizzes · certificado',
      );
  String get softAcademy => _t(
        'Want the full system → Trade Master (paid)',
        'Хочешь систему целиком → Trade Master (платно)',
        '¿Quieres el sistema completo? → Trade Master (de pago)',
        'Quer o sistema completo? → Trade Master (pago)',
      );
  String get about => _t('About', 'О приложении', 'Acerca de', 'Sobre o app');
  String get aboutBody => _t(
        'Macro Pulse = Free #3 in the funnel:\nPaper League + Structure Radar + Macro Pulse → Desk Club → Trade Master.\n\nGoal: daily macro literacy in 2–3 minutes.',
        'Macro Pulse = Free #3 в воронке:\nPaper League + Structure Radar + Macro Pulse → Desk Club → Trade Master.\n\nЦель: ежедневная макро-грамотность за 2–3 минуты.',
        'Macro Pulse = Free #3 en el embudo:\nPaper League + Structure Radar + Macro Pulse → Desk Club → Trade Master.\n\nMeta: alfabetización macro diaria en 2–3 minutos.',
        'Macro Pulse = Free #3 no funil:\nPaper League + Structure Radar + Macro Pulse → Desk Club → Trade Master.\n\nMeta: alfabetização macro diária em 2–3 minutos.',
      );
  String get privacyPolicy => _t(
        'Privacy Policy',
        'Политика конфиденциальности',
        'Política de privacidad',
        'Política de privacidade',
      );
  String get termsOfService => _t(
        'Terms of Service',
        'Условия использования',
        'Términos de servicio',
        'Termos de serviço',
      );
  String get resetLegal => _t(
        'Show disclaimer again',
        'Показать дисклеймер снова',
        'Mostrar aviso otra vez',
        'Mostrar aviso novamente',
      );
  String get openLegal => _t('Rules & disclaimer', 'Правила и дисклеймер', 'Reglas y aviso', 'Regras e aviso');
  String get visualGuide => _t('Screen concepts', 'Макеты экранов', 'Conceptos de pantalla', 'Conceitos de tela');
  String get streakLabel => _t('Pulse days (demo)', 'Дней с пульсом (демо)', 'Días de pulso (demo)', 'Dias de pulso (demo)');
  String get cardRates => _t('Rates', 'Ставки', 'Tasas', 'Taxas');
  String get cardInflation => _t('Inflation', 'Инфляция', 'Inflación', 'Inflação');
  String get cardDollar => _t('Dollar', 'Доллар', 'Dólar', 'Dólar');
  String get cardMood => _t('Risk mood', 'Настроение', 'Ánimo de riesgo', 'Humor de risco');
  String get cardEquities => _t('For equities', 'Для акций', 'Para acciones', 'Para ações');
  String get meaning => _t('Meaning', 'Смысл', 'Significado', 'Significado');
  String get howToRead => _t('How to read', 'Как читать', 'Cómo leer', 'Como ler');
  String get limits => _t('Limits', 'Ограничения', 'Límites', 'Limites');
  String get takeaway => _t('Takeaway', 'Вывод', 'Idea clave', 'Conclusão');
  String get visualAnchor => _t('Visual anchor', 'Визуальный якорь', 'Ancla visual', 'Âncora visual');
  String get homeConcept => _t(
        'Home concept: five morning pulse cards.',
        'Концепт главного экрана: пять карточек утреннего пульса.',
        'Concepto de inicio: cinco tarjetas del pulso matutino.',
        'Conceito da home: cinco cartões do pulso matinal.',
      );
  String get demoArchiveLen => _t(
        'demo archive length',
        'учебный архив в демо',
        'largo del archivo demo',
        'tamanho do arquivo demo',
      );
}
