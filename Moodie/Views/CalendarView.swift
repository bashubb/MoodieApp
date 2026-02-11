import SwiftUI

struct CalendarView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("📅 Kalendarz")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(Color(hex: "FF6B9D"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    if let cycle = appState.currentCycle {
                        CalendarGridView(cycle: cycle)
                    }
                }
                .padding(.vertical)
            }
            .background(Color(hex: "FFF9FB"))
            .navigationBarHidden(true)
        }
    }
}

struct CalendarGridView: View {
    let cycle: Cycle
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 7)
    private let weekDays = ["Pn", "Wt", "Śr", "Cz", "Pt", "So", "Nd"]
    
    var body: some View {
        VStack(spacing: 16) {
            // Month header
            HStack {
                Button(action: {}) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color(hex: "FF6B9D"))
                }
                
                Spacer()
                
                Text(Date().formatted(.dateTime.month(.wide).year()))
                    .font(.system(size: 20, weight: .semibold))
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color(hex: "FF6B9D"))
                }
            }
            .padding(.horizontal)
            
            // Weekday headers
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(weekDays, id: \.self) { day in
                    Text(day)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.secondary)
                }
            }
            .padding(.horizontal)
            
            // Calendar days (simplified)
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(1...31, id: \.self) { day in
                    CalendarDayCell(day: day, cycle: cycle)
                }
            }
            .padding(.horizontal)
            
            // Legend
            VStack(alignment: .leading, spacing: 8) {
                LegendItem(emoji: "🩸", text: "Menstruacja (1-5)")
                LegendItem(emoji: "🌸", text: "Faza folikularna (6-13)")
                LegendItem(emoji: "✨", text: "Owulacja (14-16)")
                LegendItem(emoji: "🌙", text: "Faza lutealna (17-28)")
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .padding(.horizontal)
        }
    }
}

struct CalendarDayCell: View {
    let day: Int
    let cycle: Cycle
    
    private var phase: CyclePhase {
        // Simplified - would need proper calculation based on actual date
        switch day {
        case 1...5: return .menstrual
        case 6...13: return .follicular
        case 14...16: return .ovulation
        default: return .luteal
        }
    }
    
    var body: some View {
        VStack(spacing: 4) {
            Text("\(day)")
                .font(.system(size: 16, weight: day == cycle.currentDayInCycle ? .bold : .regular))
                .foregroundColor(day == cycle.currentDayInCycle ? .white : .primary)
            
            Text(phase.emoji)
                .font(.system(size: 12))
        }
        .frame(width: 44, height: 44)
        .background(
            Circle()
                .fill(day == cycle.currentDayInCycle ? Color(hex: "FF6B9D") : Color.clear)
        )
    }
}

struct LegendItem: View {
    let emoji: String
    let text: String
    
    var body: some View {
        HStack(spacing: 8) {
            Text(emoji)
                .font(.system(size: 16))
            Text(text)
                .font(.system(size: 14))
                .foregroundColor(.secondary)
        }
    }
}
