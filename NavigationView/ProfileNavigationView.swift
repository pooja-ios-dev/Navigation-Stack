//
//  ProfileNavigationView.swift
//  SwiftUI2Weeks
//
//  Created by Pooja Chaudhari on 06/02/26.
//
//Create a SwiftUI app with:
//
//A Home screen
//
//A button/text “Go to Profile”
//
//On tap, navigate to Profile screen
//
//Profile screen should show:
//
//Text: “Welcome, Pooja”

//A back button (default)
import SwiftUI

struct ProfileNavigationView: View {
    var body: some View {
        NavigationView {
            //Button("Go to Profile") {
                NavigationLink("Go to Profile") {
                    ItemScreen(catagory: "Fruits")
                }
           // }
                .navigationTitle("Home")
        }
    }
}

#Preview {
    ProfileNavigationView()
}
