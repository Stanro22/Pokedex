//
//  PokemonCell.swift
//  Pokedex
//
//  Created by user206981 on 10/5/21.
//

import SwiftUI

struct PokemonCell: View {
    let pokemon: Pokemon

    var body: some View {
        HStack {
            Image(pokemon.imageName)
             .resizable()
             .frame(width: 54, height: 54)
             VStack(alignment: .leading) {
                 Text(pokemon.name)
                     .font(.title)
                 Text("\(pokemon.abilityCount) abilities")
                     .foregroundColor(.secondary)
             }
        }
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon: .testPokemon)
    }
}
