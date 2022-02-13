//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Ken Muyesu on 12/02/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            ForEach ([2,4,6,7,8,13], id: \.self) {
                Text("\($0) is even")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
