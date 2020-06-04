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
        VStack {
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 145, height: 45, alignment: .center)
                    .padding(.bottom)
            }
            
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
                Image("notebook_rond")
                .resizable()
                .frame(width: 110, height: 110, alignment: .center)
                .clipShape(Circle())
                Text("Créer une recette")
                .bold()
            }
            .padding(.top)
            .padding(.bottom)
            
            VStack {
                Image("pancakes_rond")
                .resizable()
                .frame(width: 110, height: 110, alignment: .center)
                .clipShape(Circle())
                Text("Mes recettes")
                .bold()
            }
            Spacer()
        } .padding(.bottom, 30)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
