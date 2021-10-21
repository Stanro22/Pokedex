//
//  GetPokemonResponse.swift
//  Pokedex
//
//  Created by user206981 on 10/11/21.
//

import Foundation
import Combine

struct GetPokemonsResponse: Decodable {
    let pokemons: [Pokemon]

    enum CodingKeys: String, CodingKey {
        case pokemons = "results"
    }
}
