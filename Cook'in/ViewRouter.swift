//
//  ViewRouter.swift
//  FoddySwiftUI
//
//  Created by Fodeilla Imed on 14/02/2020.
//  Copyright © 2020 Foody. All rights reserved.
//

import Foundation
import SwiftUI
import Combine



class ViewRouter: ObservableObject {
    
    @Published var currentView = "home"
    @Published var selected = 0
}

struct RouteViews: View {
    
    
    var body: some View {
        Text("coucou")
//        NavigationView {
//            ZStack {
//                VStack {
//                    HStack{
//                        Spacer()
//                        VStack {
//                            Image("logo").resizable().aspectRatio(contentMode: .fit).padding(.bottom,5)
//                        }.frame(height: UIScreen.main.bounds.height * 0.07 )
//                        Spacer()
//                    }
//                    Spacer()
//                }.zIndex(1)
//
//                containedView()
//
//        }.edgesIgnoringSafeArea(.top)
    }
    
//    func containedView() -> AnyView {
//        switch self.viewRouter.currentView {
//        case "home": return AnyView(NavBar().edgesIgnoringSafeArea(.top).padding(.top, 50))
//        case "MesRecettes": return AnyView(MesRecettes().edgesIgnoringSafeArea(.top).padding(.top, 50))
//        case "CreerUneRecette": return AnyView(CreerUneRecette().edgesIgnoringSafeArea(.top).padding(.top, 50))
//        case "About": return AnyView(About().edgesIgnoringSafeArea(.top).padding(.top, 50))
//        default:
//            return AnyView(NavBar().edgesIgnoringSafeArea(.top).padding(.top, 50))
//        }
//    }
//}
}

struct ViewRouter_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
