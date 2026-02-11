import Foundation

// MARK: - Daily Insights Extension
// 28 unikalnych insightów dla każdego dnia cyklu × 4 tony = 112 total

extension InsightService {
    
    // MARK: - BALANCED TONE - 28 Days
    
    func getBalancedDailyInsights() -> [Insight] {
        return [
            // DAYS 1-5: MENSTRUATION
            Insight(
                title: "Dzień 1 - Fresh start (sort of)",
                message: "Witamy w dniu pierwszym! Twoje ciało właśnie wcisnęło 'restart'. Hormony na dnie, energia też - ale to twoja supermoc: umiesz zaczynać od nowa co miesiąc. Fun fact: badania pokazują że dzień 1 to najlepszy moment na planowanie celów (póki leżysz pod kocem). 🫖",
                icon: "🫖",
                phase: .menstrual,
                tone: .balanced
            ),
            Insight(
                title: "Dzień 2 - Survival mode active",
                message: "Dzisiaj może być najtrudniej - estrogen i progesteron na absolutnym dnie. Twój mózg dosłownie działa wolniej (nauka potwierdza!). Twoje jedyne zadanie: być gentle with yourself. Netflix, comfort food, zero winy. To przejdzie! 💤",
                icon: "💤",
                phase: .menstrual,
                tone: .balanced
            ),
            Insight(
                title: "Dzień 3 - Połowa za Tobą",
                message: "Już połowa okresu za Tobą! Psychologicznie to ważny punkt - widzisz światełko w tunelu. Może czujesz się odrobinę lepiej, może nie - obie opcje są OK. Pamiętaj: jesteś w trakcie biologicznego maratonu, nie sprintu. 💜",
                icon: "💜",
                phase: .menstrual,
                tone: .balanced
            ),
            Insight(
                title: "Dzień 4 - Światełko w tunelu",
                message: "Energia powoli wraca, hormony zaczynają rosnąć. Nie musisz od razu wracać do 100% - slow and steady wins the race. Ciekawe: w tym momencie cyklu kobiety są najbardziej empatyczne. Może dlatego czujesz wszystko intensywniej? ☕",
                icon: "☕",
                phase: .menstrual,
                tone: .balanced
            ),
            Insight(
                title: "Dzień 5 - Closing chapter",
                message: "Ostatni dzień! Możesz już odczuwać delikatną zmianę w energii. Twoje ciało kończy 'sprzątanie' i przygotowuje się do rebuildu. Jutro zaczyna się nowa era - faza folikularna aka 'good vibes era'! 🌸",
                icon: "🌸",
                phase: .menstrual,
                tone: .balanced
            ),
            
            // DAYS 6-13: FOLLICULAR PHASE
            Insight(
                title: "Dzień 6 - Welcome back to life!",
                message: "Witaj w fazie folikularnej! Estrogen zaczyna rosnąć i zauważysz różnicę - mood up, energy up, tolerance dla ludzi... slightly up. Może dziś wstałaś bez alarmu? To nie przypadek. Twój inner optimist właśnie się budzi! 🌅",
                icon: "🌅",
                phase: .follicular,
                tone: .balanced
            ),
            Insight(
                title: "Dzień 7 - Cognitive glow-up",
                message: "Czujesz już tę zmianę? Myśli jaśniejsze, słowa przychodzą łatwiej. Badania pokazują że w tej fazie kobiety lepiej rozwiązują problemy przestrzenne. To świetny moment na te zadania które odkładałaś. Your brain is your friend again! 🧠",
                icon: "🧠",
                phase: .follicular,
                tone: .balanced
            ),
            Insight(
                title: "Dzień 8 - Social battery recharging",
                message: "Ludzie nie wydają się już tak irytujący? To estrogen robi swoje! Może coffee date ze znajomymi? Psychologicznie: jesteś teraz bardziej otwarta na nowe doświadczenia. Perfect time na networking albo po prostu... fun. ☕",
                icon: "☕",
                phase: .follicular,
                tone: .balanced
            ),
            Insight(
                title: "Dzień 9 - Creative brain go brrr",
                message: "Pomysły się roją? Twój mózg jest teraz w peak creative mode. Estrogen zwiększa aktywność w obszarach odpowiedzialnych za kreatywność. Świetny dzień na brainstorming, pisanie, design - cokolwiek wymaga 'out of the box thinking'. 📝",
                icon: "📝",
                phase: .follicular,
                tone: .balanced
            ),
            Insight(
                title: "Dzień 10 - Focus level: Laser",
                message: "Estrogen na wysokim poziomie = super koncentracja + wysoka motywacja. Te trudne zadania? Zaplanuj je na dziś. Bonus: w tej fazie masz też lepszą pamięć roboczą. Your brain is literally on steroids (the good ones). 🎯",
                icon: "🎯",
                phase: .follicular,
                tone: .balanced
            ),
            Insight(
                title: "Dzień 11 - Momentum is real",
                message: "Czujesz momentum? That's not imagination - to biochemia! Testosteron też zaczyna rosnąć (tak, mamy go też). To dlatego czujesz się bardziej assertive. Perfect time na te rzeczy które wymagają 'showing up' i confidence. 🚀",
                icon: "🚀",
                phase: .follicular,
                tone: .balanced
            ),
            Insight(
                title: "Dzień 12 - Pre-ovulation power-up",
                message: "Jutro owulacja! Już teraz możesz czuć się extra dobrze. Estrogen prawie na szczycie, testosteron rośnie. Może czas na ten trudny email? Tę prezentację? To rozmowę o podwyżce? Your body's got your back. 💪",
                icon: "💪",
                phase: .follicular,
                tone: .balanced
            ),
            Insight(
                title: "Dzień 13 - Golden hour approaching",
                message: "Eve of ovulation! Energie na topie, pewność siebie rośnie, ludzie mogą zauważyć że jakoś bardziej... świecisz? Nauka to potwierdza - twarze kobiet są postrzegane jako bardziej atrakcyjne w tym okresie. Not creepy at all, nature! ✨",
                icon: "✨",
                phase: .follicular,
                tone: .balanced
            ),
            
            // DAYS 14-16: OVULATION
            Insight(
                title: "Dzień 14 - MAIN CHARACTER ENERGY",
                message: "TO. JEST. TO! Owulacja! Peak estrogen + peak testosteron = peak everything. Badania pokazują że dziś jesteś najbardziej atrakcyjna, komunikatywna i pewna siebie w całym miesiącu. Nature literally made you glow today. Co chciałaś zrobić od dawna? NOW! 👑",
                icon: "👑",
                phase: .ovulation,
                tone: .balanced
            ),
            Insight(
                title: "Dzień 15 - Still in the zone",
                message: "Wciąż w oknie owulacji! Wszystko Ci wychodzi? Research says: twój głos jest bardziej melodyjny, mimika bardziej ekspresywna, nawet chodzisz inaczej (more symmetrically!). To magia hormonów + ewolucji. Biology is wild. Use this power! ⚡",
                icon: "⚡",
                phase: .ovulation,
                tone: .balanced
            ),
            Insight(
                title: "Dzień 16 - Last call for glory",
                message: "Ostatni dzień peak energy window. Jutro zacznie się faza lutealna i wszystko zwolni. Co jeszcze chcesz ogarnąć póki masz tę supermoc? Psychologicznie: to ostatni moment na rzeczy wymagające maksymalnej pewności siebie. Carpe diem! 🎯",
                icon: "🎯",
                phase: .ovulation,
                tone: .balanced
            ),
            
            // DAYS 17-28: LUTEAL PHASE
            Insight(
                title: "Dzień 17 - The shift begins",
                message: "Witamy w fazie lutealnej. Estrogen spada, progesteron rośnie. Może dziś czujesz się odrobinę wolniejsza? To biochemia! Progesteron jest jak naturalny chill pill. Adjust expectations accordingly - this is the 'reflect' phase, not 'conquer' phase. 🌙",
                icon: "🌙",
                phase: .luteal,
                tone: .balanced
            ),
            Insight(
                title: "Dzień 18 - Still coasting",
                message: "Wczesna faza lutealna to jeszcze całkiem OK zone. Energia niższa niż w owulacji (RIP glory days), ale wciąż functional. Perfect time na dokończenie projektów, nie na ich zaczynanie. Pro tip: twój mózg teraz lepiej zauważa błędy - ideal for proofreading! 📊",
                icon: "📊",
                phase: .luteal,
                tone: .balanced
            ),
            Insight(
                title: "Dzień 19 - Cocooning mode",
                message: "Masz ochotę zostać w domu? Netflix and actually chill? To progesteron - 'hormon ciąży' który mówi ciału 'nest, rest, protect'. Nawet jeśli nie jesteś w ciąży, body doesn't know that. Listening to it jest totally valid! 🏠",
                icon: "🏠",
                phase: .luteal,
                tone: .balanced
            ),
            Insight(
                title: "Dzień 20 - Energy conservation mode",
                message: "Energia dalej spada - to feature, not bug. Progesteron spowalnia metabolizm żeby 'oszczędzać energię' (thanks, evolution). Dziś 70% effort to nowe 100%. Psychology tip: reframe it as 'efficiency' not 'laziness'. Work smarter, not harder! 💕",
                icon: "💕",
                phase: .luteal,
                tone: .balanced
            ),
            Insight(
                title: "Dzień 21 - PMS early warning system",
                message: "Tydzień przed okresem = PMS entry zone. Jeśli czujesz się bardziej emocjonalnie - spadający estrogen + rosnący progesteron = mood rollercoaster. Fun fact: badania pokazują że w tej fazie jesteś bardziej czujna na zagrożenia. Thanks, amygdala! 🌸",
                icon: "🌸",
                phase: .luteal,
                tone: .balanced
            ),
            Insight(
                title: "Dzień 22 - Cravings are real (and valid)",
                message: "Masz ochotę na słodkie? Słone? Węgle? All of the above? Progesteron wpływa na serotonine i insulin sensitivity. Twoje ciało LITERALLY potrzebuje więcej kalorii teraz (metabolizm +5-10%). Daj sobie pozwolenie, skip the guilt! 🍫",
                icon: "🍫",
                phase: .luteal,
                tone: .balanced
            ),
            Insight(
                title: "Dzień 23 - In the thick of it",
                message: "Full PMS territory - estrogen low, progesteron high. Wszystko może irytować łatwiej. Psychologia: twój brain jest w 'threat detection mode' - ewolucyjnie miało chronić cię w 'vulnerable time'. Może unikaj dzisiaj LinkedIn i trudnych rozmów? 🎭",
                icon: "🎭",
                phase: .luteal,
                tone: .balanced
            ),
            Insight(
                title: "Dzień 24 - Emotional HD mode",
                message: "Płaczesz nad reklamą? Wzrusza Cię pies na ulicy? Hormony na szczycie wahań = emocje w ultra HD. Nauka: w tej fazie masz większą aktywność w obszarach mózgu odpowiedzialnych za emocje. You're not 'too sensitive' - you're temporarily extra perceptive! 💜",
                icon: "💜",
                phase: .luteal,
                tone: .balanced
            ),
            Insight(
                title: "Dzień 25 - Survival > thriving",
                message: "Jeszcze kilka dni. Energia prawdopodobnie na dnie. Priorytet: survive, not thrive. Minimum effort, maximum self-compassion. Psychology: self-criticism teraz makes everything worse. Treat yourself like your own best friend would. You're doing great! 🫂",
                icon: "🫂",
                phase: .luteal,
                tone: .balanced
            ),
            Insight(
                title: "Dzień 26 - Prep mode activated",
                message: "Period incoming w ciągu 2-3 dni. Czas strategii! Produkty? Check. Comfort food? Check. Ulubiony serial? Check. Plany na weekend? Cancelled. Psychologicznie: poczucie kontroli (nawet małe) znacznie zmniejsza anxiety. You got this! 📦",
                icon: "📦",
                phase: .luteal,
                tone: .balanced
            ),
            Insight(
                title: "Dzień 27 - Almost there mode",
                message: "Jutro lub pojutrze zacznie się okres. Możesz już czuć 'pre-period vibes'. Fun fact: wiele kobiet czuje mental relief tuż przed okresem - knowing what's coming beats uncertainty. Hot water bottle ready? Wcześniej spać? Finish line in sight! 🏁",
                icon: "🏁",
                phase: .luteal,
                tone: .balanced
            ),
            Insight(
                title: "Dzień 28 - Full circle moment",
                message: "Ostatni dzień cyklu! Jutro zaczyna się wszystko od nowa. Spojrzyj wstecz - przeżyłaś 28 dni zmian hormonalnych, emocjonalnych, fizycznych. That's kind of amazing? Psychology: cycle awareness = self-knowledge = power. See you on day 1! 🌟",
                icon: "🌟",
                phase: .luteal,
                tone: .balanced
            )
        ]
    }
    
