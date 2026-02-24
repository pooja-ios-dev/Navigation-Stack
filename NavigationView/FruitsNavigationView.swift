//
//  FruitsNavigationView.swift
//  SwiftUI2Weeks
//
//  Created by Pooja Chaudhari on 06/02/26.
//
/* Create a SwiftUI app with:
 Home screen
 Title: “Fruits App”
 Button: “View Fruits”
 Fruits List screen
 Show a list of fruits (Apple, Banana, Mango)
 On selecting a fruit, navigate to Fruit Detail screen
 Fruit Detail screen
 Display selected fruit name
 Show text: “This fruit is healthy 🍎”*/
import SwiftUI

struct FruitsNavigationView: View {
    var body: some View {
        NavigationView {
            NavigationLink("View Fruits", destination: {
                FruitsList()
            })
            .navigationTitle("Fruits App")
        }
    }
}
struct FruitsList: View {
    
    var fruits: [String] = ["Apple", "Banana", "Mango"]
    var body: some View {
        List {
            ForEach(fruits, id: \.self) { fruit in
                NavigationLink(fruit) {
                    FruitDetails(fruits: fruit)
                }
            }
        }
        .navigationTitle("Fruits List")
    }
}

struct FruitDetails: View {
    @EnvironmentObject var userVM: UserViewModel
    var fruits: String
    var body: some View {
        VStack {
            Text("This fruit is healthy 🍎\(fruits)")
            Text("name = \(userVM.name)")
        }
    }
}
#Preview {
    FruitsNavigationView()
        .environmentObject(UserViewModel())
}
