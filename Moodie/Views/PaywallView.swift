//import SwiftUI
//
//struct PaywallView: View {
//    @Environment(\.dismiss) var dismiss
//    @EnvironmentObject var appState: AppState
//    @State private var selectedOption: SubscriptionOption = .yearly
//    
//    enum SubscriptionOption {
//        case weekly, yearly
//    }
//    
//    var body: some View {
//        ZStack {
//            // Background
//            Color(hex: "FFF9FB")
//                .ignoresSafeArea()
//            
//            ScrollView {
//                VStack(spacing: 24) {
//                    // Close button
//                    HStack {
//                        Spacer()
//                        Button(action: { dismiss() }) {
//                            Image(systemName: "xmark")
//                                .font(.system(size: 20, weight: .semibold))
//                                .foregroundColor(.secondary)
//                                .padding()
//                                .background(Color.white)
//                                .clipShape(Circle())
//                        }
//                    }
//                    .padding(.horizontal)
//                    
//                    // Header
//                    VStack(spacing: 12) {
//                        Text("✨")
//                            .font(.system(size: 60))
//                        
//                        Text("Trial się kończy")
//                            .font(.system(size: 32, weight: .bold))
//                            .foregroundColor(.primary)
//                        
//                        Text("Kontynuuj swoją podróż z Moodie")
//                            .font(.system(size: 18))
//                            .foregroundColor(.secondary)
//                    }
//                    
//                    // Features
//                    VStack(alignment: .leading, spacing: 16) {
//                        FeatureRow(icon: "sparkles", text: "Codzienne wskazówki")
//                        FeatureRow(icon: "book.fill", text: "Edukacja o cyklu")
//                        FeatureRow(icon: "person.2.fill", text: "Sync z partnerem")
//                        FeatureRow(icon: "calendar", text: "Kalendarz i predykcje")
//                    }
//                    .padding(24)
//                    .background(Color.white)
//                    .cornerRadius(20)
//                    .padding(.horizontal)
//                    
//                    // Subscription options
//                    VStack(spacing: 12) {
//                        // Yearly (recommended)
//                        SubscriptionCard(
//                            isSelected: selectedOption == .yearly,
//                            isBest: true,
//                            price: "$39.99",
//                            period: "/rok",
//                            savings: "OSZCZĘDZASZ 85% • $3.33/miesiąc",
//                            action: { selectedOption = .yearly }
//                        )
//                        
//                        // Weekly
//                        SubscriptionCard(
//                            isSelected: selectedOption == .weekly,
//                            isBest: false,
//                            price: "$4.99",
//                            period: "/tydzień",
//                            savings: nil,
//                            action: { selectedOption = .weekly }
//                        )
//                    }
//                    .padding(.horizontal)
//                    
//                    // Subscribe button
//                    Button(action: {
//                        // Handle subscription
//                        appState.hasActiveSubscription = true
//                        UserDefaults.standard.set(true, forKey: "hasActiveSubscription")
//                        dismiss()
//                    }) {
//                        Text("Rozpocznij subskrypcję")
//                            .font(.system(size: 18, weight: .bold))
//                            .foregroundColor(.white)
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(
//                                LinearGradient(
//                                    colors: [Color(hex: "FF6B9D"), Color(hex: "FF8FB3")],
//                                    startPoint: .leading,
//                                    endPoint: .trailing
//                                )
//                            )
//                            .cornerRadius(16)
//                    }
//                    .padding(.horizontal)
//                    
//                    // Footer
//                    VStack(spacing: 12) {
//                        Text("Anuluj kiedy chcesz")
//                            .font(.system(size: 14))
//                            .foregroundColor(.secondary)
//                        
//                        Button(action: {}) {
//                            Text("Przywróć zakup")
//                                .font(.system(size: 14, weight: .medium))
//                                .foregroundColor(Color(hex: "FF6B9D"))
//                        }
//                        
//                        HStack(spacing: 16) {
//                            Button("Warunki") {}
//                            Text("•")
//                            Button("Prywatność") {}
//                        }
//                        .font(.system(size: 13))
//                        .foregroundColor(.secondary)
//                    }
//                    .padding(.bottom, 40)
//                }
//                .padding(.top, 20)
//            }
//        }
//    }
//}
//
//// MARK: - Feature Row
//
//struct FeatureRow: View {
//    let icon: String
//    let text: String
//    
//    var body: some View {
//        HStack(spacing: 16) {
//            Image(systemName: icon)
//                .font(.system(size: 20))
//                .foregroundColor(Color(hex: "FF6B9D"))
//                .frame(width: 32)
//            
//            Text(text)
//                .font(.system(size: 16))
//                .foregroundColor(.primary)
//            
//            Spacer()
//            
//            Image(systemName: "checkmark")
//                .font(.system(size: 16, weight: .bold))
//                .foregroundColor(Color(hex: "FF6B9D"))
//        }
//    }
//}
//
//// MARK: - Subscription Card
//
//struct SubscriptionCard: View {
//    let isSelected: Bool
//    let isBest: Bool
//    let price: String
//    let period: String
//    let savings: String?
//    let action: () -> Void
//    
//    var body: some View {
//        Button(action: action) {
//            VStack(alignment: .leading, spacing: 8) {
//                if isBest {
//                    HStack {
//                        Spacer()
//                        Text("NAJLEPSZY")
//                            .font(.system(size: 12, weight: .bold))
//                            .foregroundColor(.white)
//                            .padding(.horizontal, 12)
//                            .padding(.vertical, 6)
//                            .background(Color(hex: "FF6B9D"))
//                            .cornerRadius(12)
//                    }
//                }
//                
//                HStack(alignment: .firstTextBaseline, spacing: 4) {
//                    Text(price)
//                        .font(.system(size: 36, weight: .bold))
//                        .foregroundColor(.primary)
//                    
//                    Text(period)
//                        .font(.system(size: 16))
//                        .foregroundColor(.secondary)
//                }
//                
//                if let savings = savings {
//                    Text(savings)
//                        .font(.system(size: 14, weight: .semibold))
//                        .foregroundColor(Color(hex: "FF6B9D"))
//                }
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .padding(20)
//            .background(
//                RoundedRectangle(cornerRadius: 16)
//                    .fill(isBest ? Color(hex: "FFF9FB") : Color.white)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 16)
//                            .stroke(
//                                isSelected ? Color(hex: "FF6B9D") : Color.gray.opacity(0.2),
//                                lineWidth: isSelected ? 3 : 1
//                            )
//                    )
//            )
//        }
//        .buttonStyle(PlainButtonStyle())
//    }
//}
//
//struct PaywallView_Previews: PreviewProvider {
//    static var previews: some View {
//        PaywallView()
//            .environmentObject(AppState())
//    }
//}
