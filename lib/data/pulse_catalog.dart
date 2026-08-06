import '../models/models.dart';

/// Curated educational snapshot pack (not live market data).
class PulseCatalog {
  static const stamp = 'WEB · r1';
  static const demoAsOf = '2026-08-06';

  static List<PulseDay> get days {
    final today = _today;
    final archive = _buildArchive(today.cards);
    return [today, ...archive];
  }

  static PulseDay get today => days.first;

  static PulseDay? byDate(String iso) {
    for (final d in days) {
      if (d.dateIso == iso) return d;
    }
    return null;
  }

  static final PulseDay _today = PulseDay(
    dateIso: '2026-08-06',
    summary: const LocalizedText(
      en: 'Rates steady · inflation cooling slowly · dollar firm · cautious risk mood.',
      ru: 'Ставки стабильны · инфляция остывает медленно · доллар крепкий · осторожное настроение.',
    ),
    cards: const [
      PulseCard(
        kind: PulseCardKind.rates,
        headline: LocalizedText(en: 'Policy rates', ru: 'Ключевые ставки'),
        valueLabel: LocalizedText(
          en: 'Fed funds ~ hold · market prices few cuts near-term',
          ru: 'ФРС ≈ пауза · рынок ждёт мало снижений вблизи',
        ),
        plainMeaning: LocalizedText(
          en: 'Money is still relatively expensive. Borrowing costs stay high for households and companies.',
          ru: 'Деньги всё ещё относительно дорогие. Кредиты для людей и компаний остаются дорогими.',
        ),
        forEquities: LocalizedText(
          en: 'Long-duration growth names stay sensitive; banks can benefit from higher net interest — with credit-risk caveats.',
          ru: 'Длинные «growth»-истории чувствительны; банкам может помогать маржа — но с оглядкой на кредитный риск.',
        ),
        whyItMatters: LocalizedText(
          en: 'The rate level sets the discount rate for future cash flows and the hurdle for risk assets.',
          ru: 'Уровень ставки задаёт «дисконт» будущих денежных потоков и планку для рисковых активов.',
        ),
        commonMistake: LocalizedText(
          en: 'Treating every speech as an immediate trade signal instead of a slow regime.',
          ru: 'Читать каждую речь как сигнал к сделке вместо медленного режима.',
        ),
        glossaryIds: ['policy_rate', 'duration', 'tight_money'],
      ),
      PulseCard(
        kind: PulseCardKind.inflation,
        headline: LocalizedText(en: 'Inflation print', ru: 'Инфляция'),
        valueLabel: LocalizedText(
          en: 'CPI trend: gradual cool · services sticky',
          ru: 'ИПЦ: медленное охлаждение · услуги липкие',
        ),
        plainMeaning: LocalizedText(
          en: 'Prices are rising slower than the peak, but not “done”. Services inflation cools last.',
          ru: 'Цены растут медленнее пика, но «ещё не конец». Услуги остывают последними.',
        ),
        forEquities: LocalizedText(
          en: 'Sticky inflation keeps policy tight longer — pressure on highly valued growth; some pricing-power sectors cope better.',
          ru: 'Липкая инфляция держит жёсткую политику дольше — давление на дорогой growth; сектора с ценовой силой держатся лучше.',
        ),
        whyItMatters: LocalizedText(
          en: 'Inflation path decides how long expensive money lasts.',
          ru: 'Траектория инфляции решает, как долго деньги останутся дорогими.',
        ),
        commonMistake: LocalizedText(
          en: 'One soft print = “cuts tomorrow”. Macro moves in sequences, not single headlines.',
          ru: 'Один мягкий отчёт = «завтра снизят». Макро ходит сериями, не одним заголовком.',
        ),
        glossaryIds: ['cpi', 'sticky_inflation', 'real_yield'],
      ),
      PulseCard(
        kind: PulseCardKind.dollar,
        headline: LocalizedText(en: 'US dollar', ru: 'Доллар США'),
        valueLabel: LocalizedText(
          en: 'DXY firm · funding still tight-ish globally',
          ru: 'Индекс доллара крепкий · глобальное финансирование всё ещё тугое',
        ),
        plainMeaning: LocalizedText(
          en: 'A strong dollar makes global dollar debt heavier and can pull liquidity from risk assets abroad.',
          ru: 'Сильный доллар утяжеляет долларовые долги в мире и может вытягивать ликвидность из риска за рубежом.',
        ),
        forEquities: LocalizedText(
          en: 'Often headwind for EM equities and some commodities; US large-cap exporters can feel FX translation effects.',
          ru: 'Часто встречный ветер для акций emerging и части сырья; у экспортёров США — эффект перевода валюты.',
        ),
        whyItMatters: LocalizedText(
          en: 'Dollar strength is a global liquidity channel, not just a currency chart.',
          ru: 'Сила доллара — канал глобальной ликвидности, а не просто график валюты.',
        ),
        commonMistake: LocalizedText(
          en: 'Ignoring USD when reading “local” equity stories that still fund in dollars.',
          ru: 'Игнорировать USD, читая «локальные» акции, которые всё равно живут в долларовом финансировании.',
        ),
        glossaryIds: ['dxy', 'liquidity', 'em_risk'],
      ),
      PulseCard(
        kind: PulseCardKind.mood,
        headline: LocalizedText(en: 'Risk mood', ru: 'Настроение риска'),
        valueLabel: LocalizedText(
          en: 'Cautious · prefer quality over chase',
          ru: 'Осторожно · качество важнее погони',
        ),
        plainMeaning: LocalizedText(
          en: 'Markets are open to risk selectively, not in “everything rallies” mode.',
          ru: 'Рынок готов к риску выборочно, а не в режиме «растёт всё подряд».',
        ),
        forEquities: LocalizedText(
          en: 'Leadership often narrows to quality / cash-flow stories; speculative beta can lag.',
          ru: 'Лидерство часто сужается к качеству и денежному потоку; спекулятивная бета отстаёт.',
        ),
        whyItMatters: LocalizedText(
          en: 'Mood decides whether good news is bought or sold — same print, different reaction.',
          ru: 'Настроение решает: хорошие новости покупают или продают — тот же отчёт, разная реакция.',
        ),
        commonMistake: LocalizedText(
          en: 'Forcing the same playbook every day regardless of risk appetite.',
          ru: 'Тащить один и тот же плейбук каждый день без учёта аппетита к риску.',
        ),
        glossaryIds: ['risk_on', 'risk_off', 'liquidity'],
      ),
      PulseCard(
        kind: PulseCardKind.equities,
        headline: LocalizedText(en: 'Equity context', ru: 'Контекст для акций'),
        valueLabel: LocalizedText(
          en: 'Prefer resilience · watch duration & funding',
          ru: 'Упор на устойчивость · следи за duration и финансированием',
        ),
        plainMeaning: LocalizedText(
          en: 'Today’s weather favors reading which equity styles usually breathe in firm-dollar + sticky-inflation backdrops.',
          ru: 'Сегодняшняя погода: смотри, какие стили акций обычно дышат при крепком долларе и липкой инфляции.',
        ),
        forEquities: LocalizedText(
          en: 'Educational map only: quality / cash generators often relative winners; high-duration speculative growth more fragile until cuts are clearer.',
          ru: 'Только учебная карта: качество и генераторы кэша часто относительно сильнее; длинный спекулятивный growth хрупче, пока снижения ставок неясны.',
        ),
        whyItMatters: LocalizedText(
          en: 'This card is the bridge from macro weather → equity context — still not a buy list.',
          ru: 'Эта карточка — мост от макро-погоды к контексту акций — всё ещё не список покупок.',
        ),
        commonMistake: LocalizedText(
          en: 'Turning the morning brief into five ticker tips.',
          ru: 'Превращать утренний брифинг в пять тикеров «что купить».',
        ),
        glossaryIds: ['duration', 'quality_factor', 'sector_sensitivity'],
      ),
    ],
  );

