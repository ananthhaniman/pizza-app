//
//  FavouriteView.swift
//  Pizza App
//
//  Created by Ananthamoorthy Haniman on 2022-05-17.
//

import SwiftUI

struct FavouriteView: View {
    
    @FetchRequest(entity: Pizza.entity(), sortDescriptors: [], predicate: NSPredicate(format: "isFavourite = %d", true)) var favourites: FetchedResults<Pizza>
    @Environment(\.managedObjectContext) var context
    
    
    var body: some View {
        NavigationView {
            List(favourites) { favourite in
                NavigationLink {
                    PizzaDetailView(pizza: favourite)
                } label: {
                    HStack {
                        Image(favourite.imageName ?? "")
                            .resizable()
                            .frame(width: 100, height: 100)
                        Text(favourite.name ?? "")
                    }
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    Button {
                        context.delete(favourite)
                        try? context.save()
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }

            }
            .listStyle(PlainListStyle())
        }
        .navigationTitle("Favourites")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}


struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
