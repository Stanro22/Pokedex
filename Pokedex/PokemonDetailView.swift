//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by user206981 on 10/7/21.
//

import SwiftUI

struct PokemonDetailView: View {
    var pokemon: Pokemon
    @State private var pokemonDetails: PokemonDetail? = nil
    @State private var pokemonImage: UIImage? = nil
    
    var body: some View {
        if let pokemonDetails = pokemonDetails {
            Text("\(pokemon.name)")
                .bold()
            if let pokemonImage = pokemonImage {
                Image(uiImage: pokemonImage)
                    .resizable()
                    .padding()
                    .frame(width: 400, height: 400)
            } else{
                ProgressView("Loading pokemonImage")
                    .onAppear{
                        PokemonAPI.shared.getImage(for: pokemonDetails) { (result) in
                            switch result {
                            case .success(let response):
                                self.pokemonImage = response
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
                
        } else{
            ProgressView("Loading pokemonDetails")
                .onAppear {
                    PokemonAPI.shared.getDetails(of: pokemon){ (result) in
                        switch result {
                        case .success(let response):
                            self.pokemonDetails = response
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

//struct PokemonDetailView_Previews: PreviewProvider {
  //  static var previews: some View {
    //    NavigationView{
            //PokemonDetailView()
       // }
  //  }
//}
