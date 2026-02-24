//
//  NavigationViewDemo.swift
//  SwiftUI2Weeks
//
//  Created by Pooja Chaudhari on 05/02/26.
//
class UserViewModel: ObservableObject {
    @Published var name: String = "Guest"
}

import SwiftUI

struct Product {
    let name: String
    let price: Int
}
struct NavigationViewDemo: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("🏠 Home Screen")
                    .font(.largeTitle)
                NavigationLink("view product list", destination: ProductListView())
                    .padding()
                    .font(.headline)
            }
            .navigationTitle("Home Screen")
        }
    }
}

struct ProductListView: View {
    let products = [
            Product(name: "iPhone", price: 80000),
            Product(name: "iPad", price: 60000),
            Product(name: "MacBook", price: 150000)
        ]

        var body: some View {
            List(products, id: \.name) { product in
                NavigationLink {
                    ProductDetailView(product: product)
                } label: {
                    VStack(alignment: .leading) {
                        Text(product.name)
                            .font(.headline)
                        Text("₹\(product.price)")
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Products")
        }
}

struct ProductDetailView: View {
    let product: Product

        var body: some View {
            VStack(spacing: 20) {
                Text(product.name)
                    .font(.largeTitle)

                Text("Price: ₹\(product.price)")
                    .font(.title2)

                NavigationLink("Buy Now") {
                    CheckoutView(product: product)
                }
            }
            .navigationTitle("Details")
        }
}

struct CheckoutView: View {
    let product: Product

    var body: some View {
        VStack(spacing: 20) {
            Text("Checkout")
                .font(.largeTitle)

            Text("Product: \(product.name)")
            Text("Amount: ₹\(product.price)")
        }
        .navigationTitle("Checkout")
    }
}

#Preview {
    NavigationViewDemo()
}
