//
//  PizzaDetailView.swift
//  Pizza App
//
//  Created by Ananthamoorthy Haniman on 2022-05-17.
//
import SwiftUI

struct PizzaDetailView: View {
    
    let pizza: Pizza
    @Environment(\.managedObjectContext) var context
    @State private var isFavourite: Bool
    
    init(pizza: Pizza) {
        self.pizza = pizza
        self.isFavourite = pizza.isFavourite
    }
    
    var body: some View {
        GeometryReader { reader in
            VStack(alignment: .leading) {
                Image(pizza.imageName ?? "")
                    .resizable()
                    .frame(width: reader.size.width, height: 200)
                Text(pizza.name ?? "")
                    .padding()
                Text(pizza.ingredients ?? "")
                    .padding()
                Button {
                    print("Object before isFavourite: ", pizza)
                    isFavourite.toggle()
                    pizza.isFavourite = isFavourite
                    try? context.save()
                    print("Object after saving: ", pizza)
                } label: {
                    Text(isFavourite ? "Is Favourite" : "Not favourite")
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
    
}
