//
//  NavigationStackView.swift
//  SwiftUI2Weeks
//
//  Created by Pooja Chaudhari on 06/02/26.
//

import SwiftUI

struct NavigationStackView: View {
    @State var path: [String] = []
    var body: some View {
        NavigationStack(path: $path) {
//            NavigationLink("Go to Detail") {
//                   Text("Detail Screen")
//               }
            VStack {
                Text("Home")
                Button("Go to Detail Screen") {
                   path.append("uyguh")
                }
            }
            .navigationDestination(for: String.self) { value in
                VStack {
                    DetailsScreen()
                }
            }
        }
    }
}

struct Product1: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

struct DetailsScreen: View {
    @State private var path = [Product1]()
    var body: some View {
       // NavigationStack(path: $path) {
            VStack(spacing: 20) {
                Button("Go to Apple") {
                    path.append(Product1(name: "Apple"))
                }

                Button("Go to Banana") {
                    path.append(Product1(name: "Banana"))
                }
            }
            .navigationDestination(for: Product1.self) { product1 in
                ProfileNavigationView()
            }
       // }
    }
}

#Preview {
    NavigationStackView()
}
