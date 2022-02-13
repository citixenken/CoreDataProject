//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Ken Muyesu on 12/02/2022.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "universe == %@", "Star Wars")) var ships: FetchedResults<Ship>
    
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name < %@", "F")) var ships: FetchedResults<Ship>
    
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name BEGINSWITH %@", "M")) var ships: FetchedResults<Ship>
    
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e")) var ships: FetchedResults<Ship>
    
    var body: some View {
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown name")
            }
            
            Button("Add Examples") {
                let ship1 = Ship(context: moc)
                ship1.name = "Enterprise"
                ship1.universe = "Star Trek"
                
                let ship2 = Ship(context: moc)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"
                
                let ship3 = Ship(context: moc)
                ship3.name = "Millenium Falcon"
                ship3.universe = "Star Wars"
                
                let ship4 = Ship(context: moc)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"
                
                try? moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
