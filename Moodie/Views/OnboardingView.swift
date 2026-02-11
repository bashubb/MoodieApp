import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var appState: AppState
    @State private var currentStep = 0
    @State private var selectedDate = Date()
    @State private var cycleLength = 28
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                colors: [Color(hex: "FF6B9D"), Color(hex: "FF8FB3")],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack {
                if currentStep == 0 {
                    WelcomeStep(onNext: { currentStep = 1 })
                } else if currentStep == 1 {
                    DatePickerStep(
                        selectedDate: $selectedDate,
                        onBack: { currentStep = 0 },
                        onNext: { currentStep = 2 }
                    )
                } else if currentStep == 2 {
                    CycleLengthStep(
                        cycleLength: $cycleLength,
                        onBack: { currentStep = 1 },
                        onNext: { currentStep = 3 }
                    )
                } else if currentStep == 3 {
                    ToneSelectionStep(
                        onBack: { currentStep = 2 },
                        onComplete: {
                            appState.completeOnboarding(
                                cycleStartDate: selectedDate,
                                cycleLength: cycleLength
                            )
                        }
                    )
                }
            }
        }
    }
}

// MARK: - Welcome Step

struct WelcomeStep: View {
    let onNext: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            // Animated logo
            Text("🌸")
                .font(.system(size: 100))
                .padding()
            
            Text("Moodie")
                .font(.system(size: 56, weight: .bold))
                .foregroundColor(.white)
            
            Text("Zrozum swój cykl.\nPoczuj się lepiej.")
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.white.opacity(0.9))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Spacer()
            
            VStack(spacing: 16) {
                Button(action: onNext) {
                    Text("Zacznij →")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color(hex: "FF6B9D"))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(16)
                }
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 50)
        }
    }
}

// MARK: - Date Picker Step

struct DatePickerStep: View {
    @Binding var selectedDate: Date
    let onBack: () -> Void
    let onNext: () -> Void
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Text("📅 Kiedy zaczęła się\nostatnia miesiączka?")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            DatePicker(
                "",
                selection: $selectedDate,
                displayedComponents: .date
            )
            .datePickerStyle(.graphical)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .shadow(radius: 10)
            )
            .padding(.horizontal, 32)
            
            Spacer()
            
            HStack(spacing: 12) {
                Button(action: onBack) {
                    Text("◀ Wstecz")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color(hex: "FF6B9D"))
                        .padding()
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(12)
                }
                
                Button(action: onNext) {
                    Text("Dalej →")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color(hex: "FF6B9D"))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 50)
        }
    }
}

// MARK: - Cycle Length Step

struct CycleLengthStep: View {
    @Binding var cycleLength: Int
    let onBack: () -> Void
    let onNext: () -> Void
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Text("📏 Jak długi jest\nTwój cykl?")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            // Cycle length picker
            HStack(spacing: 30) {
                Button(action: { if cycleLength > 21 { cycleLength -= 1 } }) {
                    Image(systemName: "minus.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                }
                
                Text("\(cycleLength)")
                    .font(.system(size: 72, weight: .bold))
                    .foregroundColor(.white)
                    .frame(minWidth: 120)
                
                Button(action: { if cycleLength < 35 { cycleLength += 1 } }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white.opacity(0.2))
            )
            
            Text("Nie wiesz? Średnia to 28\n(zawsze możesz zmienić)")
                .font(.system(size: 16))
                .foregroundColor(.white.opacity(0.8))
                .multilineTextAlignment(.center)
            
            Spacer()
            
            HStack(spacing: 12) {
                Button(action: onBack) {
                    Text("◀ Wstecz")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color(hex: "FF6B9D"))
                        .padding()
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(12)
                }
                
                Button(action: onNext) {
                    Text("Dalej →")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color(hex: "FF6B9D"))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 50)
        }
    }
}

// MARK: - Tone Selection Step

struct ToneSelectionStep: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedTone: CommunicationTone = .balanced
    @State private var selectedMascot: MoodieMascot = .mimi
    
    let onBack: () -> Void
    let onComplete: () -> Void
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Text("🎨 Wybierz swój styl")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.white)
            
            Text("Jak wolisz żeby Moodie się do Ciebie odzywała?")
                .font(.system(size: 16))
                .foregroundColor(.white.opacity(0.8))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            // Tone selection
            VStack(spacing: 12) {
                ForEach(CommunicationTone.allCases, id: \.self) { tone in
                    Button(action: { selectedTone = tone }) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                HStack {
                                    Text(tone.mascotMood)
                                        .font(.system(size: 24))
                                    Text(tone.rawValue)
                                        .font(.system(size: 18, weight: .semibold))
                                        .foregroundColor(.primary)
                                }
                                
                                Text(tone.description)
                                    .font(.system(size: 14))
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.leading)
                            }
                            
                            Spacer()
                            
                            if selectedTone == tone {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(Color(hex: "FF6B9D"))
                                    .font(.system(size: 24))
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.white)
                                .shadow(radius: selectedTone == tone ? 8 : 2)
                        )
                    }
                }
            }
            .padding(.horizontal, 32)
            
            // Mascot selection
            Text("Wybierz maskotkę")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
            
            HStack(spacing: 20) {
                ForEach(MoodieMascot.allCases, id: \.self) { mascot in
                    Button(action: { selectedMascot = mascot }) {
                        VStack {
                            Text(mascot.emoji)
                                .font(.system(size: 40))
                                .padding()
                                .background(
                                    Circle()
                                        .fill(selectedMascot == mascot ? Color.white : Color.white.opacity(0.3))
                                )
                            
                            Text(mascot.rawValue)
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            
            Spacer()
            
            HStack(spacing: 12) {
                Button(action: onBack) {
                    Text("◀ Wstecz")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color(hex: "FF6B9D"))
                        .padding()
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(12)
                }
                
                Button(action: {
                    appState.updateTone(selectedTone)
                    UserDefaults.standard.set(selectedMascot.rawValue, forKey: "selectedMascot")
                    onComplete()
                }) {
                    Text("Zacznij! →")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color(hex: "FF6B9D"))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 50)
        }
    }
}

// MARK: - Color Extension

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}
