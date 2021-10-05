//
//  Pokemon.swift
//  Pokedex
//
//  Created by user206981 on 10/5/21.
//

import Foundation

struct Pokemon: Identifiable {
 let id: Int
 let name: String
 let abilityCount: Int

 var imageName: String {
     return name
 }

 var originalName: String {
     return "\(imageName)Original"
 }

 static let testPokemon = Pokemon(id: 1, name: "bulbasaur", abilityCount: 3)

 static let testList = [
    Pokemon(id: 1, name: "bulbasaur", abilityCount: 3),
    Pokemon(id: 4, name: "charmander", abilityCount: 5),
    Pokemon(id: 7, name: "squirtle", abilityCount: 3),
    Pokemon(id: 203, name: "ditto", abilityCount: 0),
    Pokemon(id: 132, name: "mewtwo", abilityCount: 10)
 ]
}
