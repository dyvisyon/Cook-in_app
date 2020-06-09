//
//  MesRecettes.swift
//
//
//  Created by Ivann Galic on 04/06/2020.
//

import SwiftUI

class Json: ObservableObject {
    @Published var json = [RecipeModel]()
    
    init() {
        load()
        // To remove only extra list separators below the list:
        UITableView.appearance().tableFooterView = UIView()
        
        // To remove all list separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    func load() {
        let path = Bundle.main.path(forResource: "Recipes", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let data = data {
                    let json = try JSONDecoder().decode([RecipeModel].self, from: data)
                    
                    DispatchQueue.main.sync {
                        self.json = json
                    }
                } else {
                    print("No data")
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}

struct MyRecipes: View {
    
    @ObservedObject var datas = Json()
    
    var body: some View {
        VStack {
            HStack {
                Text("Mes recettes")
                    .font(.title)
                    .padding(.top, 20)
                    .padding(.leading, 15)
                Spacer()
            }
            VStack {
                List {
                    ForEach(datas.json) { item in
                        NavigationLink(destination: Recipe(jsonItem: item)) {
                            VStack {
                                Text(item.title)
                                    .foregroundColor(.black)
                                Text(item.category)
                                    .foregroundColor(.gray)
                                    .padding(.leading, -2)
                            }
                        
                        }
                    }
                    .onDelete { (indexSet) in
                        if let index = indexSet.first {
                            self.datas.json.remove(at: index)
                        }
                    }
                }
            }
        }
    }
}

struct MesRecettes_Previews: PreviewProvider {
    static var previews: some View {
        MyRecipes()
    }
}