    // MARK: - GENTLE TONE - 28 Days
    
    func getGentleDailyInsights() -> [Insight] {
        return [
            // Days 1-5: Menstruation
            Insight(
                title: "Dzień 1 - Nowy początek",
                message: "Twoje ciało rozpoczyna nowy rozdział. To może być trudny dzień i to jest w porządku. Psychologowie mówią, że samoakceptacja w trudnych momentach jest kluczem do dobrego samopoczucia. Pozwól sobie na odpoczynek i łagodność. Jesteś silna, nawet gdy czujesz się słaba. 💜",
                icon: "💜",
                phase: .menstrual,
                tone: .gentle
            ),
            Insight(
                title: "Dzień 2 - Bądź swoją najlepszą przyjaciółką",
                message: "Dziś może być najtrudniej - to normalne. Badania pokazują, że mówienie do siebie z życzliwością (jak do przyjaciółki) zmniejsza stres o 30%. Traktuj siebie z taką samą czułością, z jaką traktujesz osoby które kochasz. Zasługujesz na to. 🫖",
                icon: "🫖",
                phase: .menstrual,
                tone: .gentle
            ),
            Insight(
                title: "Dzień 3 - Każdy krok się liczy",
                message: "Już połowa drogi. Nawet jeśli dziś ciężko, pamiętaj - Twoje ciało robi niesamowitą pracę odbudowy. Mindfulness research pokazuje: zaakceptowanie tego co jest (zamiast walki) przynosi ulgę. Każda godzina przybliża Cię do lepszego samopoczucia. 🌸",
                icon: "🌸",
                phase: .menstrual,
                tone: .gentle
            ),
            Insight(
                title: "Dzień 4 - Światło powraca",
                message: "Może już zauważasz delikatną poprawę? Energia powoli wraca jak pierwsze promienie słońca. To piękny znak, że najgorsze jest za Tobą. Pozwól sobie czuć dumę z tego, co przeżyłaś. Jesteś niesamowita. ✨",
                icon: "✨",
                phase: .menstrual,
                tone: .gentle
            ),
            Insight(
                title: "Dzień 5 - Ciało się odbudowuje",
                message: "Ostatni dzień tego okresu. Twoje ciało zakończyło wielką pracę i zaczyna się regenerować jak natura po zimie. Pozwól sobie jeszcze na łagodność - zasłużyłaś. Jutro zaczniesz czuć się coraz lepiej. 🌱",
                icon: "🌱",
                phase: .menstrual,
                tone: .gentle
            ),
            
            // Days 6-13: Follicular
            Insight(
                title: "Dzień 6 - Delikatne odrodzenie",
                message: "Witaj w fazie folikularnej. Możesz już czuć, jak energia powoli powraca - jak pierwsza wiosenna zielonka. Pozwól sobie na to piękne uczucie. 🌿",
                icon: "🌿",
                phase: .follicular,
                tone: .gentle
            ),
            Insight(
                title: "Dzień 7 - Rozkwitasz",
                message: "Twoja energia rośnie naturalnie i pięknie. Nie musisz się śpieszyć - po prostu ciesz się tym, jak dobrze zaczynasz się czuć. Jesteś wspaniała. 🌺",
                icon: "🌺",
                phase: .follicular,
                tone: .gentle
            ),
            Insight(
                title: "Dzień 8 - Otwartość na świat",
                message: "Zauważyłaś, że łatwiej Ci dzisiaj z ludźmi? To piękna część Twojego cyklu - możesz czerpać radość ze spotkań. Ale tylko jeśli chcesz. 💝",
                icon: "💝",
                phase: .follicular,
                tone: .gentle
            ),
            Insight(
                title: "Dzień 9 - Kreatywność płynie",
                message: "Twój umysł jest teraz otwarty i twórczy. Jeśli masz pomysły - zapisz je. Jeśli nie - to też pięknie. Nie ma presji, tylko możliwości. 🎨",
                icon: "🎨",
                phase: .follicular,
                tone: .gentle
            ),
            Insight(
                title: "Dzień 10 - W pełni siebie",
                message: "Czujesz się bardziej sobą? To nie przypadek. To Twoja naturalna moc, która zawsze w Tobie była. Teraz po prostu łatwiej ją zobaczyć. ✨",
                icon: "✨",
                phase: .follicular,
                tone: .gentle
            ),
            Insight(
                title: "Dzień 11 - Rośniesz w siłę",
                message: "Każdego dnia stajesz się silniejsza. To piękny proces - pozwól sobie go docenić. Nie musisz nic udowadniać. Jesteś już wystarczająca. 🌸",
                icon: "🌸",
                phase: .follicular,
                tone: .gentle
            ),
            Insight(
                title: "Dzień 12 - Przedświt szczytu",
                message: "Jutro będzie szczególny dzień. Ale już teraz jesteś piękna i pełna mocy. Pamiętaj o tym - niezależnie od fazy cyklu. 💫",
                icon: "💫",
                phase: .follicular,
                tone: .gentle
            ),
            Insight(
                title: "Dzień 13 - Gotowa na szczyt",
                message: "Jutro owulacja. Twoje ciało mądre i piękne wie, co robi. Zaufaj mu. Zaufaj sobie. Jesteś niesamowita właśnie taka, jaka jesteś. 🌟",
                icon: "🌟",
                phase: .follicular,
                tone: .gentle
            ),
            
            // Days 14-16: Ovulation
            Insight(
                title: "Dzień 14 - Rozkwit pełni",
                message: "Dzisiaj jesteś w pełni swoją mocą. Ale pamiętaj - jesteś wspaniała każdego dnia, nie tylko dziś. To tylko szczególnie łatwo to dzisiaj zauważyć. 💖",
                icon: "💖",
                phase: .ovulation,
                tone: .gentle
            ),
            Insight(
                title: "Dzień 15 - Promieniujesz",
                message: "Ludzie mogą zauważać Twoją energię. To piękne. Ale nawet jeśli nikt nie zauważy - jesteś równie cudowna. Twoja wartość nie zależy od oczu innych. ✨",
                icon: "✨",
                phase: .ovulation,
                tone: .gentle
            ),
            Insight(
                title: "Dzień 16 - Szczyt z wdzięcznością",
                message: "Ostatni dzień tego wyjątkowego okresu. Podziękuj swojemu ciału za to, jak dobrze się czujesz. Zasługuje na Twoją wdzięczność i miłość. 🙏",
                icon: "🙏",
                phase: .ovulation,
                tone: .gentle
            ),
            
            // Days 17-28: Luteal
            Insight(
                title: "Dzień 17 - Delikatna zmiana",
                message: "Zaczyna się nowa faza. Możesz czuć delikatną zmianę - to naturalne i piękne. Twoje ciało wie, co robi. Zaufaj mu z miłością. 🌙",
                icon: "🌙",
                phase: .luteal,
                tone: .gentle
            ),
            Insight(
                title: "Dzień 18 - Spokój w zmianie",
                message: "Energia może być niższa - to nie jest słabość. To mądrość Twojego ciała, które wie, kiedy potrzebuje więcej spokoju. Posłuchaj go czule. 💙",
                icon: "💙",
                phase: .luteal,
                tone: .gentle
            ),
            Insight(
                title: "Dzień 19 - Gniazdowanie z miłością",
                message: "Jeśli czujesz potrzebę bycia w domu, w spokoju - posłuchaj tego. To piękny instynkt Twojego ciała. Dom może być Twoją przystanią. 🏡",
                icon: "🏡",
                phase: .luteal,
                tone: .gentle
            ),
            Insight(
                title: "Dzień 20 - Łagodność dla siebie",
                message: "Jeśli dziś czujesz się wolniejsza, bardziej zmęczona - bądź dla siebie najłagodniejsza. Nie musisz być produktywna. Możesz po prostu być. 💕",
                icon: "💕",
                phase: .luteal,
                tone: .gentle
            ),
            Insight(
                title: "Dzień 21 - Tydzień przed",
                message: "Tydzień przed okresem. Twoje emocje mogą być bogatsze. To nie oznacza, że coś jest nie tak. Jesteś piękna w całej swojej złożoności. 🌸",
                icon: "🌸",
                phase: .luteal,
                tone: .gentle
            ),
            Insight(
                title: "Dzień 22 - Słuchaj swojego ciała",
                message: "Jeśli ciało prosi o coś konkretnego - jedzenie, odpoczynek, samotność - wysłuchaj go z czułością. Ono wie, czego potrzebuje. 🫶",
                icon: "🫶",
                phase: .luteal,
                tone: .gentle
            ),
            Insight(
                title: "Dzień 23 - Emocje to nie słabość",
                message: "Jeśli wszystko wydaje się bardziej intensywne - to nie jest Twoja wina. Twoje emocje są prawdziwe i ważne. Pozwól sobie je czuć. 💜",
                icon: "💜",
                phase: .luteal,
                tone: .gentle
            ),
            Insight(
                title: "Dzień 24 - Wrażliwość to piękno",
                message: "Twoja wrażliwość to dar, nie obciążenie. Jeśli dziś płaczesz łatwiej - to również jest w porządku. Jesteś człowiekiem z sercem. 🤍",
                icon: "🤍",
                phase: .luteal,
                tone: .gentle
            ),
            Insight(
                title: "Dzień 25 - Jeszcze kilka dni",
                message: "Wiem, że może być ciężko. Ale już niedługo. A przez te trudne dni? Bądź dla siebie tak dobra, jak dla osoby którą najbardziej kochasz. 🫂",
                icon: "🫂",
                phase: .luteal,
                tone: .gentle
            ),
            Insight(
                title: "Dzień 26 - Przygotuj się z miłością",
                message: "Okres niedługo. Przygotuj wszystko czego potrzebujesz - nie tylko produkty, ale też przestrzeń do odpoczynku. Dbasz o siebie. 🌺",
                icon: "🌺",
                phase: .luteal,
                tone: .gentle
            ),
            Insight(
                title: "Dzień 27 - Ostatnia prosta",
                message: "Jutro lub pojutrze. Już prawie jesteś. Przetrwałaś tyle - jesteś silniejsza niż myślisz. Pozwól sobie na extra łagodność. 🌙",
                icon: "🌙",
                phase: .luteal,
                tone: .gentle
            ),
            Insight(
                title: "Dzień 28 - Pełny cykl miłości",
                message: "Przeszłaś przez cały cykl. 28 dni zmian, wzlotów, wyzwań - i jesteś tu. Jesteś niesamowita. Zawsze byłaś. Zawsze będziesz. 💖",
                icon: "💖",
                phase: .luteal,
                tone: .gentle
            )
        ]
    }
    
    // TODO: Add Humorous and Direct tones (28 insights each)
    // For now, we can use these as templates and you can expand
    
    // MARK: - HUMOROUS TONE - 28 Days (Placeholder - uses Balanced for now)
    
    func getHumorousDailyInsights() -> [Insight] {
        // TODO: Create 28 humorous insights
        // For now, return balanced as placeholder
        return getBalancedDailyInsights().map { insight in
            Insight(
                title: insight.title,
                message: insight.message,
                icon: insight.icon,
                phase: insight.phase,
                tone: .humorous
            )
        }
    }
    
    // MARK: - DIRECT TONE - 28 Days (Placeholder - uses Balanced for now)
    
    func getDirectDailyInsights() -> [Insight] {
        // TODO: Create 28 direct insights
        // For now, return balanced as placeholder
        return getBalancedDailyInsights().map { insight in
            Insight(
                title: insight.title,
                message: insight.message,
                icon: insight.icon,
                phase: insight.phase,
                tone: .direct
            )
        }
    }
}
