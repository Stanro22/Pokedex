//
//  ContentView.swift
//  Pokedex
//
//  Created by user206981 on 10/5/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            PokemonCell()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()	
    }
}
