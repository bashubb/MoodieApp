import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState: AppState
    
    private var insightService = InsightService()
    
    private var selectedMascot: MoodieMascot {
        let mascotString = UserDefaults.standard.string(forKey: "selectedMascot") ?? "Mimi"
        return MoodieMascot(rawValue: mascotString) ?? .mimi
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Header
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Moodie")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(Color(hex: "FF6B9D"))
                            
                            if let cycle = appState.currentCycle {
                                Text(selectedMascot.greeting(hour: Calendar.current.component(.hour, from: Date())))
                                    .font(.system(size: 16))
                                    .foregroundColor(.secondary)
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    if let cycle = appState.currentCycle {
                        // Cycle Card
                        CycleCardView(cycle: cycle, mascot: selectedMascot)
                        
                        // Daily Insight - unique for each day of cycle
                        if let insight = insightService.getDailyInsight(
                            for: cycle,
                            tone: appState.selectedTone
                        ) {
                            InsightCardView(insight: insight, dayInCycle: cycle.currentDayInCycle)
                        }
                        
                        // Phase Education
                        PhaseEducationCard(phase: cycle.currentPhase)
                        
                        // Next Period Prediction
                        NextPeriodCard(cycle: cycle)
                    }
                }
                .padding(.vertical)
            }
            .background(Color(hex: "FFF9FB"))
            .navigationBarHidden(true)
        }
    }
}

// MARK: - Cycle Card

struct CycleCardView: View {
    let cycle: Cycle
    let mascot: MoodieMascot
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(cycle.currentPhase.emoji) Dzień \(cycle.currentDayInCycle)/\(cycle.length)")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white.opacity(0.9))
                    
                    Text(cycle.currentPhase.rawValue)
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
            
            // Progress Ring
            ZStack {
                Circle()
                    .stroke(Color.white.opacity(0.3), lineWidth: 12)
                    .frame(width: 140, height: 140)
                
                Circle()
                    .trim(from: 0, to: CGFloat(cycle.daysInCurrentPhase) / CGFloat(cycle.phaseDuration))
                    .stroke(Color.white, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                    .frame(width: 140, height: 140)
                    .rotationEffect(.degrees(-90))
                
                VStack(spacing: 4) {
                    Text("\(cycle.daysInCurrentPhase)/\(cycle.phaseDuration)")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("dni")
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.8))
                }
            }
            
            // Mascot reaction
            Text(mascot.reaction(for: cycle.currentPhase))
                .font(.system(size: 15))
                .foregroundColor(.white.opacity(0.9))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .padding(24)
        .background(
            LinearGradient(
                colors: [Color(hex: "FF6B9D"), Color(hex: "FF8FB3")],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(24)
        .shadow(color: Color(hex: "FF6B9D").opacity(0.3), radius: 15, y: 10)
        .padding(.horizontal)
    }
}

// MARK: - Insight Card

struct InsightCardView: View {
    let insight: Insight
    let dayInCycle: Int
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .top, spacing: 12) {
                Text(insight.icon)
                    .font(.system(size: 36))
                
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text(insight.title)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.primary)
                        
                        Spacer()
                        
                        Text("Dzień \(dayInCycle)")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(Color(hex: "FF6B9D"))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(Color(hex: "FFE5F0"))
                            .cornerRadius(8)
                    }
                    
                    Text(insight.message)
                        .font(.system(size: 15))
                        .foregroundColor(.secondary)
                        .lineLimit(isExpanded ? nil : 4)
                }
                
                Spacer()
            }
            
            if insight.message.count > 150 {
                Button(action: { withAnimation { isExpanded.toggle() } }) {
                    Text(isExpanded ? "Zwiń" : "Czytaj więcej →")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color(hex: "FF6B9D"))
                }
            }
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.08), radius: 10, y: 5)
        .padding(.horizontal)
    }
}

// MARK: - Phase Education Card

struct PhaseEducationCard: View {
    let phase: CyclePhase
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "book.fill")
                    .foregroundColor(Color(hex: "FF6B9D"))
                Text("Co się teraz dzieje?")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.primary)
            }
            
            Text(phase.description)
                .font(.system(size: 15))
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
            
            NavigationLink(destination: PhaseDetailView(phase: phase)) {
                Text("Dowiedz się więcej →")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color(hex: "FF6B9D"))
            }
        }
        .padding(20)
        .background(Color(hex: "FFF3F8"))
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

// MARK: - Next Period Card

struct NextPeriodCard: View {
    let cycle: Cycle
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Następna miesiączka")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.secondary)
                
                Text("za \(cycle.daysUntilNextPeriod) dni")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.primary)
                
                Text(cycle.nextPeriodDate.formatted(date: .long, time: .omitted))
                    .font(.system(size: 13))
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "calendar.badge.clock")
                .font(.system(size: 40))
                .foregroundColor(Color(hex: "FF6B9D").opacity(0.5))
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.05), radius: 5, y: 2)
        .padding(.horizontal)
    }
}

// MARK: - Phase Detail View (Placeholder)

struct PhaseDetailView: View {
    let phase: CyclePhase
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(phase.emoji)
                    .font(.system(size: 80))
                    .frame(maxWidth: .infinity)
                    .padding()
                
                Text(phase.rawValue)
                    .font(.system(size: 32, weight: .bold))
                    .padding(.horizontal)
                
                Text(phase.description)
                    .font(.system(size: 18))
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                // Add more educational content here
                
                Spacer()
            }
            .padding(.vertical)
        }
        .background(Color(hex: "FFF9FB"))
        .navigationTitle("O fazie")
        .navigationBarTitleDisplayMode(.inline)
    }
}
