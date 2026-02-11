import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedMascot: MoodieMascot
    
    init() {
        let mascotString = UserDefaults.standard.string(forKey: "selectedMascot") ?? "Mimi"
        _selectedMascot = State(initialValue: MoodieMascot(rawValue: mascotString) ?? .mimi)
    }
    
    var body: some View {
        NavigationView {
            List {
                // Tone Section
                Section {
                    ForEach(CommunicationTone.allCases, id: \.self) { tone in
                        Button(action: {
                            appState.updateTone(tone)
                        }) {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    HStack {
                                        Text(tone.mascotMood)
                                        Text(tone.rawValue)
                                            .foregroundColor(.primary)
                                            .font(.system(size: 16, weight: .medium))
                                    }
                                    
                                    Text(tone.description)
                                        .font(.system(size: 13))
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                if appState.selectedTone == tone {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(Color(hex: "FF6B9D"))
                                }
                            }
                        }
                    }
                } header: {
                    Text("Ton komunikacji")
                }
                
                // Mascot Section
                Section {
                    ForEach(MoodieMascot.allCases, id: \.self) { mascot in
                        Button(action: {
                            selectedMascot = mascot
                            UserDefaults.standard.set(mascot.rawValue, forKey: "selectedMascot")
                        }) {
                            HStack {
                                Text(mascot.emoji)
                                    .font(.system(size: 24))
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(mascot.rawValue)
                                        .foregroundColor(.primary)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                    Text(mascot.description)
                                        .font(.system(size: 13))
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                if selectedMascot == mascot {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(Color(hex: "FF6B9D"))
                                }
                            }
                        }
                    }
                } header: {
                    Text("Maskotka")
                }
                
                // Cycle Settings
                Section {
                    NavigationLink(destination: CycleSettingsView()) {
                        Label("Dane cyklu", systemImage: "calendar")
                    }
                    
                    NavigationLink(destination: NotificationSettingsView()) {
                        Label("Powiadomienia", systemImage: "bell")
                    }
                } header: {
                    Text("Cykl")
                }
                
                // Account
                Section {
                    Button(action: {}) {
                        Label("Polityka prywatności", systemImage: "hand.raised")
                    }
                    
                    Button(action: {}) {
                        Label("Warunki użytkowania", systemImage: "doc.text")
                    }
                    
                    Button(action: {}) {
                        Label("Skontaktuj się z nami", systemImage: "envelope")
                    }
                } header: {
                    Text("Pomoc")
                }
                
                // Version
                Section {
                    HStack {
                        Text("Wersja")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Ustawienia")
            .listStyle(InsetGroupedListStyle())
        }
    }
}

// MARK: - Cycle Settings View

struct CycleSettingsView: View {
    @EnvironmentObject var appState: AppState
    @State private var cycleStartDate: Date
    @State private var cycleLength: Int
    
    init() {
        let cycle = AppState().currentCycle ?? Cycle(startDate: Date(), length: 28)
        _cycleStartDate = State(initialValue: cycle.startDate)
        _cycleLength = State(initialValue: cycle.length)
    }
    
    var body: some View {
        Form {
            Section {
                DatePicker(
                    "Ostatnia miesiączka",
                    selection: $cycleStartDate,
                    displayedComponents: .date
                )
            } header: {
                Text("Data początkowa")
            }
            
            Section {
                Stepper(value: $cycleLength, in: 21...35) {
                    HStack {
                        Text("Długość cyklu")
                        Spacer()
                        Text("\(cycleLength) dni")
                            .foregroundColor(.secondary)
                    }
                }
            } header: {
                Text("Parametry")
            } footer: {
                Text("Standardowa długość cyklu to 21-35 dni. Średnia to 28 dni.")
            }
            
            Section {
                Button("Zapisz zmiany") {
                    let newCycle = Cycle(startDate: cycleStartDate, length: cycleLength)
                    appState.currentCycle = newCycle
                    
                    if let encoded = try? JSONEncoder().encode(newCycle) {
                        UserDefaults.standard.set(encoded, forKey: "currentCycle")
                    }
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(Color(hex: "FF6B9D"))
            }
        }
        .navigationTitle("Dane cyklu")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Notification Settings View

struct NotificationSettingsView: View {
    @State private var notificationsEnabled = true
    @State private var morningTime = Date()
    @State private var eveningTime = Date()
    
    var body: some View {
        Form {
            Section {
                Toggle("Powiadomienia", isOn: $notificationsEnabled)
            }
            
            if notificationsEnabled {
                Section {
                    DatePicker(
                        "Poranne",
                        selection: $morningTime,
                        displayedComponents: .hourAndMinute
                    )
                    
                    DatePicker(
                        "Wieczorne",
                        selection: $eveningTime,
                        displayedComponents: .hourAndMinute
                    )
                } header: {
                    Text("Czas powiadomień")
                }
                
                Section {
                    Toggle("Przypomnienia o fazie", isOn: .constant(true))
                    Toggle("Wskazówki dla partnera", isOn: .constant(true))
                    Toggle("Edukacyjne treści", isOn: .constant(true))
                } header: {
                    Text("Rodzaje powiadomień")
                }
            }
        }
        .navigationTitle("Powiadomienia")
        .navigationBarTitleDisplayMode(.inline)
    }
}
