//
//  ContentView.swift
//  Cook'in
//
//  Created by Kevin on 04/06/2020.
//  Copyright © 2020 Kevin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 145, height: 45, alignment: .center)
                }
                .padding(.bottom, 20)
                ZStack {
                    HStack {
                        Image("bandeau")
                            .resizable()
                            .frame(height: 160, alignment: .center)
                    }
                    HStack {
                        Text("Bienvenue")
                            .font(.custom("Michella Garden", size: 95
                                ))
                            .shadow(radius: 10)
                            .padding()
                            .foregroundColor(.white)
                        
                    }.zIndex(1)
                }
                                Spacer()
                VStack {
                    NavigationLink(destination: CreerUneRecette()) {
                        Image("notebook_rond")
                            .resizable()
                            .frame(width: 110, height: 110, alignment: .center)
                            .clipShape(Circle())
                            .padding(.top, 20)
                    }
                    Text("Créer une recette")
                        .bold()
                }
                .padding(.bottom, 40)
                VStack {
                    NavigationLink(destination: MesRecettes()) {
                        Image("pancakes_rond")
                            .resizable()
                            .frame(width: 110, height: 110, alignment: .center)
                            .clipShape(Circle())
                    }
                    Text("Mes recettes")
                        .bold()
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
        }
        .navigationBarHidden(true)
        .navigationBarTitle(Text(""))
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
