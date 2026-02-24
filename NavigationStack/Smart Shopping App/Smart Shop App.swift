//
//  LaunchAndHomeScreen.swift
//  SwiftUI2Weeks
//
//  Created by Pooja Chaudhari on 07/02/26.
//

import SwiftUI

enum screens: Hashable {
    case Home(isLoggedIn: Bool, isPremiumUser: Bool)
    case login(isLoggedIn: Bool, isPremiumUser: Bool)
    case catagory(isPremiumUser: Bool)
    case Item
    case Details
}

class ProductsViewModel: ObservableObject {
    @Published var products: [Products] = []
    
    init() {
        addData()
    }
    func addData() {
        products.append(Products(name: "iphone", price: 999, category: "Electronics"))
        products.append(Products(name: "T-Shirt", price: 20, category:"Cloths"))
        products.append(Products(name: "Laptop", price: 1200, category:"Electronics"))
    }
}

struct LaunchAndHomeScreen: View {
    @State private var path: [screens] = []
    @StateObject private var viewModel = ProductsViewModel()
    let user = User(
        name: "Pooja",
        isLoggedIn: false,
        isPremium: false)
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Text("Launch Screen")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.pink, .green)
                
                Button(action: {
                    path.append(
                        .Home(isLoggedIn: user.isLoggedIn,
                                  isPremiumUser: user.isPremium)
                    )
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 200, height: 50)
                            .foregroundStyle(.green)
                            .shadow(color: .gray, radius: 10, x: 0, y: 10)
                            .padding(20)

                        Text("Start")
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    }
                })
            }
            .navigationTitle("Launch Screen")
            .navigationDestination(for: screens.self) { screens in
                switch screens {
                case .Home(let isLoggedIn, let isPremiumUser):
                    HomeScreen(path: $path, isLoggedIn: isLoggedIn, isPrimium: isPremiumUser, viewModel: viewModel)
                case .login(let isLoggedIn, let isPremiumUser ):
                    LoginScreen(path: $path, isLoggedIn: isLoggedIn, isPrimium: isPremiumUser, viewModel: viewModel)
                case .catagory(let isPremiumUser):
                    CatagoriesScreen(path: $path, isPrimium: isPremiumUser, viewModel: viewModel)
                case .Item:
                    Items(path: $path, viewModel: viewModel)
                case .Details:
                    Text("fshdjsf")
                }
            }
        }
    }
}

#Preview {
    LaunchAndHomeScreen()
}
