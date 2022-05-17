//
//  ContentView.swift
//  Pizza App
//
//  Created by Ananthamoorthy Haniman on 2022-05-17.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
        TabView {
            PizzaListView()
                .tabItem {
                    Label("PizzaList", systemImage: "list.dash")
                }
            FavouriteView()
                .tabItem {
                    Label("Favorites", systemImage: "star.fill")
                }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
