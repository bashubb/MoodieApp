import Foundation

enum MoodieMascot: String, CaseIterable {
    case mimi = "Mimi" // Main mascot - różowa kulka
    case luna = "Luna" // Alternative - księżycowa
    case blossom = "Blossom" // Alternative - kwiatowa
    
    var emoji: String {
        switch self {
        case .mimi:
            return "🌸"
        case .luna:
            return "🌙"
        case .blossom:
            return "💮"
        }
    }
    
    var description: String {
        switch self {
        case .mimi:
            return "Mimi to Twoja różowa towarzyszka, która zawsze Cię wspiera z empatią i humorem."
        case .luna:
            return "Luna, spokojna i mądra, pomaga Ci zrozumieć cykl i być w zgodzie z sobą."
        case .blossom:
            return "Blossom, energiczna i motywująca, dodaje Ci skrzydeł w dobrych dniach."
        }
    }
    
    // Mascot reactions based on phase
    func reaction(for phase: CyclePhase) -> String {
        switch (self, phase) {
        case (.mimi, .menstrual):
            return "💜 Mimi wie, że teraz jest ciężko. Przytula Cię wirtualnie!"
        case (.mimi, .follicular):
            return "✨ Mimi widzi Twoją rosnącą energię i kibicuje!"
        case (.mimi, .ovulation):
            return "👑 Mimi krzyczy: QUEEN! Bo jesteś!"
        case (.mimi, .luteal):
            return "🫂 Mimi przypomina: to tylko hormony, jesteś super!"
            
        case (.luna, .menstrual):
            return "🌙 Luna szepcze: odpoczynek to siła, nie słabość"
        case (.luna, .follicular):
            return "🌱 Luna mówi: czas kiełkować i rosnąć!"
        case (.luna, .ovulation):
            return "🌕 Luna w pełni - tak jak Twoja energia!"
        case (.luna, .luteal):
            return "🌘 Luna przypomina: każda faza się kończy"
            
        case (.blossom, .menstrual):
            return "🌺 Blossom mówi: nawet kwiaty potrzebują zimy"
        case (.blossom, .follicular):
            return "🌸 Blossom: czas zakwitać!"
        case (.blossom, .ovulation):
            return "🌼 Blossom tańczy - masz moc!"
        case (.blossom, .luteal):
            return "🥀 Blossom: każdy sezon ma swoje piękno"
        }
    }
    
    // Mascot daily greeting
    func greeting(hour: Int) -> String {
        let timeOfDay: String
        
        switch hour {
        case 5..<12:
            timeOfDay = "Dzień dobry"
        case 12..<17:
            timeOfDay = "Cześć"
        case 17..<22:
            timeOfDay = "Dobry wieczór"
        default:
            timeOfDay = "Hej"
        }
        
        switch self {
        case .mimi:
            return "\(emoji) \(timeOfDay)! Jak się dziś czujesz?"
        case .luna:
            return "\(emoji) \(timeOfDay), moja droga"
        case .blossom:
            return "\(emoji) \(timeOfDay)! Gotowa na dzień?"
        }
    }
}
