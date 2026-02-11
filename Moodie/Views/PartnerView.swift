import SwiftUI
import CoreImage.CIFilterBuiltins

struct PartnerView: View {
    @EnvironmentObject var appState: AppState
    @State private var showQRCode = false
    @State private var partnerCode = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    Text("👫 Partner")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(Color(hex: "FF6B9D"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    if showQRCode {
                        QRCodeSharingView(
                            cycle: appState.currentCycle!,
                            code: partnerCode,
                            onCancel: { showQRCode = false }
                        )
                    } else {
                        PartnerSetupView(onGenerateCode: {
                            partnerCode = generatePartnerCode()
                            showQRCode = true
                        })
                    }
                }
                .padding(.vertical)
            }
            .background(Color(hex: "FFF9FB"))
            .navigationBarHidden(true)
        }
    }
    
    private func generatePartnerCode() -> String {
        String(format: "%06d", Int.random(in: 100000...999999))
    }
}

// MARK: - Partner Setup View

struct PartnerSetupView: View {
    let onGenerateCode: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            // Info box
            VStack(alignment: .leading, spacing: 12) {
                Text("Partner dostanie:")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.primary)
                
                InfoItem(isPositive: true, text: "Info o fazie cyklu")
                InfoItem(isPositive: true, text: "Wskazówki jak Cię wesprzeć")
                InfoItem(isPositive: false, text: "Szczegóły i notatki")
                
                Text("To bezpieczne - masz pełną kontrolę!")
                    .font(.system(size: 13))
                    .foregroundColor(.secondary)
                    .padding(.top, 4)
            }
            .padding(20)
            .background(Color(hex: "FFF3F8"))
            .cornerRadius(16)
            .padding(.horizontal)
            
            // Generate button
            Button(action: onGenerateCode) {
                HStack {
                    Image(systemName: "qrcode")
                        .font(.system(size: 20))
                    Text("Wygeneruj kod QR")
                        .font(.system(size: 18, weight: .semibold))
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    LinearGradient(
                        colors: [Color(hex: "FF6B9D"), Color(hex: "FF8FB3")],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(16)
            }
            .padding(.horizontal)
            
            // How it works
            VStack(alignment: .leading, spacing: 16) {
                Text("Jak to działa?")
                    .font(.system(size: 18, weight: .semibold))
                
                StepItem(number: 1, text: "Partner musi mieć Moodie zainstalowane")
                StepItem(number: 2, text: "Pokażesz mu kod QR lub wyślesz 6-cyfrowy kod")
                StepItem(number: 3, text: "Partner skanuje/wpisuje i gotowe!")
            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(16)
            .padding(.horizontal)
        }
    }
}

// MARK: - QR Code Sharing View

struct QRCodeSharingView: View {
    let cycle: Cycle
    let code: String
    let onCancel: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Partner musi mieć Moodie zainstalowane!")
                .font(.system(size: 16))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // QR Code
            if let qrImage = generateQRCode(from: createPartnerData()) {
                Image(uiImage: qrImage)
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 220)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 10)
            }
            
            // Code display
            VStack(spacing: 12) {
                Text("lub kod:")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                
                Text(formatCode(code))
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(Color(hex: "FF6B9D"))
                    .tracking(4)
                
                Button(action: {
                    UIPasteboard.general.string = code
                }) {
                    HStack {
                        Image(systemName: "doc.on.doc")
                        Text("Skopiuj kod")
                    }
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color(hex: "FF6B9D"))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background(Color(hex: "FFE5F0"))
                    .cornerRadius(12)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .padding(.horizontal)
            
            Text("Kod ważny 24h")
                .font(.system(size: 13))
                .foregroundColor(.secondary)
            
            // Cancel button
            Button(action: onCancel) {
                HStack {
                    Image(systemName: "xmark.circle")
                    Text("Anuluj połączenie")
                }
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .cornerRadius(16)
            }
            .padding(.horizontal)
        }
    }
    
    private func formatCode(_ code: String) -> String {
        let index = code.index(code.startIndex, offsetBy: 3)
        return code.prefix(upTo: index) + " " + code.suffix(from: index)
    }
    
    private func createPartnerData() -> String {
        let data: [String: Any] = [
            "cycleStart": cycle.startDate.timeIntervalSince1970,
            "cycleLength": cycle.length,
            "code": code,
            "expires": Date().addingTimeInterval(86400).timeIntervalSince1970 // 24h
        ]
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: data),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            return jsonString
        }
        return ""
    }
    
    private func generateQRCode(from string: String) -> UIImage? {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        
        filter.message = Data(string.utf8)
        filter.correctionLevel = "M"
        
        if let outputImage = filter.outputImage {
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let scaledImage = outputImage.transformed(by: transform)
            
            if let cgImage = context.createCGImage(scaledImage, from: scaledImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }
        
        return nil
    }
}

// MARK: - Helper Views

struct InfoItem: View {
    let isPositive: Bool
    let text: String
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: isPositive ? "checkmark.circle.fill" : "xmark.circle.fill")
                .foregroundColor(isPositive ? Color(hex: "FF6B9D") : .gray)
            Text(text)
                .font(.system(size: 15))
                .foregroundColor(.primary)
        }
    }
}

struct StepItem: View {
    let number: Int
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Text("\(number)")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .frame(width: 32, height: 32)
                .background(
                    Circle()
                        .fill(Color(hex: "FF6B9D"))
                )
            
            Text(text)
                .font(.system(size: 15))
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}
