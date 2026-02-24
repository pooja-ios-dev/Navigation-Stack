//
//  HomeScreen.swift
//  SwiftUI2Weeks
//
//  Created by Pooja Chaudhari on 07/02/26.
//

import SwiftUI


struct HomeScreen: View {
    @Binding var path: [screens]
    @State var isLoggedIn: Bool
    @State var isPrimium: Bool
    @ObservedObject var viewModel: ProductsViewModel
    
    var body: some View {
        VStack(content: {
            Text("Welcome to Smart Shop")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.pink)
                .padding(.top, 150)
            
            Button(action: {
                if !(isLoggedIn && isPrimium) {
                    path.append(.login(isLoggedIn: isLoggedIn,
                                       isPremiumUser: isPrimium))
                } else {
                    path.append(.catagory(isPremiumUser: false))
                }
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 200, height: 50)
                        .foregroundStyle(.green)
                        .shadow(color: .gray, radius: 10, x: 0, y: 10)
                        .padding(20)

                    Text("Continue")
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                }
            })
            if isLoggedIn {
                List(viewModel.products) { product in
                        Button(action: {
                            if isLoggedIn && isPrimium {
                                path.append(.Item)
                            }
                        }, label: {
                            HStack {
                                Text(product.name)
                                Text("-\(Int(product.price))")
                            }
                        })
                }
            }
        })
    }
}

#Preview {
    HomeScreen(
           path: .constant([]),
           isLoggedIn: false, isPrimium: false,
           viewModel: ProductsViewModel())
}
