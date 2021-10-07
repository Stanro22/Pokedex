//
//  ContentView.swift
//  Pokedex
//
//  Created by user206981 on 10/5/21.
//

import SwiftUI
import KeychainAccess

struct ContentView: View {
    let pokemons: [Pokemon] = Pokemon.testList

     var body: some View {
         NavigationView{
             List(pokemons) { pokemon in
                 NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                     PokemonCell(pokemon: pokemon)
                 }.navigationTitle("Pokemon's")
                     .navigationBarItems(trailing:
                       NavigationLink(destination: LoginView()) {
                       Image(systemName: "person.fill")
                     }
                )
             }
         }
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
