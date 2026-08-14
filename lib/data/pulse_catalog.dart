import '../models/models.dart';

/// Curated educational copy pack. Numeric values come from [LivePulseRepository].
class PulseCatalog {
  static const stamp = 'WEB · r8';
  static const demoAsOf = '2026-08-06';

  /// Explanatory template for "today" — values overwritten by live snapshot.
  static PulseDay get templateToday => _today;

  /// Prior days keep curated teaching values (habit archive).
  static List<PulseDay> get archiveDays => _buildArchive(_today.cards);

  static List<PulseDay> get days {
    return [_today, ...archiveDays];
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
    summary: L(
      'Rates steady · inflation cooling slowly · dollar firm · cautious risk mood.',
      'Ставки стабильны · инфляция остывает медленно · доллар крепкий · осторожное настроение.',
      'Tasas estables · inflación enfriando lento · dólar firme · ánimo cauteloso.',
      'Taxas estáveis · inflação esfriando devagar · dólar firme · humor cauteloso.',
    ),
    cards: [
      PulseCard(
        kind: PulseCardKind.rates,
        headline: L('Policy rates', 'Ключевые ставки', 'Tasas de política', 'Taxas de política'),
        valueLabel: L(
          'Fed funds ~ hold · market prices few cuts near-term',
          'ФРС ≈ пауза · рынок ждёт мало снижений вблизи',
          'Fed ~ pausa · el mercado espera pocos recortes cercanos',
          'Fed ~ pausa · mercado espera poucos cortes no curto prazo',
        ),
        plainMeaning: L(
          'Money is still relatively expensive. Borrowing costs stay high for households and companies.',
          'Деньги всё ещё относительно дорогие. Кредиты для людей и компаний остаются дорогими.',
          'El dinero sigue relativamente caro. El crédito sigue alto para hogares y empresas.',
          'O dinheiro ainda é relativamente caro. O crédito segue alto para famílias e empresas.',
        ),
        forEquities: L(
          'Long-duration growth names stay sensitive; banks can benefit from higher net interest — with credit-risk caveats.',
          'Длинные «growth»-истории чувствительны; банкам может помогать маржа — но с оглядкой на кредитный риск.',
          'Crecimiento de larga duración sigue sensible; bancos pueden beneficiarse del margen — con matices de riesgo crediticio.',
          'Growth de longa duração segue sensível; bancos podem se beneficiar da margem — com ressalvas de risco de crédito.',
        ),
        whyItMatters: L(
          'The rate level sets the discount rate for future cash flows and the hurdle for risk assets.',
          'Уровень ставки задаёт «дисконт» будущих денежных потоков и планку для рисковых активов.',
          'El nivel de tasas fija el descuento de flujos futuros y el listón para activos de riesgo.',
          'O nível das taxas define o desconto dos fluxos futuros e a barra para ativos de risco.',
        ),
        commonMistake: L(
          'Treating every speech as an immediate trade signal instead of a slow regime.',
          'Читать каждую речь как сигнал к сделке вместо медленного режима.',
          'Tratar cada discurso como señal de trade inmediata en vez de un régimen lento.',
          'Tratar cada discurso como sinal de trade imediato em vez de um regime lento.',
        ),
        glossaryIds: const ['policy_rate', 'duration', 'tight_money'],
      ),
      PulseCard(
        kind: PulseCardKind.inflation,
        headline: L('Inflation print', 'Инфляция', 'Inflación', 'Inflação'),
        valueLabel: L(
          'CPI trend: gradual cool · services sticky',
          'ИПЦ: медленное охлаждение · услуги липкие',
          'IPC: enfriamiento gradual · servicios pegajosos',
          'IPC: esfriamento gradual · serviços pegajosos',
        ),
        plainMeaning: L(
          'Prices are rising slower than the peak, but not “done”. Services inflation cools last.',
          'Цены растут медленнее пика, но «ещё не конец». Услуги остывают последними.',
          'Los precios suben más lento que el pico, pero no “ya terminó”. Servicios se enfrían al final.',
          'Os preços sobem mais devagar que o pico, mas não “já acabou”. Serviços esfriam por último.',
        ),
        forEquities: L(
          'Sticky inflation keeps policy tight longer — pressure on highly valued growth; some pricing-power sectors cope better.',
          'Липкая инфляция держит жёсткую политику дольше — давление на дорогой growth; сектора с ценовой силой держатся лучше.',
          'Inflación pegajosa mantiene política restrictiva más tiempo — presión al growth caro; sectores con poder de precio resisten mejor.',
          'Inflação pegajosa mantém política restritiva por mais tempo — pressão no growth caro; setores com poder de preço resistem melhor.',
        ),
        whyItMatters: L(
          'Inflation path decides how long expensive money lasts.',
          'Траектория инфляции решает, как долго деньги останутся дорогими.',
          'La trayectoria de inflación decide cuánto dura el dinero caro.',
          'A trajetória da inflação decide quanto tempo o dinheiro caro dura.',
        ),
        commonMistake: L(
          'One soft print = “cuts tomorrow”. Macro moves in sequences, not single headlines.',
          'Один мягкий отчёт = «завтра снизят». Макро ходит сериями, не одним заголовком.',
          'Un dato suave = “recortes mañana”. La macro se mueve en secuencias, no en un titular.',
          'Um dado suave = “cortes amanhã”. A macro anda em sequências, não em uma manchete.',
        ),
        glossaryIds: const ['cpi', 'sticky_inflation', 'real_yield'],
      ),
      PulseCard(
        kind: PulseCardKind.dollar,
        headline: L('US dollar', 'Доллар США', 'Dólar estadounidense', 'Dólar americano'),
        valueLabel: L(
          'DXY firm · funding still tight-ish globally',
          'Индекс доллара крепкий · глобальное финансирование всё ещё тугое',
          'DXY firme · financiamiento global aún algo tenso',
          'DXY firme · financiamento global ainda um pouco apertado',
        ),
        plainMeaning: L(
          'A strong dollar makes global dollar debt heavier and can pull liquidity from risk assets abroad.',
          'Сильный доллар утяжеляет долларовые долги в мире и может вытягивать ликвидность из риска за рубежом.',
          'Un dólar fuerte encarece la deuda en USD y puede sacar liquidez de activos de riesgo afuera.',
          'Um dólar forte encarece a dívida em USD e pode tirar liquidez de ativos de risco no exterior.',
        ),
        forEquities: L(
          'Often headwind for EM equities and some commodities; US large-cap exporters can feel FX translation effects.',
          'Часто встречный ветер для акций emerging и части сырья; у экспортёров США — эффект перевода валюты.',
          'A menudo viento en contra para acciones EM y algunas materias; exportadores USA sienten efecto FX.',
          'Muitas vezes vento contrário para ações EM e algumas commodities; exportadores EUA sentem efeito FX.',
        ),
        whyItMatters: L(
          'Dollar strength is a global liquidity channel, not just a currency chart.',
          'Сила доллара — канал глобальной ликвидности, а не просто график валюты.',
          'La fuerza del dólar es un canal de liquidez global, no solo un gráfico de divisa.',
          'A força do dólar é um canal de liquidez global, não só um gráfico de câmbio.',
        ),
        commonMistake: L(
          'Ignoring USD when reading “local” equity stories that still fund in dollars.',
          'Игнорировать USD, читая «локальные» акции, которые всё равно живут в долларовом финансировании.',
          'Ignorar el USD al leer historias “locales” que aún se financian en dólares.',
          'Ignorar o USD ao ler histórias “locais” que ainda se financiam em dólares.',
        ),
        glossaryIds: const ['dxy', 'liquidity', 'em_risk'],
      ),
      PulseCard(
        kind: PulseCardKind.mood,
        headline: L('Risk mood', 'Настроение риска', 'Ánimo de riesgo', 'Humor de risco'),
        valueLabel: L(
          'Cautious · prefer quality over chase',
          'Осторожно · качество важнее погони',
          'Cauteloso · preferir calidad a la cacería',
          'Cauteloso · preferir qualidade à caçada',
        ),
        plainMeaning: L(
          'Markets are open to risk selectively, not in “everything rallies” mode.',
          'Рынок готов к риску выборочно, а не в режиме «растёт всё подряд».',
          'Los mercados aceptan riesgo de forma selectiva, no en modo “todo sube”.',
          'Os mercados aceitam risco de forma seletiva, não no modo “tudo sobe”.',
        ),
        forEquities: L(
          'Leadership often narrows to quality / cash-flow stories; speculative beta can lag.',
          'Лидерство часто сужается к качеству и денежному потоку; спекулятивная бета отстаёт.',
          'El liderazgo suele estrecharse a calidad / flujo de caja; la beta especulativa puede rezagarse.',
          'A liderança costuma estreitar para qualidade / fluxo de caixa; a beta especulativa pode ficar para trás.',
        ),
        whyItMatters: L(
          'Mood decides whether good news is bought or sold — same print, different reaction.',
          'Настроение решает: хорошие новости покупают или продают — тот же отчёт, разная реакция.',
          'El ánimo decide si las buenas noticias se compran o se venden — mismo dato, distinta reacción.',
          'O humor decide se boas notícias são compradas ou vendidas — mesmo dado, reação diferente.',
        ),
        commonMistake: L(
          'Forcing the same playbook every day regardless of risk appetite.',
          'Тащить один и тот же плейбук каждый день без учёта аппетита к риску.',
          'Forzar el mismo playbook cada día sin mirar el apetito de riesgo.',
          'Forçar o mesmo playbook todo dia sem olhar o apetite de risco.',
        ),
        glossaryIds: const ['risk_on', 'risk_off', 'liquidity'],
      ),
      PulseCard(
        kind: PulseCardKind.equities,
        headline: L('Equity context', 'Контекст для акций', 'Contexto para acciones', 'Contexto para ações'),
        valueLabel: L(
          'Prefer resilience · watch duration & funding',
          'Упор на устойчивость · следи за duration и финансированием',
          'Preferir resiliencia · mirar duration y financiamiento',
          'Preferir resiliência · olhar duration e financiamento',
        ),
        plainMeaning: L(
          'Today’s weather favors reading which equity styles usually breathe in firm-dollar + sticky-inflation backdrops.',
          'Сегодняшняя погода: смотри, какие стили акций обычно дышат при крепком долларе и липкой инфляции.',
          'El clima de hoy: mira qué estilos de acciones suelen respirar con dólar firme + inflación pegajosa.',
          'O clima de hoje: veja quais estilos de ações costumam respirar com dólar firme + inflação pegajosa.',
        ),
        forEquities: L(
          'Educational map only: quality / cash generators often relative winners; high-duration speculative growth more fragile until cuts are clearer.',
          'Только учебная карта: качество и генераторы кэша часто относительно сильнее; длинный спекулятивный growth хрупче, пока снижения ставок неясны.',
          'Solo mapa educativo: calidad / generadores de caja suelen ganar en relativo; growth especulativo de larga duración es más frágil hasta que los recortes sean claros.',
          'Apenas mapa educativo: qualidade / geradores de caixa costumam ganhar no relativo; growth especulativo de longa duração é mais frágil até os cortes ficarem claros.',
        ),
        whyItMatters: L(
          'This card is the bridge from macro weather → equity context — still not a buy list.',
          'Эта карточка — мост от макро-погоды к контексту акций — всё ещё не список покупок.',
          'Esta tarjeta es el puente del clima macro → contexto de acciones — aún no es lista de compras.',
          'Este cartão é a ponte do clima macro → contexto de ações — ainda não é lista de compras.',
        ),
        commonMistake: L(
          'Turning the morning brief into five ticker tips.',
          'Превращать утренний брифинг в пять тикеров «что купить».',
          'Convertir el brief matutino en cinco tips de tickers.',
          'Transformar o brief matinal em cinco dicas de tickers.',
        ),
        glossaryIds: const ['duration', 'quality_factor', 'sector_sensitivity'],
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
        summary: L(
          'Soft risk tone · dollar bid · inflation wait mode.',
          'Мягкий тон риска · доллар в спросе · режим ожидания инфляции.',
          'Tono de riesgo suave · dólar pedido · modo espera de inflación.',
          'Tom de risco suave · dólar comprado · modo espera de inflação.',
        ),
        cards: weather(
          rates: L('Hold bias intact', 'Пауза сохраняется', 'Sesgo de pausa intacto', 'Viés de pausa intacto'),
          inflation: L('Awaiting next print', 'Ждём следующий отчёт', 'Esperando el próximo dato', 'Aguardando o próximo dado'),
          dollar: L('Bid remains', 'Спрос сохраняется', 'La demanda sigue', 'A demanda permanece'),
          mood: L('Soft defensive tilt', 'Мягкий защитный уклон', 'Sesgo defensivo suave', 'Viés defensivo suave'),
          equities: L('Quality over beta', 'Качество важнее беты', 'Calidad sobre beta', 'Qualidade sobre beta'),
        ),
      ),
      PulseDay(
        dateIso: '2026-08-04',
        summary: L(
          'Mild risk-on attempt · rates calm · watch follow-through.',
          'Слабая попытка risk-on · ставки спокойны · смотри закрепление.',
          'Intento leve de risk-on · tasas calmadas · mira seguimiento.',
          'Tentativa leve de risk-on · taxas calmas · veja continuidade.',
        ),
        cards: weather(
          rates: L('Calm front-end', 'Спокойный короткий конец', 'Tramo corto calmado', 'Ponta curta calma'),
          inflation: L('No new surprise', 'Без нового сюрприза', 'Sin nueva sorpresa', 'Sem nova surpresa'),
          dollar: L('Slightly softer', 'Чуть мягче', 'Un poco más suave', 'Um pouco mais suave'),
          mood: L('Tentative risk-on', 'Осторожный risk-on', 'Risk-on tentativo', 'Risk-on tentativo'),
          equities: L('Cyclicals probe higher', 'Циклика пробует рост', 'Cíclicos prueban alzas', 'Cíclicos testam alta'),
        ),
      ),
      PulseDay(
        dateIso: '2026-08-03',
        summary: L(
          'Weekend decay mindset · thinner conviction.',
          'Выходной режим · меньше убеждённости.',
          'Mentalidad de fin de semana · menos convicción.',
          'Mentalidade de fim de semana · menos convicção.',
        ),
        cards: weather(
          rates: L('Quiet tape', 'Тихая лента', 'Cinta tranquila', 'Fita quieta'),
          inflation: L('Unchanged narrative', 'Нарратив без смены', 'Narrativa sin cambio', 'Narrativa sem mudança'),
          dollar: L('Range-bound', 'В диапазоне', 'En rango', 'Em faixa'),
          mood: L('Low engagement', 'Низкая вовлечённость', 'Baja participación', 'Baixo engajamento'),
          equities: L('Liquidity thin', 'Тонкая ликвидность', 'Liquidez fina', 'Liquidez fina'),
        ),
      ),
      PulseDay(
        dateIso: '2026-08-02',
        summary: L(
          'Payrolls week hangover · volatility memory.',
          'После недели занятости · память о волатильности.',
          'Resaca de semana de empleo · memoria de volatilidad.',
          'Ressaca da semana de emprego · memória de volatilidade.',
        ),
        cards: weather(
          rates: L('Path re-priced modestly', 'Траектория чуть переоценена', 'Ruta repreciada con moderación', 'Trajetória reprecificada com moderação'),
          inflation: L('Labor → inflation link watched', 'Связка труд→инфляция в фокусе', 'Vínculo empleo→inflación vigilado', 'Elo emprego→inflação vigiado'),
          dollar: L('Mixed', 'Смешанно', 'Mixto', 'Misto'),
          mood: L('Digesting data', 'Переваривают данные', 'Digiriendo datos', 'Digerindo dados'),
          equities: L('Index heavyweights decide tape', 'Тяжеловесы индекса задают тон', 'Pesos del índice marcan la cinta', 'Pesos do índice definem a fita'),
        ),
      ),
      PulseDay(
        dateIso: '2026-08-01',
        summary: L(
          'Month open · positioning reset chatter.',
          'Открытие месяца · разговоры о сбросе позиций.',
          'Apertura de mes · charla de reset de posicionamiento.',
          'Abertura do mês · papo de reset de posicionamento.',
        ),
        cards: weather(
          rates: L('Stable', 'Стабильно', 'Estable', 'Estável'),
          inflation: L('Sticky services theme', 'Тема липких услуг', 'Tema de servicios pegajosos', 'Tema de serviços pegajosos'),
          dollar: L('Supported', 'С поддержкой', 'Con soporte', 'Com suporte'),
          mood: L('Neutral-cautious', 'Нейтрально-осторожно', 'Neutral-cauteloso', 'Neutro-cauteloso'),
          equities: L('Breadth still uneven', 'Ширина рынка неровная', 'Amplitud aún irregular', 'Amplitude ainda irregular'),
        ),
      ),
      PulseDay(
        dateIso: '2026-07-31',
        summary: L(
          'Month-end flows · noise ≠ regime change.',
          'Потоки конца месяца · шум ≠ смена режима.',
          'Flujos de fin de mes · ruido ≠ cambio de régimen.',
          'Fluxos de fim de mês · ruído ≠ mudança de regime.',
        ),
        cards: weather(
          rates: L('Range', 'Диапазон', 'Rango', 'Faixa'),
          inflation: L('Unchanged', 'Без изменений', 'Sin cambios', 'Sem mudanças'),
          dollar: L('Firm', 'Крепкий', 'Firme', 'Firme'),
          mood: L('Flow-driven', 'Движет потоками', 'Impulsado por flujos', 'Impulsionado por fluxos'),
          equities: L('Ignore one-day drama', 'Не раздувай однодневную драму', 'Ignora el drama de un día', 'Ignore o drama de um dia'),
        ),
      ),
      PulseDay(
        dateIso: '2026-07-30',
        summary: L(
          'Central-bank speakers · window of uncertainty.',
          'Речи центробанков · окно неопределённости.',
          'Discursos de bancos centrales · ventana de incertidumbre.',
          'Discursos de bancos centrais · janela de incerteza.',
        ),
        cards: weather(
          rates: L('Speech risk elevated', 'Риск речей повышен', 'Riesgo de discursos alto', 'Risco de discursos elevado'),
          inflation: L('Data silence', 'Пауза в данных', 'Silencio de datos', 'Silêncio de dados'),
          dollar: L('Reactive', 'Реактивный', 'Reactivo', 'Reativo'),
          mood: L('Headline sensitive', 'Чувствительно к заголовкам', 'Sensible a titulares', 'Sensível a manchetes'),
          equities: L('Size risk carefully', 'Аккуратно с размером риска', 'Dimensiona el riesgo con cuidado', 'Dimensione o risco com cuidado'),
        ),
      ),
      PulseDay(
        dateIso: '2026-07-29',
        summary: L(
          'Soft landing narrative intact · not guaranteed.',
          'Нарратив мягкой посадки жив · не гарантия.',
          'Narrativa de aterrizaje suave intacta · no garantizada.',
          'Narrativa de pouso suave intacta · não garantida.',
        ),
        cards: weather(
          rates: L('Cut hopes alive', 'Надежды на снижение живы', 'Esperanzas de recorte vivas', 'Esperanças de corte vivas'),
          inflation: L('Cooling path assumed', 'Заложено охлаждение', 'Se asume enfriamiento', 'Assume-se esfriamento'),
          dollar: L('Mildly softer bias', 'Слегка мягче', 'Sesgo un poco más suave', 'Viés um pouco mais suave'),
          mood: L('Constructive', 'Конструктивно', 'Constructivo', 'Construtivo'),
          equities: L('Growth finds buyers on dips', 'Growth находят на откатах', 'Growth encuentra compradores en dips', 'Growth acha compradores em dips'),
        ),
      ),
      PulseDay(
        dateIso: '2026-07-28',
        summary: L(
          'Earnings-heavy tape · macro secondary for a day.',
          'День отчётов · макро на втором плане.',
          'Día de resultados · macro secundaria por un día.',
          'Dia de resultados · macro secundária por um dia.',
        ),
        cards: weather(
          rates: L('Background only', 'Только фон', 'Solo fondo', 'Só fundo'),
          inflation: L('Background only', 'Только фон', 'Solo fondo', 'Só fundo'),
          dollar: L('Quiet', 'Тихо', 'Tranquilo', 'Quieto'),
          mood: L('Stock-specific', 'Истории отдельных акций', 'Historias específicas', 'Histórias específicas'),
          equities: L('Separate stock from weather', 'Отделяй акцию от погоды', 'Separa la acción del clima', 'Separe a ação do clima'),
        ),
      ),
      PulseDay(
        dateIso: '2026-07-27',
        summary: L(
          'Risk appetite improved briefly · verify persistence.',
          'Аппетит к риску кратко вырос · проверь устойчивость.',
          'Apetito de riesgo subió breve · verifica persistencia.',
          'Apetite de risco subiu breve · verifique persistência.',
        ),
        cards: weather(
          rates: L('Benign', 'Спокойно', 'Benigno', 'Benigno'),
          inflation: L('Benign', 'Спокойно', 'Benigno', 'Benigno'),
          dollar: L('Softer', 'Мягче', 'Más suave', 'Mais suave'),
          mood: L('Risk-on probe', 'Проба risk-on', 'Sondeo risk-on', 'Sondagem risk-on'),
          equities: L('Beta works until it doesn’t', 'Бета работает — пока не сломается', 'La beta funciona hasta que no', 'A beta funciona até não funcionar'),
        ),
      ),
      PulseDay(
        dateIso: '2026-07-26',
        summary: L(
          'Weekend ahead · reduce narrative overload.',
          'Перед выходными · меньше нарративной перегрузки.',
          'Fin de semana cerca · baja la sobrecarga narrativa.',
          'Fim de semana perto · reduza a sobrecarga narrativa.',
        ),
        cards: weather(
          rates: L('Steady', 'Ровно', 'Estable', 'Estável'),
          inflation: L('Steady', 'Ровно', 'Estable', 'Estável'),
          dollar: L('Steady', 'Ровно', 'Estable', 'Estável'),
          mood: L('Fade the noise', 'Отфильтруй шум', 'Filtra el ruido', 'Filtre o ruído'),
          equities: L('Plan the week, don’t invent trades', 'Планируй неделю, не выдумывай сделки', 'Planea la semana, no inventes trades', 'Planeje a semana, não invente trades'),
        ),
      ),
      PulseDay(
        dateIso: '2026-07-25',
        summary: L(
          'Dollar bounce · EM caution reminder.',
          'Отскок доллара · напоминание об осторожности в EM.',
          'Rebote del dólar · recordatorio de cautela en EM.',
          'Alívio do dólar · lembrete de cautela em EM.',
        ),
        cards: weather(
          rates: L('Supportive for USD', 'В поддержку USD', 'A favor del USD', 'A favor do USD'),
          inflation: L('Unchanged', 'Без изменений', 'Sin cambios', 'Sem mudanças'),
          dollar: L('Bounce', 'Отскок', 'Rebote', 'Alívio'),
          mood: L('Selective', 'Выборочно', 'Selectivo', 'Seletivo'),
          equities: L('Check USD beta of your book', 'Проверь долларовую бету портфеля', 'Revisa la beta USD de tu libro', 'Veja a beta USD do seu book'),
        ),
      ),
      PulseDay(
        dateIso: '2026-07-24',
        summary: L(
          'Quiet inflation day · rates dominate narrative.',
          'Тихий день по инфляции · нарратив за ставками.',
          'Día tranquilo de inflación · las tasas dominan la narrativa.',
          'Dia calmo de inflação · as taxas dominam a narrativa.',
        ),
        cards: weather(
          rates: L('Center stage', 'В центре', 'En el centro', 'No centro'),
          inflation: L('Secondary', 'Вторично', 'Secundario', 'Secundário'),
          dollar: L('Tracks rates', 'Следит за ставками', 'Sigue a las tasas', 'Segue as taxas'),
          mood: L('Rates-led', 'Ведут ставки', 'Liderado por tasas', 'Liderado por taxas'),
          equities: L('Duration still the lever', 'Duration всё ещё рычаг', 'Duration sigue siendo la palanca', 'Duration ainda é a alavanca'),
        ),
      ),
    ];
  }
}
