//
//  NavBar.swift
//  
//
//  Created by Ivann Galic on 04/06/2020.
//

import SwiftUI

struct NavBar: View {
    
    @State var pageSelected = 0
    
    var body: some View {
        TabView(selection: $pageSelected) {
            ContentView()
                .tabItem {
                    Image(systemName: "house")
            }.tag(0)
            Text("Recettes")
                .tabItem {
                    Image(systemName: "book")
            }.tag(1)
            Text("Add")
                .tabItem {
                    Image(systemName: "plus.circle")
            }.tag(2)
            Text("Paramètres")
                .tabItem {
                    Image(systemName: "slider.horizontal.3")
            }.tag(3)
        }
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}
