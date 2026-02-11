import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Główna", systemImage: "house.fill")
                }
                .tag(0)
            
            CalendarView()
                .tabItem {
                    Label("Kalendarz", systemImage: "calendar")
                }
                .tag(1)
            
            PartnerView()
                .tabItem {
                    Label("Partner", systemImage: "person.2.fill")
                }
                .tag(2)
            
            SettingsView()
                .tabItem {
                    Label("Ustawienia", systemImage: "gearshape.fill")
                }
                .tag(3)
        }
        .accentColor(Color(hex: "FF6B9D"))
    }
}
