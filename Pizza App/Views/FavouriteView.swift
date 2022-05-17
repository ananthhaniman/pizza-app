//
//  FavouriteView.swift
//  Pizza App
//
//  Created by Ananthamoorthy Haniman on 2022-05-17.
//

import SwiftUI

struct FavouriteView: View {
    
    @FetchRequest(entity: Pizza.entity(), sortDescriptors: [], predicate: NSPredicate(format: "isFavourite = %d", true)) var favourites: FetchedResults<Pizza>
    
    
    var body: some View {
        List(favourites) { favourite in
            HStack {
                Image(favourite.imageName ?? "")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text(favourite.name ?? "")
            }

        }
        .listStyle(PlainListStyle()) // PlainListStyle
    }
    
}


struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
