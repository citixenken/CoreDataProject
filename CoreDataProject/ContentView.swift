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
    @State private var lastNameFilter = "A"
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "universe == %@", "Star Wars")) var ships: FetchedResults<Ship>
    
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name < %@", "F")) var ships: FetchedResults<Ship>
    
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name BEGINSWITH %@", "M")) var ships: FetchedResults<Ship>
    
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e")) var ships: FetchedResults<Ship>
    
    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>
    
    var body: some View {
        
        VStack {
            List {
                ForEach(countries, id: \.self) { country in
                    Section(country.wrappedFullName) {
                        ForEach(country.candyArray, id: \.self) { candy in
                            Text(candy.wrappedName)
                        }
                    }
                }
            }
            
            Button("Add") {
                let candyUno = Candy(context: moc)
                candyUno.name = "Mars"
                candyUno.origin = Country(context: moc)
                candyUno.origin?.shortName = "UK"
                candyUno.origin?.fullName = "United Kingdom"
                
                let candyDeux = Candy(context: moc)
                candyDeux.name = "KitKat"
                candyDeux.origin = Country(context: moc)
                candyDeux.origin?.shortName = "UK"
                candyDeux.origin?.fullName = "United Kingdom"
                
                let candyTres = Candy(context: moc)
                candyTres.name = "Twix"
                candyTres.origin = Country(context: moc)
                candyTres.origin?.shortName = "UK"
                candyTres.origin?.fullName = "United Kingdom"
                
                let candyQuartre = Candy(context: moc)
                candyQuartre.name = "Toblerone"
                candyQuartre.origin = Country(context: moc)
                candyQuartre.origin?.shortName = "CH"
                candyQuartre.origin?.fullName = "Switzerland"
                
                try? moc.save()
            }
        }
        
//        VStack {
//            //list of matching singers
////            FilteredList(filter: lastNameFilter)
//            FilteredList(filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
//                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
//            }
//
//            Button("Add Examples") {
//                let salim = Singer(context: moc)
//                salim.firstName = "Salim"
//                salim.lastName = "Keita"
//
//                let hugh = Singer(context: moc)
//                hugh.firstName = "Hugh"
//                hugh.lastName = "Masekela"
//
//                let angelique = Singer(context: moc)
//                angelique.firstName = "Angelique"
//                angelique.lastName = "Kidjo"
//
//                try? moc.save()
//            }
//
//            Button("Show K") {
//                lastNameFilter = "K"
//            }
//
//            Button("Show M") {
//                lastNameFilter = "M"
//            }
//        }
        
//        VStack {
//            List(ships, id: \.self) { ship in
//                Text(ship.name ?? "Unknown name")
//            }
//
//            Button("Add Examples") {
//                let ship1 = Ship(context: moc)
//                ship1.name = "Enterprise"
//                ship1.universe = "Star Trek"
//
//                let ship2 = Ship(context: moc)
//                ship2.name = "Defiant"
//                ship2.universe = "Star Trek"
//
//                let ship3 = Ship(context: moc)
//                ship3.name = "Millenium Falcon"
//                ship3.universe = "Star Wars"
//
//                let ship4 = Ship(context: moc)
//                ship4.name = "Executor"
//                ship4.universe = "Star Wars"
//
//                try? moc.save()
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
