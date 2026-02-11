import Foundation

struct Insight: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let icon: String
    let phase: CyclePhase
    let tone: CommunicationTone
}

class InsightService {
    
    // MARK: - Get Daily Insight (Main Method)
    
    func getDailyInsight(for cycle: Cycle, tone: CommunicationTone) -> Insight? {
        let dayInCycle = cycle.currentDayInCycle
        
        // Get all insights for this tone
        let allInsights: [Insight]
        
        switch tone {
        case .gentle:
            allInsights = getGentleDailyInsights()
        case .balanced:
            allInsights = getBalancedDailyInsights()
        case .humorous:
            allInsights = getHumorousDailyInsights()
        case .direct:
            allInsights = getDirectDailyInsights()
        }
        
        // Return insight for specific day (1-28)
        // If cycle is longer, it wraps around
        let index = (dayInCycle - 1) % allInsights.count
        return allInsights[index]
    }
    
    // MARK: - Legacy Support
    
    func getRandomInsight(for phase: CyclePhase, tone: CommunicationTone) -> Insight? {
        // Fallback for any legacy code
        let insights: [Insight]
        
        switch tone {
        case .gentle:
            insights = getGentleDailyInsights()
        case .balanced:
            insights = getBalancedDailyInsights()
        case .humorous:
            insights = getHumorousDailyInsights()
        case .direct:
            insights = getDirectDailyInsights()
        }
        
        return insights.filter { $0.phase == phase }.randomElement()
    }
    
    // MARK: - Partner Insights
    
    func getPartnerGuidance(for phase: CyclePhase) -> Insight {
        switch phase {
        case .menstrual:
            return Insight(
                title: "🫖 Bądź extra wyrozumiały",
                message: """
                To trudny okres. Pomóż:
                • Przynieś ciepły napój
                • Zaproponuj film lub serial
                • Nie naciskaj na wyjścia i plany
                • Pytaj "czego potrzebujesz?" zamiast "co ci jest?"
                • Po prostu bądź blisko
                
                Unikaj: poważnych rozmów, wymagania decyzji, pytania "czy to PMS?"
                """,
                icon: "🫖",
                phase: .menstrual,
                tone: .balanced
            )
            
        case .follicular:
            return Insight(
                title: "✨ Energia rośnie!",
                message: """
                Świetny czas na wspólne aktywności:
                • Zaplanuj ciekawą randkę
                • Wspieraj jej nowe pomysły
                • Dobry moment na rozmowy o planach
                • Zaproponuj wspólne projekty
                • Doceniaj jej energię i entuzjazm
                
                To jej "good days" - wykorzystajcie to razem!
                """,
                icon: "✨",
                phase: .follicular,
                tone: .balanced
            )
            
        case .ovulation:
            return Insight(
                title: "💫 Peak energy time!",
                message: """
                Najlepszy moment w całym cyklu:
                • Zaplanuj romantyczny wieczór 🌹
                • Dobry czas na ważne rozmowy
                • Jest pewna siebie - doceniaj to
                • Może weekendowy wyjazd?
                • Wspieraj jej pomysły
                
                To jej superbohaterskie dni - be her sidekick!
                """,
                icon: "💫",
                phase: .ovulation,
                tone: .balanced
            )
            
        case .luteal:
            return Insight(
                title: "🌙 Wyrozumiałość is key",
                message: """
                PMS incoming - jak pomóc:
                • Nie bierz wszystkiego do siebie
                • Może nie najlepszy moment na poważne tematy
                • Zaproponuj coś relaksującego
                • Pytaj czego potrzebuje
                • Extra cierpliwość i spokój
                
                To nie jest przeciwko Tobie - to hormony. Bądź wsparciem.
                """,
                icon: "🌙",
                phase: .luteal,
                tone: .balanced
            )
        }
    }
}
