//
//  lab02App.swift
//  lab02
//
//  Created by Lucely Mendoza on 1/10/24.
//

import SwiftUI

@main
struct LAB02App: App {
    @State var isLoggedin: Bool = false
    
    init() {
            UITabBar.appearance().backgroundColor = UIColor(red: 247/255, green: 236/255, blue: 216/255, alpha: 1) // Color de fondo RGBA
            UITabBar.appearance().tintColor = UIColor(red: 132/255, green: 3/255, blue: 12/255, alpha: 1) // Color del ícono seleccionado RGBA
            UITabBar.appearance().unselectedItemTintColor = UIColor.gray // Color de los íconos no seleccionados
        }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if isLoggedin {
                    ContentView(isLoggedin: $isLoggedin)
                } else {
                    LoginView(isLoggedin: $isLoggedin)
                }
            }
        }
    }
}
