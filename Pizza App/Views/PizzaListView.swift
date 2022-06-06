//
//  PizzaListView.swift
//  Pizza App
//
//  Created by Ananthamoorthy Haniman on 2022-05-17.
//

import SwiftUI


struct PizzaListView: View {
    
    @State private var pizzaType = "All"
    @State private var showAddPizzaView = false
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Pizza.entity(), sortDescriptors: []) var pizzas: FetchedResults<Pizza>
    
    var body: some View {
        NavigationView {
            VStack{
                Picker("Pizzas", selection: $pizzaType) {
                    Text("All🍕").tag("All")
                    Text("Meat🥩").tag("Meat")
                    Text("Veggie🥦").tag("Veggie")
                }
                .pickerStyle(.segmented)
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                List(pizzas, id: \.name) { pizza in
                    NavigationLink {
                        PizzaDetailView(pizza: pizza)
                    } label: {
                        HStack {
                            Image(pizza.imageName ?? "")
                                .resizable()
                                .frame(width: 100, height: 100)
                            Text(pizza.name ?? "")
                        }
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button {
                            context.delete(pizza)
                            try? context.save()
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
                .onChange(of: pizzaType, perform: { newValue in
                    print(newValue)
                })
                .listStyle(PlainListStyle())
                
                
            }
            .navigationTitle("Pizzas")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showAddPizzaView, content: {
                AddPizzaView()
            })
            .toolbar {
                ToolbarItem {
                    Button {
                        showAddPizzaView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
}



struct PizzaListView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaListView()
    }
}
