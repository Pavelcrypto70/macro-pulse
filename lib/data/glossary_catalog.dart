import '../models/models.dart';

class GlossaryCatalog {
  static GlossaryEntry? byId(String id) {
    for (final e in entries) {
      if (e.id == id) return e;
    }
    return null;
  }

  static const entries = <GlossaryEntry>[
    GlossaryEntry(
      id: 'policy_rate',
      title: LocalizedText(en: 'Policy rate', ru: 'Ключевая ставка'),
      subtitle: LocalizedText(
        en: 'The central bank’s main interest-rate lever',
        ru: 'Главный рычаг ставки центробанка',
      ),
      body: LocalizedText(
        en: 'The policy rate is the short-term rate a central bank targets. When it rises, money tends to get more expensive across the economy.',
        ru: 'Ключевая ставка — короткий ориентир, который задаёт центробанк. Когда она растёт, деньги в экономике обычно дорожают.',
      ),
      mechanics: LocalizedText(
        en: 'Read level + direction + how long markets expect it to stay. A “hold” can still be tight if the level is high.',
        ru: 'Смотри уровень + направление + как долго рынок ждёт паузу. «Пауза» всё ещё может быть жёсткой, если уровень высокий.',
      ),
      limits: LocalizedText(
        en: 'Not a timer for equity entries. Transmission to the real economy takes time.',
        ru: 'Не таймер для входов в акции. Передача в реальную экономику занимает время.',
      ),
    ),
    GlossaryEntry(
      id: 'cpi',
      title: LocalizedText(en: 'CPI', ru: 'ИПЦ'),
      subtitle: LocalizedText(
        en: 'Consumer price index',
        ru: 'Индекс потребительских цен',
      ),
      body: LocalizedText(
        en: 'CPI tracks a basket of consumer prices. Markets watch the trend and surprises versus expectations.',
        ru: 'ИПЦ измеряет корзину потребительских цен. Рынок смотрит тренд и сюрпризы относительно ожиданий.',
      ),
      mechanics: LocalizedText(
        en: 'Separate headline vs core (ex food/energy). Services often stick longer than goods.',
        ru: 'Отделяй общий индекс и «ядро» (без еды/энергии). Услуги часто липнут дольше товаров.',
      ),
      limits: LocalizedText(
        en: 'One print is a chapter, not the whole book.',
        ru: 'Один отчёт — глава, не вся книга.',
      ),
    ),
    GlossaryEntry(
      id: 'sticky_inflation',
      title: LocalizedText(en: 'Sticky inflation', ru: 'Липкая инфляция'),
      subtitle: LocalizedText(
        en: 'Prices that cool slowly',
        ru: 'Цены, которые остывают медленно',
      ),
      body: LocalizedText(
        en: 'Sticky inflation means parts of the basket (often services/wages) refuse to fall quickly even when goods ease.',
        ru: 'Липкая инфляция — части корзины (часто услуги/зарплаты) не падают быстро, даже если товары уже мягче.',
      ),
      mechanics: LocalizedText(
        en: 'If services stay hot, policy can stay restrictive longer than soft goods data suggest.',
        ru: 'Если услуги горячие, политика может оставаться жёсткой дольше, чем подсказывают мягкие товары.',
      ),
      limits: LocalizedText(
        en: '“Sticky” is descriptive — not a trade call.',
        ru: '«Липкая» — описание, не торговый сигнал.',
      ),
    ),
    GlossaryEntry(
      id: 'dxy',
      title: LocalizedText(en: 'Dollar index (DXY)', ru: 'Индекс доллара'),
      subtitle: LocalizedText(
        en: 'Broad USD strength vs major peers',
        ru: 'Сила USD против корзины валют',
      ),
      body: LocalizedText(
        en: 'A rising dollar often tightens global financial conditions for anyone who borrows or prices in USD.',
        ru: 'Растущий доллар часто ужесточает глобальные финансовые условия для тех, кто занимает или считает в USD.',
      ),
      mechanics: LocalizedText(
        en: 'Pair dollar moves with rates and risk mood — USD is a channel, not an isolated chart.',
        ru: 'Связывай доллар со ставками и настроением риска — это канал, а не изолированный график.',
      ),
      limits: LocalizedText(
        en: 'Index level alone does not tell you which stock to buy.',
        ru: 'Уровень индекса сам по себе не говорит, какую акцию купить.',
      ),
    ),
    GlossaryEntry(
      id: 'liquidity',
      title: LocalizedText(en: 'Liquidity', ru: 'Ликвидность'),
      subtitle: LocalizedText(
        en: 'How easy money flows into risk',
        ru: 'Насколько легко деньги текут в риск',
      ),
      body: LocalizedText(
        en: 'In this app, “liquidity” means how supportive funding conditions are for risk assets — not exchange order-book depth.',
        ru: 'Здесь «ликвидность» — насколько условия финансирования дружелюбны к риску, а не глубина стакана на бирже.',
      ),
      mechanics: LocalizedText(
        en: 'Watch rates, dollar, and credit stress together.',
        ru: 'Смотри ставки, доллар и кредитный стресс вместе.',
      ),
      limits: LocalizedText(
        en: 'Macro liquidity ≠ guarantee of higher prices.',
        ru: 'Макро-ликвидность ≠ гарантия роста цен.',
      ),
    ),
    GlossaryEntry(
      id: 'risk_on',
      title: LocalizedText(en: 'Risk-on', ru: 'Риск включён'),
      subtitle: LocalizedText(
        en: 'Appetite for risk assets rises',
        ru: 'Растёт аппетит к рисковым активам',
      ),
      body: LocalizedText(
        en: 'Risk-on means investors prefer equities, credit, and cyclical stories over cash/safe havens — often temporarily.',
        ru: 'Risk-on — инвесторы предпочитают акции, кредит и циклику кэшу/защите — часто временно.',
      ),
      mechanics: LocalizedText(
        en: 'Confirm with breadth and follow-through, not one green hour.',
        ru: 'Подтверждай шириной рынка и закреплением, не одним зелёным часом.',
      ),
      limits: LocalizedText(
        en: 'Mood flips. Do not marry a label.',
        ru: 'Настроение переключается. Не женись на ярлыке.',
      ),
    ),
    GlossaryEntry(
      id: 'risk_off',
      title: LocalizedText(en: 'Risk-off', ru: 'Риск выключен'),
      subtitle: LocalizedText(
        en: 'Flight to safety / caution',
        ru: 'Бегство в защиту / осторожность',
      ),
      body: LocalizedText(
        en: 'Risk-off is a defensive posture: demand for safer assets, weaker speculative beta.',
        ru: 'Risk-off — защитная поза: спрос на более безопасное, слабее спекулятивная бета.',
      ),
      mechanics: LocalizedText(
        en: 'Often pairs with firmer dollar and softer cyclical equities.',
        ru: 'Часто рядом с крепким долларом и более слабой цикликой.',
      ),
      limits: LocalizedText(
        en: 'Not an instruction to short everything.',
        ru: 'Не инструкция шортить всё подряд.',
      ),
    ),
    GlossaryEntry(
      id: 'duration',
      title: LocalizedText(en: 'Duration', ru: 'Дюрация'),
      subtitle: LocalizedText(
        en: 'Sensitivity to interest-rate changes',
        ru: 'Чувствительность к изменению ставок',
      ),
      body: LocalizedText(
        en: 'High-duration assets (far-away cash flows) usually hurt more when rates rise and help when rates fall — in theory.',
        ru: 'Активы с высокой дюрацией (далёкие денежные потоки) обычно сильнее страдают от роста ставок и выигрывают от снижения — в теории.',
      ),
      mechanics: LocalizedText(
        en: 'Use as a style lens (growth vs cash-flow) when reading the Rates card.',
        ru: 'Используй как линзу стиля (growth vs денежный поток), читая карточку ставок.',
      ),
      limits: LocalizedText(
        en: 'Many other factors move stocks the same day.',
        ru: 'В тот же день акциями двигают и другие факторы.',
      ),
    ),
    GlossaryEntry(
      id: 'tight_money',
      title: LocalizedText(en: 'Tight money', ru: 'Жёсткие деньги'),
      subtitle: LocalizedText(
        en: 'Restrictive financial conditions',
        ru: 'Сдерживающие финансовые условия',
      ),
      body: LocalizedText(
        en: 'Tight money means policy and funding conditions restrain demand — higher rates, stronger dollar, tougher credit.',
        ru: 'Жёсткие деньги — политика и финансирование сдерживают спрос: выше ставки, крепче доллар, жёстче кредит.',
      ),
      mechanics: LocalizedText(
        en: 'Ask: is tightness rising, stable, or easing — not only “are rates high?”',
        ru: 'Спроси: жёсткость растёт, стабильна или смягчается — не только «ставки высокие?».',
      ),
      limits: LocalizedText(
        en: 'Historical sector maps are educational, not forecasts.',
        ru: 'Исторические карты секторов — обучение, не прогноз.',
      ),
    ),
    GlossaryEntry(
      id: 'real_yield',
      title: LocalizedText(en: 'Real yield', ru: 'Реальная доходность'),
      subtitle: LocalizedText(
        en: 'Yield after inflation',
        ru: 'Доходность с поправкой на инфляцию',
      ),
      body: LocalizedText(
        en: 'Real yields approximate how rewarding safe rates are after inflation. Rising real yields can compete with risk assets.',
        ru: 'Реальные доходности показывают, насколько привлекательны «безопасные» ставки после инфляции. Рост может конкурировать с риском.',
      ),
      mechanics: LocalizedText(
        en: 'Combine with the Inflation and Rates cards — not a standalone signal.',
        ru: 'Связывай с карточками инфляции и ставок — не отдельный сигнал.',
      ),
      limits: LocalizedText(
        en: 'Measures differ (breakevens, TIPS). Treat as a concept first.',
        ru: 'Методики различаются. Сначала освой понятие.',
      ),
    ),
    GlossaryEntry(
      id: 'em_risk',
      title: LocalizedText(en: 'EM risk', ru: 'Риск emerging'),
      subtitle: LocalizedText(
        en: 'Emerging-market sensitivity to USD/funding',
        ru: 'Чувствительность emerging к доллару и финансированию',
      ),
      body: LocalizedText(
        en: 'Many EM assets feel a strong dollar and tight USD funding quickly through currency and capital-flow channels.',
        ru: 'Многие активы emerging быстро чувствуют сильный доллар и тугое USD-финансирование через валюту и потоки капитала.',
      ),
      mechanics: LocalizedText(
        en: 'When the Dollar card is firm, raise your caution bar for USD-sensitive EM stories.',
        ru: 'Когда карточка доллара крепкая — повышай планку осторожности к USD-чувствительным историям EM.',
      ),
      limits: LocalizedText(
        en: 'EM is not one trade. Countries differ.',
        ru: 'EM — не одна сделка. Страны разные.',
      ),
    ),
    GlossaryEntry(
      id: 'quality_factor',
      title: LocalizedText(en: 'Quality factor', ru: 'Фактор качества'),
      subtitle: LocalizedText(
        en: 'Preference for stronger balance sheets / earnings',
        ru: 'Предпочтение более сильным балансам / прибыли',
      ),
      body: LocalizedText(
        en: 'In cautious moods, markets often prefer profitable, less-levered companies over fragile speculative stories.',
        ru: 'В осторожном настроении рынок часто предпочитает прибыльные, менее закредитованные компании хрупким спекуляциям.',
      ),
      mechanics: LocalizedText(
        en: 'Use as a relative lens when Risk mood is cautious — not a shopping list.',
        ru: 'Как относительная линза при осторожном настроении — не список покупок.',
      ),
      limits: LocalizedText(
        en: 'Quality can underperform in strong risk-on squeezes.',
        ru: 'Качество может отставать в сильных risk-on сжатиях.',
      ),
    ),
    GlossaryEntry(
      id: 'sector_sensitivity',
      title: LocalizedText(en: 'Sector sensitivity', ru: 'Чувствительность секторов'),
      subtitle: LocalizedText(
        en: 'How equity groups historically react to macro weather',
        ru: 'Как группы акций historically реагируют на макро-погоду',
      ),
      body: LocalizedText(
        en: 'Different sectors breathe differently under tight money, strong dollar, or sticky inflation. Maps are historical education.',
        ru: 'Разные сектора по-разному дышат при жёстких деньгах, сильном долларе или липкой инфляции. Карты — историческое обучение.',
      ),
      mechanics: LocalizedText(
        en: 'Read the Equities card as context, then verify with your own process.',
        ru: 'Читай карточку «Для акций» как контекст, затем проверяй своим процессом.',
      ),
      limits: LocalizedText(
        en: 'Past sensitivity ≠ future performance.',
        ru: 'Прошлая чувствительность ≠ будущая доходность.',
      ),
    ),
  ];
}
