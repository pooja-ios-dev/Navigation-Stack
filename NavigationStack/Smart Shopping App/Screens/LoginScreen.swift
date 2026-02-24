//
//  LoginScreen.swift
//  SwiftUI2Weeks
//
//  Created by Pooja Chaudhari on 07/02/26.
//

import SwiftUI

struct LoginScreen: View {
    @Binding var path: [screens]
    @State var isLoggedIn: Bool
    @State var isPrimium: Bool
    @ObservedObject var viewModel: ProductsViewModel
    var body: some View {
        VStack {
            Text("Login Screen")
                .font(.title)
                .fontWeight(.bold)
            
            Button(action: {
                self.isLoggedIn = true
                if isPrimium {
                    path.append(.Item)
                } else {
                    path.append(.catagory(isPremiumUser: isPrimium))
                }
                
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 200, height: 50)
                        .foregroundStyle(.green)
                        .shadow(color: .gray, radius: 10, x: 0, y: 10)
                        .padding(20)

                    Text("Login")
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                }
            })
        }
    }
}

#Preview {
    LoginScreen(
           path: .constant([]),
          isLoggedIn: true,
           isPrimium: false,
           viewModel: ProductsViewModel())
}
