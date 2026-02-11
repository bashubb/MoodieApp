import Foundation

enum CommunicationTone: String, Codable, CaseIterable {
    case gentle = "Delikatny"
    case balanced = "Zbalansowany"
    case humorous = "Z humorem"
    case direct = "Bezpośredni"
    
    var description: String {
        switch self {
        case .gentle:
            return "Łagodne, wspierające komunikaty pełne empatii"
        case .balanced:
            return "Mix wsparcia i motywacji z odrobiną humoru"
        case .humorous:
            return "Lekki, zabawny ton z dużą dawką humoru"
        case .direct:
            return "Konkretnie i na temat, bez owijania w bawełnę"
        }
    }
    
    var mascotMood: String {
        switch self {
        case .gentle:
            return "🌸"
        case .balanced:
            return "💜"
        case .humorous:
            return "😄"
        case .direct:
            return "💪"
        }
    }
}
