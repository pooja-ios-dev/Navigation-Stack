//
//  Item.swift
//  SwiftUI2Weeks
//
//  Created by Pooja Chaudhari on 07/02/26.
//

import SwiftUI

struct Items: View {
    @Binding var path: [screens]
    @ObservedObject var viewModel: ProductsViewModel
    var body: some View {
        VStack {
            Text("Items Screen")
            Spacer()
                .frame(width: 50, height: 500)
            Text("Items Screen")
            Text("Items Screen")
        }
        
    }
}

#Preview {
    Items(
        path: .constant([]),
        viewModel: ProductsViewModel()
    )
}
