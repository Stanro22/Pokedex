//
//  ContentView.swift
//  Pokedex
//
//  Created by user206981 on 10/5/21.
//

import SwiftUI
import KeychainAccess

struct ContentView: View {
    @State var pokemons: [Pokemon] = []
    
     var body: some View {
         NavigationView{
             List(pokemons) { pokemon in
                 NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                     Text(pokemon.name)
                 }
             }.navigationTitle("Pokemon's")
                 .navigationBarItems(trailing:
                    NavigationLink(destination: LoginView()) {
                    Image(systemName: "person.fill")
                 })
             .onAppear {
                         PokemonAPI.shared.getPokemons { (result) in
                             switch result {
                             case .success(let response):
                                 self.pokemons = response.pokemons
                             case .failure(let error):
                                 switch error {
                                 case .urlError(let urlError):
                                     print("URL Error: \(String(describing: urlError))")
                                 case .decodingError(let decodingError):
                                     print("Decoding Error: \(String(describing: decodingError))")
                                 case .genericError(let error):
                                     print("Error: \(String(describing: error))")
                                 }
                             }
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

