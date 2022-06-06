//
//  AddPizzaView.swift
//  Pizza App
//
//  Created by Ananthamoorthy Haniman on 2022-05-17.
//

import SwiftUI

struct AddPizzaView: View {
    
    @State private var name = ""
    @State private var ingredients = ""
    @State private var imageName = ""
    @State private var type = ""
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var context
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray
                    .opacity(0.2)
                VStack {
                    TextField("Enter Pizza Name", text: $name) /// `.constant()` can be used as a placeholder
                        .textFieldStyle(.roundedBorder)
                    TextEditor(text: $ingredients)
                        .frame(height: 200)
                    TextField("Enter Image Name", text: $imageName)
                        .textFieldStyle(.roundedBorder)
                    TextField("Enter Pizza Thumbnail Name", text: $imageName)
                        .textFieldStyle(.roundedBorder)
                    TextField("Enter Pizza Type", text: $type)
                        .textFieldStyle(.roundedBorder)
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("New Pizza") // Setting the title bar
            .navigationBarTitleDisplayMode(.inline) // Making the title small
            .toolbar {
                ToolbarItem {
                    Button {
                        let pizza = Pizza(context: context)
                        pizza.name = name
                        pizza.ingredients = ingredients
                        pizza.imageName = imageName
                        pizza.thumbnailName = imageName
                        pizza.type = type
                        try? context.save()
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Save")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        
                        presentationMode.wrappedValue.dismiss() // Closing the sheet
                    } label: {
                        Text("Cancel")
                    }
                }
            }
        }
    }
    
}



struct AddPizzaView_Previews: PreviewProvider {
    static var previews: some View {
        AddPizzaView()
    }
}
