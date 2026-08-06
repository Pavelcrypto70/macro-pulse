import '../models/models.dart';

class GuideCatalog {
  static final lessons = <GuideLesson>[
    GuideLesson(
      id: 'why_five',
      title: L(
        'Why exactly five cards?',
        'Зачем ровно пять карточек?',
        '¿Por qué exactamente cinco tarjetas?',
        'Por que exatamente cinco cartões?',
      ),
      body: L(
        'Five is enough to cover the core weather system — rates, inflation, dollar, risk mood, equity context — without drowning you in a news firehose. The goal is a 2–3 minute ritual.',
        'Пяти хватает, чтобы закрыть ядро погоды — ставки, инфляция, доллар, настроение, контекст акций — без пожарного шланга новостей. Цель — ритуал на 2–3 минуты.',
        'Cinco bastan para cubrir el clima núcleo — tasas, inflación, dólar, ánimo, contexto de acciones — sin manguera de noticias. Meta: ritual de 2–3 minutos.',
        'Cinco bastam para cobrir o clima núcleo — taxas, inflação, dólar, humor, contexto de ações — sem mangueira de notícias. Meta: ritual de 2–3 minutos.',
      ),
      takeaway: L(
        'Finish all five before opening a charting rabbit hole.',
        'Дочитай все пять, прежде чем нырять в графики.',
        'Termina las cinco antes de caer en el agujero de gráficos.',
        'Termine os cinco antes de cair no buraco de gráficos.',
      ),
    ),
    GuideLesson(
      id: 'weather_not_tips',
      title: L(
        'Weather ≠ trade tips',
        'Погода ≠ торговые советы',
        'Clima ≠ tips de trade',
        'Clima ≠ tips de trade',
      ),
      body: L(
        'Macro Pulse describes conditions. It does not tell you what to buy. If a sentence starts to sound like an entry, stop — re-read the disclaimer.',
        'Macro Pulse описывает условия. Он не говорит, что купить. Если фраза звучит как вход — стоп, перечитай дисклеймер.',
        'Macro Pulse describe condiciones. No te dice qué comprar. Si una frase suena a entrada — para y relee el aviso.',
        'Macro Pulse descreve condições. Não diz o que comprar. Se uma frase soar como entrada — pare e releia o aviso.',
      ),
      takeaway: L(
        'Ask “what regime am I in?” not “what ticker now?”',
        'Спрашивай «в каком я режиме?», а не «какой тикер сейчас?».',
        'Pregunta “¿en qué régimen estoy?” no “¿qué ticker ahora?”',
        'Pergunte “em que regime estou?” não “qual ticker agora?”',
      ),
    ),
    GuideLesson(
      id: 'order',
      title: L(
        'Suggested reading order',
        'Порядок чтения',
        'Orden de lectura sugerido',
        'Ordem de leitura sugerida',
      ),
      body: L(
        '1) Rates 2) Inflation 3) Dollar 4) Risk mood 5) Equities bridge. The last card only makes sense after the first four.',
        '1) Ставки 2) Инфляция 3) Доллар 4) Настроение 5) Мост к акциям. Пятая карточка имеет смысл только после первых четырёх.',
        '1) Tasas 2) Inflación 3) Dólar 4) Ánimo 5) Puente a acciones. La quinta solo tiene sentido tras las cuatro primeras.',
        '1) Taxas 2) Inflação 3) Dólar 4) Humor 5) Ponte para ações. O quinto só faz sentido após os quatro primeiros.',
      ),
      takeaway: L(
        'Don’t jump to equities first.',
        'Не прыгай сразу к акциям.',
        'No saltes primero a acciones.',
        'Não pule primeiro para ações.',
      ),
    ),
    GuideLesson(
      id: 'archive_habit',
      title: L('Use the archive', 'Пользуйся архивом', 'Usa el archivo', 'Use o arquivo'),
      body: L(
        'Comparing yesterday vs today trains pattern recognition: did mood flip, or is it noise? The archive exists for habit, not nostalgia.',
        'Сравнение вчера/сегодня тренирует паттерны: настроение сменилось или это шум? Архив — для привычки, не для ностальгии.',
        'Comparar ayer vs hoy entrena patrones: ¿cambió el ánimo o es ruido? El archivo es para hábito, no nostalgia.',
        'Comparar ontem vs hoje treina padrões: o humor mudou ou é ruído? O arquivo é para hábito, não nostalgia.',
      ),
      takeaway: L(
        'Once a week, skim 5 prior days.',
        'Раз в неделю пробеги 5 прошлых дней.',
        'Una vez por semana, revisa 5 días previos.',
        'Uma vez por semana, passe 5 dias anteriores.',
      ),
    ),
    GuideLesson(
      id: 'community',
      title: L(
        'Discuss in Desk Club',
        'Обсуждай в Desk Club',
        'Discute en Desk Club',
        'Discuta no Desk Club',
      ),
      body: L(
        'Bring process questions to the EN community — not “guaranteed setups”. Pair with Paper League (practice) and Structure Radar (structure literacy).',
        'Неси в EN-сообщество вопросы процесса — не «гарантированные сетапы». Рядом Paper League (практика) и Structure Radar (структура).',
        'Lleva preguntas de proceso a la comunidad EN — no “setups garantizados”. Combina con Paper League (práctica) y Structure Radar (estructura).',
        'Leve perguntas de processo à comunidade EN — não “setups garantidos”. Combine com Paper League (prática) e Structure Radar (estrutura).',
      ),
      takeaway: L(
        'Apps → Community → Academy.',
        'Приложения → Сообщество → Академия.',
        'Apps → Comunidad → Academia.',
        'Apps → Comunidade → Academia.',
      ),
    ),
    GuideLesson(
      id: 'demo_data',
      title: L(
        'About WEB demo data',
        'Про данные веб-демо',
        'Sobre los datos del demo WEB',
        'Sobre os dados do demo WEB',
      ),
      body: L(
        'This GitHub Pages build ships a curated educational snapshot. It is not a live Bloomberg/terminal feed. Treat numbers as teaching props.',
        'Сборка на GitHub Pages несёт учебный снимок. Это не живой терминал. Цифры — реквизит для обучения.',
        'Este build de GitHub Pages trae una muestra educativa. No es un feed terminal en vivo. Trata los números como material didáctico.',
        'Este build do GitHub Pages traz uma amostra educativa. Não é um feed de terminal ao vivo. Trate os números como material didático.',
      ),
      takeaway: L(
        'Learn the language first; live feeds can come later.',
        'Сначала язык; живые фиды — позже.',
        'Aprende el lenguaje primero; feeds en vivo pueden venir después.',
        'Aprenda a linguagem primeiro; feeds ao vivo podem vir depois.',
      ),
    ),
  ];
}
