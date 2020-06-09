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
        
        // To clean space above Form
        UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
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
    @State var categoryIndex = 0
    var categoriesArray = ["Petit-déjeuner", "Entrée", "Plat", "Dessert", "En-cas", "Apéritif", "Boisson"]
    
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
                HStack {
//                    Picker("Selectionnez la catégorie: \(categoriesArray[categoryIndex])", selection: $categoryIndex) {
//                        ForEach(0..<self.categoriesArray.count) {
//                            category in
//                            Text(self.categoriesArray[category]).tag(category)
//                        }
                    HStack {
                        Form {
                    Section {
                            Picker(selection: $categoryIndex, label: Text("Catégorie :")){
                                ForEach(0..<self.categoriesArray.count) { category in
                                    Text(self.categoriesArray[category]).tag(category)
                                }
                        }
                        }
                        }
                    }
                }
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

