//
//  ContentView.swift
//  Pokedex
//
//  Created by user206981 on 10/5/21.
//

import SwiftUI

struct ContentView: View {
    //let pokemons: [Pokemon] = Pokemon.testList

     //var body: some View {
         //List(pokemons) { pokemon in
           //  PokemonCell(pokemon: pokemon)
         //}
     //}
    
    var columns = [
        GridItem(.adaptive(minimum: 250), spacing: 0, alignment: .topLeading)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(0 ..< 20) { item in
                    PokemonCell(pokemon: .testPokemon)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
