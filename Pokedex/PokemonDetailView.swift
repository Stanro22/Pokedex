//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by user206981 on 10/7/21.
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        Image(pokemon.originalName)
            .resizable()
            .frame(width: 200, height: 200)
            .aspectRatio(contentMode: .fit)
            .navigationTitle(pokemon.name)
            .navigationBarItems(
                //leading:
                //Button("Go back") {
                    //presentationMode.wrappedValue.dismiss()
                //},
                trailing:
                NavigationLink(destination:
                    Text("My favourite pokemon is: \(pokemon.name)")
                ) {
                    Image(systemName: "star")
                }
            )
        }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PokemonDetailView(pokemon: Pokemon.testPokemon)
        }
    }
}
