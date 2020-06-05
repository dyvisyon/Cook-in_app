//
//  NavBar.swift
//  
//
//  Created by Ivann Galic on 04/06/2020.
//

import SwiftUI

struct NavBar: View {
    
    @State var pageSelected = 0
    init() {
        UITabBar.appearance().barTintColor = UIColor.white
    }
    var body: some View {
        
        TabView(selection: $pageSelected) {
            ContentView()
                .tabItem {
                    Image(systemName: "house").font(.system(size: 18))
            }.tag(0)
            MesRecettes()
                .tabItem {
                    Image(systemName: "book").font(.system(size: 18))
            }.tag(1)
            CreerUneRecette()
                .tabItem {
                    Image(systemName: "plus.circle").font(.system(size: 18))
            }.tag(2)
            Text("Paramètres")
                .tabItem {
                    Image(systemName: "slider.horizontal.3").font(.system(size: 18))
            }.tag(3)
        } .accentColor(Color(red: 0.941, green: 0.502, blue: 0.447))
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}