  static List<PulseDay> _buildArchive(List<PulseCard> base) {
    PulseCard patch(PulseCard c, LocalizedText v) => PulseCard(
          kind: c.kind,
          headline: c.headline,
          valueLabel: v,
          plainMeaning: c.plainMeaning,
          forEquities: c.forEquities,
          whyItMatters: c.whyItMatters,
          commonMistake: c.commonMistake,
          glossaryIds: c.glossaryIds,
        );

    List<PulseCard> weather({
      required LocalizedText rates,
      required LocalizedText inflation,
      required LocalizedText dollar,
      required LocalizedText mood,
      required LocalizedText equities,
    }) =>
        [
          patch(base[0], rates),
          patch(base[1], inflation),
          patch(base[2], dollar),
          patch(base[3], mood),
          patch(base[4], equities),
        ];

    return [
      PulseDay(
        dateIso: '2026-08-05',
        summary: const LocalizedText(
          en: 'Soft risk tone · dollar bid · inflation wait mode.',
          ru: 'Мягкий тон риска · доллар в спросе · режим ожидания инфляции.',
        ),
        cards: weather(
          rates: const LocalizedText(en: 'Hold bias intact', ru: 'Пауза сохраняется'),
          inflation: const LocalizedText(en: 'Awaiting next print', ru: 'Ждём следующий отчёт'),
          dollar: const LocalizedText(en: 'Bid remains', ru: 'Спрос сохраняется'),
          mood: const LocalizedText(en: 'Soft defensive tilt', ru: 'Мягкий защитный уклон'),
          equities: const LocalizedText(en: 'Quality over beta', ru: 'Качество важнее беты'),
        ),
      ),
      PulseDay(
        dateIso: '2026-08-04',
        summary: const LocalizedText(
          en: 'Mild risk-on attempt · rates calm · watch follow-through.',
          ru: 'Слабая попытка risk-on · ставки спокойны · смотри закрепление.',
        ),
        cards: weather(
          rates: const LocalizedText(en: 'Calm front-end', ru: 'Спокойный короткий конец'),
          inflation: const LocalizedText(en: 'No new surprise', ru: 'Без нового сюрприза'),
          dollar: const LocalizedText(en: 'Slightly softer', ru: 'Чуть мягче'),
          mood: const LocalizedText(en: 'Tentative risk-on', ru: 'Осторожный risk-on'),
          equities: const LocalizedText(en: 'Cyclicals probe higher', ru: 'Циклика пробует рост'),
        ),
      ),
      PulseDay(
        dateIso: '2026-08-03',
        summary: const LocalizedText(
          en: 'Weekend decay mindset · thinner conviction.',
          ru: 'Выходной режим · меньше убеждённости.',
        ),
        cards: weather(
          rates: const LocalizedText(en: 'Quiet tape', ru: 'Тихая лента'),
          inflation: const LocalizedText(en: 'Unchanged narrative', ru: 'Нарратив без смены'),
          dollar: const LocalizedText(en: 'Range-bound', ru: 'В диапазоне'),
          mood: const LocalizedText(en: 'Low engagement', ru: 'Низкая вовлечённость'),
          equities: const LocalizedText(en: 'Liquidity thin', ru: 'Тонкая ликвидность'),
        ),
      ),
      PulseDay(
        dateIso: '2026-08-02',
        summary: const LocalizedText(
          en: 'Payrolls week hangover · volatility memory.',
          ru: 'После недели занятости · память о волатильности.',
        ),
        cards: weather(
          rates: const LocalizedText(en: 'Path re-priced modestly', ru: 'Траектория чуть переоценена'),
          inflation: const LocalizedText(en: 'Labor → inflation link watched', ru: 'Связка труд→инфляция в фокусе'),
          dollar: const LocalizedText(en: 'Mixed', ru: 'Смешанно'),
          mood: const LocalizedText(en: 'Digesting data', ru: 'Переваривают данные'),
          equities: const LocalizedText(en: 'Index heavyweights decide tape', ru: 'Тяжеловесы индекса задают тон'),
        ),
      ),
      PulseDay(
        dateIso: '2026-08-01',
        summary: const LocalizedText(
          en: 'Month open · positioning reset chatter.',
          ru: 'Открытие месяца · разговоры о сбросе позиций.',
        ),
        cards: weather(
          rates: const LocalizedText(en: 'Stable', ru: 'Стабильно'),
          inflation: const LocalizedText(en: 'Sticky services theme', ru: 'Тема липких услуг'),
          dollar: const LocalizedText(en: 'Supported', ru: 'С поддержкой'),
          mood: const LocalizedText(en: 'Neutral-cautious', ru: 'Нейтрально-осторожно'),
          equities: const LocalizedText(en: 'Breadth still uneven', ru: 'Ширина рынка неровная'),
        ),
      ),
      PulseDay(
        dateIso: '2026-07-31',
        summary: const LocalizedText(
          en: 'Month-end flows · noise ≠ regime change.',
          ru: 'Потоки конца месяца · шум ≠ смена режима.',
        ),
        cards: weather(
          rates: const LocalizedText(en: 'Range', ru: 'Диапазон'),
          inflation: const LocalizedText(en: 'Unchanged', ru: 'Без изменений'),
          dollar: const LocalizedText(en: 'Firm', ru: 'Крепкий'),
          mood: const LocalizedText(en: 'Flow-driven', ru: 'Движет потоками'),
          equities: const LocalizedText(en: 'Ignore one-day drama', ru: 'Не раздувай однодневную драму'),
        ),
      ),
      PulseDay(
        dateIso: '2026-07-30',
        summary: const LocalizedText(
          en: 'Central-bank speakers · window of uncertainty.',
          ru: 'Речи центробанков · окно неопределённости.',
        ),
        cards: weather(
          rates: const LocalizedText(en: 'Speech risk elevated', ru: 'Риск речей повышен'),
          inflation: const LocalizedText(en: 'Data silence', ru: 'Пауза в данных'),
          dollar: const LocalizedText(en: 'Reactive', ru: 'Реактивный'),
          mood: const LocalizedText(en: 'Headline sensitive', ru: 'Чувствительно к заголовкам'),
          equities: const LocalizedText(en: 'Size risk carefully', ru: 'Аккуратно с размером риска'),
        ),
      ),
      PulseDay(
        dateIso: '2026-07-29',
        summary: const LocalizedText(
          en: 'Soft landing narrative intact · not guaranteed.',
          ru: 'Нарратив мягкой посадки жив · не гарантия.',
        ),
        cards: weather(
          rates: const LocalizedText(en: 'Cut hopes alive', ru: 'Надежды на снижение живы'),
          inflation: const LocalizedText(en: 'Cooling path assumed', ru: 'Заложено охлаждение'),
          dollar: const LocalizedText(en: 'Mildly softer bias', ru: 'Слегка мягче'),
          mood: const LocalizedText(en: 'Constructive', ru: 'Конструктивно'),
          equities: const LocalizedText(en: 'Growth finds buyers on dips', ru: 'Growth находят на откатах'),
        ),
      ),
      PulseDay(
        dateIso: '2026-07-28',
        summary: const LocalizedText(
          en: 'Earnings-heavy tape · macro secondary for a day.',
          ru: 'День отчётов · макро на втором плане.',
        ),
        cards: weather(
          rates: const LocalizedText(en: 'Background only', ru: 'Только фон'),
          inflation: const LocalizedText(en: 'Background only', ru: 'Только фон'),
          dollar: const LocalizedText(en: 'Quiet', ru: 'Тихо'),
          mood: const LocalizedText(en: 'Stock-specific', ru: 'Истории отдельных акций'),
          equities: const LocalizedText(en: 'Separate stock from weather', ru: 'Отделяй акцию от погоды'),
        ),
      ),
      PulseDay(
        dateIso: '2026-07-27',
        summary: const LocalizedText(
          en: 'Risk appetite improved briefly · verify persistence.',
          ru: 'Аппетит к риску кратко вырос · проверь устойчивость.',
        ),
        cards: weather(
          rates: const LocalizedText(en: 'Benign', ru: 'Спокойно'),
          inflation: const LocalizedText(en: 'Benign', ru: 'Спокойно'),
          dollar: const LocalizedText(en: 'Softer', ru: 'Мягче'),
          mood: const LocalizedText(en: 'Risk-on probe', ru: 'Проба risk-on'),
          equities: const LocalizedText(en: 'Beta works until it doesn’t', ru: 'Бета работает — пока не сломается'),
        ),
      ),
      PulseDay(
        dateIso: '2026-07-26',
        summary: const LocalizedText(
          en: 'Weekend ahead · reduce narrative overload.',
          ru: 'Перед выходными · меньше нарративной перегрузки.',
        ),
        cards: weather(
          rates: const LocalizedText(en: 'Steady', ru: 'Ровно'),
          inflation: const LocalizedText(en: 'Steady', ru: 'Ровно'),
          dollar: const LocalizedText(en: 'Steady', ru: 'Ровно'),
          mood: const LocalizedText(en: 'Fade the noise', ru: 'Отфильтруй шум'),
          equities: const LocalizedText(en: 'Plan the week, don’t invent trades', ru: 'Планируй неделю, не выдумывай сделки'),
        ),
      ),
      PulseDay(
        dateIso: '2026-07-25',
        summary: const LocalizedText(
          en: 'Dollar bounce · EM caution reminder.',
          ru: 'Отскок доллара · напоминание об осторожности в EM.',
        ),
        cards: weather(
          rates: const LocalizedText(en: 'Supportive for USD', ru: 'В поддержку USD'),
          inflation: const LocalizedText(en: 'Unchanged', ru: 'Без изменений'),
          dollar: const LocalizedText(en: 'Bounce', ru: 'Отскок'),
          mood: const LocalizedText(en: 'Selective', ru: 'Выборочно'),
          equities: const LocalizedText(en: 'Check USD beta of your book', ru: 'Проверь долларовую бету портфеля'),
        ),
      ),
      PulseDay(
        dateIso: '2026-07-24',
        summary: const LocalizedText(
          en: 'Quiet inflation day · rates dominate narrative.',
          ru: 'Тихий день по инфляции · нарратив за ставками.',
        ),
        cards: weather(
          rates: const LocalizedText(en: 'Center stage', ru: 'В центре'),
          inflation: const LocalizedText(en: 'Secondary', ru: 'Вторично'),
          dollar: const LocalizedText(en: 'Tracks rates', ru: 'Следит за ставками'),
          mood: const LocalizedText(en: 'Rates-led', ru: 'Ведут ставки'),
          equities: const LocalizedText(en: 'Duration still the lever', ru: 'Duration всё ещё рычаг'),
        ),
      ),
    ];
  }
}
