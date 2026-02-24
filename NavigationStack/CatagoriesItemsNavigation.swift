//
//  CatagoriesItemsNavigation.swift
//  SwiftUI2Weeks
//
//  Created by Pooja Chaudhari on 07/02/26.
//
//Home → Categories → Items → Item Detail

enum Route: Hashable {
    case catagory
    case items(catagory: String)
    case Details(item: String)
}

import SwiftUI

struct CatagoriesItemsNavigation: View {
    @State private var path: [Route] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 20, content: {
                Text("Home Screen")
                    .font(.largeTitle)
                
                Button("Go to Catagory") {
                    path.append(Route.catagory)
                    print(path)
                }
            })
            .navigationTitle("Home")
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .catagory:
                    CatagoryScreen(path: $path)
                case .items(let catagory):
                    ItemListScreen(path: $path, catagory: catagory)
                case .Details(let item):
                    DetailsViewScreen(path: $path, item: item)
                default:
                    EmptyView()
                }
            }
        }
    }
}
struct CatagoryScreen: View {
    @Binding var path: [Route]
    var catagories: [String] = ["Fruits", "Veggies"]
    var body: some View {
        VStack {
            Text("Catagory Screen")
                .font(.headline)
            List {
                ForEach(catagories, id: \.self) { catagory in
//                    Button(catagory) {
//                        path.append(.items(catagory: catagory))
//                    }
                    NavigationLink(value: Route.items(catagory: catagory)) {
                            Text(catagory)
                        }
                }
            }
        }
        .navigationTitle("Catagory")
    }
}

struct ItemListScreen: View {
    @Binding var path: [Route]
    var fruits: [String] = ["apple", "mango", "banana"]
    var veggies = ["spinach", "onion", "tomato"]
    var catagory: String
    
    var item: [String] {
        catagory == "Fruits" ? fruits : veggies
    }
    var body: some View {
        VStack {
            List {
                ForEach(item, id: \.self) { item in
                    Button(item) {
                        path.append(.Details(item: item))
                    }
                }
            }
            
            Button("Go to home") {
                path.removeAll()
            }
        }
        .navigationTitle("Item List Screen")
    }
}

struct DetailsViewScreen: View {
    @Binding var path: [Route]
    var item: String
    var body: some View {
        VStack {
            Text("This is \(item)")
            Button("go to catagory") {
                path = [.catagory]
            }
            Button("go to home") {
                path.removeAll()
            }
        }
    }
}
#Preview {
    CatagoriesItemsNavigation()
}
