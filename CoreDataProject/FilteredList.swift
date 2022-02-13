//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Ken Muyesu on 13/02/2022.
//

import CoreData
import SwiftUI

//struct FilteredList: View {
//    @FetchRequest var fetchRequest: FetchedResults<Singer>
//
//    init(filter: String) {
//        _fetchRequest = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
//    }
//    var body: some View {
//        List(fetchRequest, id: \.self) { singer in
//            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
//        }
//    }
//}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    //this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}

//struct FilteredList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredList()
//    }
//}
