import '../models/models.dart';

class GlossaryCatalog {
  static GlossaryEntry? byId(String id) {
    for (final e in entries) {
      if (e.id == id) return e;
    }
    return null;
  }

  static final entries = <GlossaryEntry>[
    GlossaryEntry(
      id: 'policy_rate',
      title: L('Policy rate', 'Ключевая ставка', 'Tasa de política', 'Taxa de política'),
      subtitle: L(
        'The central bank’s main interest-rate lever',
        'Главный рычаг ставки центробанка',
        'La palanca principal de tasas del banco central',
        'A alavanca principal de juros do banco central',
      ),
      body: L(
        'The policy rate is the short-term rate a central bank targets. When it rises, money tends to get more expensive across the economy.',
        'Ключевая ставка — короткий ориентир, который задаёт центробанк. Когда она растёт, деньги в экономике обычно дорожают.',
        'La tasa de política es la tasa corta que fija el banco central. Si sube, el dinero suele encarecerse en la economía.',
        'A taxa de política é a taxa curta que o banco central fixa. Se sobe, o dinheiro tende a ficar mais caro na economia.',
      ),
      mechanics: L(
        'Read level + direction + how long markets expect it to stay. A “hold” can still be tight if the level is high.',
        'Смотри уровень + направление + как долго рынок ждёт паузу. «Пауза» всё ещё может быть жёсткой, если уровень высокий.',
        'Mira nivel + dirección + cuánto tiempo espera el mercado. Una “pausa” aún puede ser restrictiva si el nivel es alto.',
        'Veja nível + direção + quanto tempo o mercado espera. Uma “pausa” ainda pode ser restritiva se o nível for alto.',
      ),
      limits: L(
        'Not a timer for equity entries. Transmission to the real economy takes time.',
        'Не таймер для входов в акции. Передача в реальную экономику занимает время.',
        'No es un temporizador de entradas en acciones. La transmisión a la economía real toma tiempo.',
        'Não é um timer de entradas em ações. A transmissão à economia real leva tempo.',
      ),
    ),
    GlossaryEntry(
      id: 'cpi',
      title: L('CPI', 'ИПЦ', 'IPC', 'IPC'),
      subtitle: L('Consumer price index', 'Индекс потребительских цен', 'Índice de precios al consumidor', 'Índice de preços ao consumidor'),
      body: L(
        'CPI tracks a basket of consumer prices. Markets watch the trend and surprises versus expectations.',
        'ИПЦ измеряет корзину потребительских цен. Рынок смотрит тренд и сюрпризы относительно ожиданий.',
        'El IPC mide una canasta de precios al consumidor. El mercado mira tendencia y sorpresas vs expectativas.',
        'O IPC mede uma cesta de preços ao consumidor. O mercado olha tendência e surpresas vs expectativas.',
      ),
      mechanics: L(
        'Separate headline vs core (ex food/energy). Services often stick longer than goods.',
        'Отделяй общий индекс и «ядро» (без еды/энергии). Услуги часто липнут дольше товаров.',
        'Separa general vs núcleo (sin alimentos/energía). Servicios suelen pegarse más que bienes.',
        'Separe cheio vs núcleo (sem alimentos/energia). Serviços costumam grudar mais que bens.',
      ),
      limits: L(
        'One print is a chapter, not the whole book.',
        'Один отчёт — глава, не вся книга.',
        'Un dato es un capítulo, no todo el libro.',
        'Um dado é um capítulo, não o livro inteiro.',
      ),
    ),
    GlossaryEntry(
      id: 'sticky_inflation',
      title: L('Sticky inflation', 'Липкая инфляция', 'Inflación pegajosa', 'Inflação pegajosa'),
      subtitle: L('Prices that cool slowly', 'Цены, которые остывают медленно', 'Precios que se enfrían lento', 'Preços que esfriam devagar'),
      body: L(
        'Sticky inflation means parts of the basket (often services/wages) refuse to fall quickly even when goods ease.',
        'Липкая инфляция — части корзины (часто услуги/зарплаты) не падают быстро, даже если товары уже мягче.',
        'Inflación pegajosa: partes de la canasta (a menudo servicios/salarios) no bajan rápido aunque los bienes se suavicen.',
        'Inflação pegajosa: partes da cesta (muitas vezes serviços/salários) não caem rápido mesmo se bens suavizam.',
      ),
      mechanics: L(
        'If services stay hot, policy can stay restrictive longer than soft goods data suggest.',
        'Если услуги горячие, политика может оставаться жёсткой дольше, чем подсказывают мягкие товары.',
        'Si servicios siguen calientes, la política puede seguir restrictiva más de lo que sugieren bienes suaves.',
        'Se serviços seguem quentes, a política pode ficar restritiva além do que bens suaves sugerem.',
      ),
      limits: L(
        '“Sticky” is descriptive — not a trade call.',
        '«Липкая» — описание, не торговый сигнал.',
        '“Pegajosa” es descriptivo — no una llamada de trade.',
        '“Pegajosa” é descritivo — não é chamada de trade.',
      ),
    ),
    GlossaryEntry(
      id: 'dxy',
      title: L('Dollar index (DXY)', 'Индекс доллара', 'Índice del dólar (DXY)', 'Índice do dólar (DXY)'),
      subtitle: L('Broad USD strength vs major peers', 'Сила USD против корзины валют', 'Fuerza amplia del USD vs pares', 'Força ampla do USD vs pares'),
      body: L(
        'A rising dollar often tightens global financial conditions for anyone who borrows or prices in USD.',
        'Растущий доллар часто ужесточает глобальные финансовые условия для тех, кто занимает или считает в USD.',
        'Un dólar al alza suele endurecer condiciones financieras globales para quien se endeuda o cotiza en USD.',
        'Um dólar em alta costuma apertar condições financeiras globais para quem se endivida ou precifica em USD.',
      ),
      mechanics: L(
        'Pair dollar moves with rates and risk mood — USD is a channel, not an isolated chart.',
        'Связывай доллар со ставками и настроением риска — это канал, а не изолированный график.',
        'Combina el dólar con tasas y ánimo de riesgo — el USD es un canal, no un gráfico aislado.',
        'Combine o dólar com taxas e humor de risco — o USD é um canal, não um gráfico isolado.',
      ),
      limits: L(
        'Index level alone does not tell you which stock to buy.',
        'Уровень индекса сам по себе не говорит, какую акцию купить.',
        'El nivel del índice solo no dice qué acción comprar.',
        'O nível do índice sozinho não diz qual ação comprar.',
      ),
    ),
    GlossaryEntry(
      id: 'liquidity',
      title: L('Liquidity', 'Ликвидность', 'Liquidez', 'Liquidez'),
      subtitle: L('How easy money flows into risk', 'Насколько легко деньги текут в риск', 'Qué tan fácil fluye el dinero al riesgo', 'Quão fácil o dinheiro flui ao risco'),
      body: L(
        'In this app, “liquidity” means how supportive funding conditions are for risk assets — not exchange order-book depth.',
        'Здесь «ликвидность» — насколько условия финансирования дружелюбны к риску, а не глубина стакана на бирже.',
        'Aquí “liquidez” significa qué tan amigables son las condiciones de funding al riesgo — no la profundidad del libro.',
        'Aqui “liquidez” significa quão amigáveis são as condições de funding ao risco — não a profundidade do book.',
      ),
      mechanics: L(
        'Watch rates, dollar, and credit stress together.',
        'Смотри ставки, доллар и кредитный стресс вместе.',
        'Mira tasas, dólar y estrés crediticio juntos.',
        'Olhe taxas, dólar e estresse de crédito juntos.',
      ),
      limits: L(
        'Macro liquidity ≠ guarantee of higher prices.',
        'Макро-ликвидность ≠ гарантия роста цен.',
        'Liquidez macro ≠ garantía de precios más altos.',
        'Liquidez macro ≠ garantia de preços mais altos.',
      ),
    ),
    GlossaryEntry(
      id: 'risk_on',
      title: L('Risk-on', 'Риск включён', 'Risk-on', 'Risk-on'),
      subtitle: L('Appetite for risk assets rises', 'Растёт аппетит к рисковым активам', 'Sube el apetito por activos de riesgo', 'Sobe o apetite por ativos de risco'),
      body: L(
        'Risk-on means investors prefer equities, credit, and cyclical stories over cash/safe havens — often temporarily.',
        'Risk-on — инвесторы предпочитают акции, кредит и циклику кэшу/защите — часто временно.',
        'Risk-on: los inversores prefieren acciones, crédito y cíclicos frente a efectivo/refugio — a menudo temporal.',
        'Risk-on: investidores preferem ações, crédito e cíclicos diante de caixa/refúgio — muitas vezes temporário.',
      ),
      mechanics: L(
        'Confirm with breadth and follow-through, not one green hour.',
        'Подтверждай шириной рынка и закреплением, не одним зелёным часом.',
        'Confirma con amplitud y seguimiento, no con una hora verde.',
        'Confirme com amplitude e continuidade, não com uma hora verde.',
      ),
      limits: L(
        'Mood flips. Do not marry a label.',
        'Настроение переключается. Не женись на ярлыке.',
        'El ánimo cambia. No te cases con una etiqueta.',
        'O humor muda. Não case com um rótulo.',
      ),
    ),
    GlossaryEntry(
      id: 'risk_off',
      title: L('Risk-off', 'Риск выключен', 'Risk-off', 'Risk-off'),
      subtitle: L('Flight to safety / caution', 'Бегство в защиту / осторожность', 'Huida a la seguridad / cautela', 'Fuga para segurança / cautela'),
      body: L(
        'Risk-off is a defensive posture: demand for safer assets, weaker speculative beta.',
        'Risk-off — защитная поза: спрос на более безопасное, слабее спекулятивная бета.',
        'Risk-off es postura defensiva: demanda de activos más seguros, beta especulativa más débil.',
        'Risk-off é postura defensiva: demanda por ativos mais seguros, beta especulativa mais fraca.',
      ),
      mechanics: L(
        'Often pairs with firmer dollar and softer cyclical equities.',
        'Часто рядом с крепким долларом и более слабой цикликой.',
        'A menudo va con dólar más firme y cíclicos más suaves.',
        'Muitas vezes vem com dólar mais firme e cíclicos mais fracos.',
      ),
      limits: L(
        'Not an instruction to short everything.',
        'Не инструкция шортить всё подряд.',
        'No es instrucción de short a todo.',
        'Não é instrução de short em tudo.',
      ),
    ),
    GlossaryEntry(
      id: 'duration',
      title: L('Duration', 'Дюрация', 'Duration', 'Duration'),
      subtitle: L('Sensitivity to interest-rate changes', 'Чувствительность к изменению ставок', 'Sensibilidad a cambios de tasas', 'Sensibilidade a mudanças de juros'),
      body: L(
        'High-duration assets (far-away cash flows) usually hurt more when rates rise and help when rates fall — in theory.',
        'Активы с высокой дюрацией (далёкие денежные потоки) обычно сильнее страдают от роста ставок и выигрывают от снижения — в теории.',
        'Activos de alta duration (flujos lejanos) suelen sufrir más si suben tasas y ayudar si bajan — en teoría.',
        'Ativos de alta duration (fluxos distantes) costumam sofrer mais se juros sobem e ajudar se caem — em teoria.',
      ),
      mechanics: L(
        'Use as a style lens (growth vs cash-flow) when reading the Rates card.',
        'Используй как линзу стиля (growth vs денежный поток), читая карточку ставок.',
        'Úsalo como lente de estilo (growth vs flujo de caja) al leer la tarjeta de tasas.',
        'Use como lente de estilo (growth vs fluxo de caixa) ao ler o cartão de taxas.',
      ),
      limits: L(
        'Many other factors move stocks the same day.',
        'В тот же день акциями двигают и другие факторы.',
        'Muchos otros factores mueven acciones el mismo día.',
        'Muitos outros fatores movem ações no mesmo dia.',
      ),
    ),
    GlossaryEntry(
      id: 'tight_money',
      title: L('Tight money', 'Жёсткие деньги', 'Dinero restrictivo', 'Dinheiro restritivo'),
      subtitle: L('Restrictive financial conditions', 'Сдерживающие финансовые условия', 'Condiciones financieras restrictivas', 'Condições financeiras restritivas'),
      body: L(
        'Tight money means policy and funding conditions restrain demand — higher rates, stronger dollar, tougher credit.',
        'Жёсткие деньги — политика и финансирование сдерживают спрос: выше ставки, крепче доллар, жёстче кредит.',
        'Dinero restrictivo: política y funding frenan la demanda — tasas altas, dólar fuerte, crédito más duro.',
        'Dinheiro restritivo: política e funding freiam a demanda — juros altos, dólar forte, crédito mais duro.',
      ),
      mechanics: L(
        'Ask: is tightness rising, stable, or easing — not only “are rates high?”',
        'Спроси: жёсткость растёт, стабильна или смягчается — не только «ставки высокие?».',
        'Pregunta: ¿la restricción sube, es estable o se suaviza — no solo “¿tasas altas?”',
        'Pergunte: a restrição sobe, está estável ou suaviza — não só “juros altos?”',
      ),
      limits: L(
        'Historical sector maps are educational, not forecasts.',
        'Исторические карты секторов — обучение, не прогноз.',
        'Los mapas sectoriales históricos son educativos, no pronósticos.',
        'Mapas setoriais históricos são educativos, não previsões.',
      ),
    ),
    GlossaryEntry(
      id: 'real_yield',
      title: L('Real yield', 'Реальная доходность', 'Rendimiento real', 'Yield real'),
      subtitle: L('Yield after inflation', 'Доходность с поправкой на инфляцию', 'Rendimiento tras inflación', 'Yield após inflação'),
      body: L(
        'Real yields approximate how rewarding safe rates are after inflation. Rising real yields can compete with risk assets.',
        'Реальные доходности показывают, насколько привлекательны «безопасные» ставки после инфляции. Рост может конкурировать с риском.',
        'Los yields reales aproximan cuán atractivas son tasas seguras tras inflación. Si suben, pueden competir con el riesgo.',
        'Yields reais aproximam quão atrativas são taxas seguras após inflação. Se sobem, podem competir com o risco.',
      ),
      mechanics: L(
        'Combine with the Inflation and Rates cards — not a standalone signal.',
        'Связывай с карточками инфляции и ставок — не отдельный сигнал.',
        'Combínalo con tarjetas de inflación y tasas — no es señal aislada.',
        'Combine com cartões de inflação e taxas — não é sinal isolado.',
      ),
      limits: L(
        'Measures differ (breakevens, TIPS). Treat as a concept first.',
        'Методики различаются. Сначала освой понятие.',
        'Las medidas difieren. Trata primero el concepto.',
        'As medidas diferem. Trate primeiro o conceito.',
      ),
    ),
    GlossaryEntry(
      id: 'em_risk',
      title: L('EM risk', 'Риск emerging', 'Riesgo EM', 'Risco EM'),
      subtitle: L(
        'Emerging-market sensitivity to USD/funding',
        'Чувствительность emerging к доллару и финансированию',
        'Sensibilidad de emergentes a USD/funding',
        'Sensibilidade de emergentes a USD/funding',
      ),
      body: L(
        'Many EM assets feel a strong dollar and tight USD funding quickly through currency and capital-flow channels.',
        'Многие активы emerging быстро чувствуют сильный доллар и тугое USD-финансирование через валюту и потоки капитала.',
        'Muchos activos EM sienten rápido un dólar fuerte y funding USD tenso vía FX y flujos de capital.',
        'Muitos ativos EM sentem rápido um dólar forte e funding USD apertado via FX e fluxos de capital.',
      ),
      mechanics: L(
        'When the Dollar card is firm, raise your caution bar for USD-sensitive EM stories.',
        'Когда карточка доллара крепкая — повышай планку осторожности к USD-чувствительным историям EM.',
        'Si la tarjeta Dólar está firme, sube tu barra de cautela en historias EM sensibles al USD.',
        'Se o cartão Dólar está firme, suba sua barra de cautela em histórias EM sensíveis ao USD.',
      ),
      limits: L(
        'EM is not one trade. Countries differ.',
        'EM — не одна сделка. Страны разные.',
        'EM no es un solo trade. Los países difieren.',
        'EM não é um único trade. Países diferem.',
      ),
    ),
    GlossaryEntry(
      id: 'quality_factor',
      title: L('Quality factor', 'Фактор качества', 'Factor calidad', 'Fator qualidade'),
      subtitle: L(
        'Preference for stronger balance sheets / earnings',
        'Предпочтение более сильным балансам / прибыли',
        'Preferencia por balances / utilidades más fuertes',
        'Preferência por balanços / lucros mais fortes',
      ),
      body: L(
        'In cautious moods, markets often prefer profitable, less-levered companies over fragile speculative stories.',
        'В осторожном настроении рынок часто предпочитает прибыльные, менее закредитованные компании хрупким спекуляциям.',
        'En ánimos cautelosos, el mercado suele preferir empresas rentables y menos apalancadas frente a historias frágiles.',
        'Em humores cautelosos, o mercado costuma preferir empresas lucrativas e menos alavancadas a histórias frágeis.',
      ),
      mechanics: L(
        'Use as a relative lens when Risk mood is cautious — not a shopping list.',
        'Как относительная линза при осторожном настроении — не список покупок.',
        'Úsalo como lente relativa si el ánimo es cauteloso — no una lista de compras.',
        'Use como lente relativa se o humor for cauteloso — não uma lista de compras.',
      ),
      limits: L(
        'Quality can underperform in strong risk-on squeezes.',
        'Качество может отставать в сильных risk-on сжатиях.',
        'La calidad puede quedar atrás en squeezes fuertes de risk-on.',
        'Qualidade pode ficar para trás em squeezes fortes de risk-on.',
      ),
    ),
    GlossaryEntry(
      id: 'sector_sensitivity',
      title: L('Sector sensitivity', 'Чувствительность секторов', 'Sensibilidad sectorial', 'Sensibilidade setorial'),
      subtitle: L(
        'How equity groups historically react to macro weather',
        'Как группы акций historically реагируют на макро-погоду',
        'Cómo reaccionan históricamente grupos de acciones al clima macro',
        'Como grupos de ações reagem historicamente ao clima macro',
      ),
      body: L(
        'Different sectors breathe differently under tight money, strong dollar, or sticky inflation. Maps are historical education.',
        'Разные сектора по-разному дышат при жёстких деньгах, сильном долларе или липкой инфляции. Карты — историческое обучение.',
        'Distintos sectores respiran distinto con dinero restrictivo, dólar fuerte o inflación pegajosa. Los mapas son educación histórica.',
        'Setores diferentes respiram diferente com dinheiro restritivo, dólar forte ou inflação pegajosa. Mapas são educação histórica.',
      ),
      mechanics: L(
        'Read the Equities card as context, then verify with your own process.',
        'Читай карточку «Для акций» как контекст, затем проверяй своим процессом.',
        'Lee la tarjeta de Acciones como contexto y luego verifica con tu proceso.',
        'Leia o cartão de Ações como contexto e depois verifique com seu processo.',
      ),
      limits: L(
        'Past sensitivity ≠ future performance.',
        'Прошлая чувствительность ≠ будущая доходность.',
        'Sensibilidad pasada ≠ rendimiento futuro.',
        'Sensibilidade passada ≠ desempenho futuro.',
      ),
    ),
  ];
}
