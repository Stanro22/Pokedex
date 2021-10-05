//
//  ContentView.swift
//  Pokedex
//
//  Created by user206981 on 10/5/21.
//

import SwiftUI

struct ContentView: View {
    let pokemons: [Pokemon] = Pokemon.testList

     var body: some View {
         List(pokemons) { pokemon in
             PokemonCell(pokemon: pokemon)
         }
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()	
    }
}
