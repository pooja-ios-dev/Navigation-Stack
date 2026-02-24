//
//  CatagoryNavigationView.swift
//  SwiftUI2Weeks
//
//  Created by Pooja Chaudhari on 06/02/26.
//
/* Home → Categories → Items → Item Detail
 Requirements
 Each screen shows its title
 Data flows forward (category → item)
 On Item Detail screen, add a button:
 👉 “Go back to Home”*/
import SwiftUI

struct CatagoryNavigationView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("This is Home Screen")
                    .font(.title)
                    .fontWeight(.bold)
                NavigationLink("go to Categories") {
                    CategoriesScreen()
                }
            }
            .navigationTitle("Home")
        }
    }
}
enum catagories: String {
    case fruits = "Fruits"
    case veggies = "Veggies"
}
struct CategoriesScreen: View {
    var catagories: [String] = ["Fruits", "Veggies"]
    var body: some View {
        List {
            ForEach(catagories, id: \.self) { catagory in
                NavigationLink(catagory) {
                    ItemScreen(catagory: catagory)
                }
            }
        }
    }
}

struct ItemScreen: View {
    var catagory: String
    var fruits: [String] = ["Apple", "Banana", "Mango"]
    var Veggies: [String] = ["spinach", "tomato", "onion"]
    var item: [String] {
         catagory == "Fruits" ? fruits: Veggies
    }
    var body: some View {
        List {
                ForEach(item, id: \.self) { item in
                    NavigationLink(item) {
                        Details(item: item)
                            //.environment(\.colorScheme, .dark)
                    }
                }
        }
//        Section("fruits") {
//            List(fruits, id: \.self) { fruit in
//                NavigationLink(fruit) {
//                   Details(item: fruit)
//              }
//            }
//        }
//        
//        Section("Veggies") {
//            List(Veggies, id: \.self) { Veggie in
//                NavigationLink(Veggie) {
//                   Details(item: Veggie)
//              }
//            }
//        }
    }
}

struct Details: View {
    var item: String
   // @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.locale) var locale
    var body: some View {
        VStack {
            Text("this is \(item)")
            Text(colorScheme == .dark ? "dark Mode": "light mode")
            Text("Locale: \(locale.identifier)")
            Button("Back") {
                //presentationMode.wrappedValue.dismiss()
                //presentationMode.wrappedValue.dismiss()
                dismiss()
                
               // dismiss()
            }
        }
        .preferredColorScheme(.dark)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .foregroundColor(.white)
    }
}
#Preview {
    CatagoryNavigationView()
}
