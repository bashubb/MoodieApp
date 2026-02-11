import Foundation

struct Cycle: Codable, Identifiable {
    let id: UUID
    let startDate: Date
    let length: Int
    
    init(id: UUID = UUID(), startDate: Date, length: Int) {
        self.id = id
        self.startDate = startDate
        self.length = length
    }
    
    var currentPhase: CyclePhase {
        let dayInCycle = currentDayInCycle
        
        switch dayInCycle {
        case 1...5:
            return .menstrual
        case 6...13:
            return .follicular
        case 14...16:
            return .ovulation
        case 17...length:
            return .luteal
        default:
            return .follicular
        }
    }
    
    var currentDayInCycle: Int {
        let daysSinceStart = Calendar.current.dateComponents([.day], from: startDate, to: Date()).day ?? 0
        let day = (daysSinceStart % length) + 1
        return day
    }
    
    var daysInCurrentPhase: Int {
        switch currentPhase {
        case .menstrual:
            return currentDayInCycle
        case .follicular:
            return currentDayInCycle - 5
        case .ovulation:
            return currentDayInCycle - 13
        case .luteal:
            return currentDayInCycle - 16
        }
    }
    
    var phaseDuration: Int {
        switch currentPhase {
        case .menstrual:
            return 5
        case .follicular:
            return 8
        case .ovulation:
            return 3
        case .luteal:
            return length - 16
        }
    }
    
    var nextPeriodDate: Date {
        let daysUntilNext = length - currentDayInCycle + 1
        return Calendar.current.date(byAdding: .day, value: daysUntilNext, to: Date()) ?? Date()
    }
    
    var daysUntilNextPeriod: Int {
        Calendar.current.dateComponents([.day], from: Date(), to: nextPeriodDate).day ?? 0
    }
}

enum CyclePhase: String, Codable {
    case menstrual = "Menstruacja"
    case follicular = "Faza folikularna"
    case ovulation = "Owulacja"
    case luteal = "Faza lutealna"
    
    var emoji: String {
        switch self {
        case .menstrual: return "🩸"
        case .follicular: return "🌸"
        case .ovulation: return "✨"
        case .luteal: return "🌙"
        }
    }
    
    var color: String {
        switch self {
        case .menstrual: return "#FF4D4D"
        case .follicular: return "#FFB3D9"
        case .ovulation: return "#FFD700"
        case .luteal: return "#9B59B6"
        }
    }
    
    var description: String {
        switch self {
        case .menstrual:
            return "Twoje ciało odbudowuje się. To czas na odpoczynek i regenerację."
        case .follicular:
            return "Energia rośnie! Hormony podnoszą Twój nastrój i motywację."
        case .ovulation:
            return "Szczyt energii i pewności siebie. Wykorzystaj to!"
        case .luteal:
            return "Ciało przygotowuje się do kolejnego cyklu. Wyrozumiałość dla siebie jest kluczowa."
        }
    }
}
