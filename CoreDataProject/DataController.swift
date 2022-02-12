//
//  DataController.swift
//  Bookworm
//
//  Created by Ken Muyesu on 08/02/2022.
//
import CoreData

import SwiftUI

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
