import SwiftUI

struct ContentView: View {
    @Binding var isLoggedin: Bool
    @State private var selectedTab = 0

    var body: some View {
        ZStack {
            Color(red: 247/255, green: 236/255, blue: 216/255, opacity: 1)
                .ignoresSafeArea()

            TabView(selection: $selectedTab) {
                // Home Tab
                NavigationView {
                    HomeView(isLoggedin: $isLoggedin)
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button("Logout") {
                                    isLoggedin = false
                                }
                                .foregroundColor(.blue)
                            }
                        }
                }
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)

                // Pinturas Tab
                NavigationView {
                    PaintingsView()
                }
                .tabItem {
                    Label("Busqueda", systemImage: "magnifyingglass")
                }
                .tag(1)

                // QR Tab
                NavigationView {
                    QRView()
                }
                .tabItem {
                    Label("QR", systemImage: "qrcode")
                }
                .tag(2)

                // Mapa Tab
                NavigationView {
                    MapaView()
                }
                .tabItem {
                    Label("Mapa", systemImage: "map.fill")
                }
                .tag(3)
            }
            .accentColor(Color(red: 132/255, green: 3/255, blue: 12/255, opacity: 1)) // Color del ícono seleccionado
            .onAppear {
                // Cambiar el color de los íconos no seleccionados
                UITabBar.appearance().unselectedItemTintColor = UIColor(red: 209/255, green: 170/255, blue: 101/255, alpha: 1)
            }
        }
    }
}
