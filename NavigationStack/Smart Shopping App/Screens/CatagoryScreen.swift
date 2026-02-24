//
//  CatagoriesScreen.swift
//  SwiftUI2Weeks
//
//  Created by Pooja Chaudhari on 07/02/26.
//

import SwiftUI

struct CatagoriesScreen: View {
    @Binding var path: [screens]
    //@Binding var user: User
    //var isLoggedIn: Bool
    var isPrimium: Bool
    @ObservedObject var viewModel: ProductsViewModel
    var body: some View {
        VStack {
            List {
                NavigationLink(value: screens.Item) {
                        Text("Electronics")
                }
                NavigationLink(value: screens.Item) {
                        Text("Cloths")
                }
                
            }
            Button("Go to home") {
                path = [.Home(isLoggedIn: true, isPremiumUser: false)]
            }
        }
        .navigationTitle("Catagories")
    .listStyle(.sidebar)
    }
}

#Preview {
    CatagoriesScreen(
           path: .constant([]),
           //isLoggedIn: true,
           isPrimium: false,
           viewModel: ProductsViewModel())
}
