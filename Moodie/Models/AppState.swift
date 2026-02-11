import SwiftUI
import Combine

class AppState: ObservableObject {
    @Published var hasCompletedOnboarding: Bool
    @Published var currentCycle: Cycle?
    @Published var selectedTone: CommunicationTone
    
    init() {
        self.hasCompletedOnboarding = UserDefaults.standard.bool(forKey: "hasCompletedOnboarding")
        self.selectedTone = CommunicationTone(rawValue: UserDefaults.standard.string(forKey: "communicationTone") ?? "") ?? .balanced
        
        // Load current cycle
        if let cycleData = UserDefaults.standard.data(forKey: "currentCycle"),
           let cycle = try? JSONDecoder().decode(Cycle.self, from: cycleData) {
            self.currentCycle = cycle
        }
    }
    
    func completeOnboarding(cycleStartDate: Date, cycleLength: Int) {
        let cycle = Cycle(startDate: cycleStartDate, length: cycleLength)
        self.currentCycle = cycle
        self.hasCompletedOnboarding = true
        
        UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
        if let encoded = try? JSONEncoder().encode(cycle) {
            UserDefaults.standard.set(encoded, forKey: "currentCycle")
        }
    }
    
    func updateTone(_ tone: CommunicationTone) {
        self.selectedTone = tone
        UserDefaults.standard.set(tone.rawValue, forKey: "communicationTone")
    }
}
