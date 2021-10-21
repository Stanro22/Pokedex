//
//  PokemonAPI.swift
//  Pokedex
//
//  Created by user206981 on 10/11/21.
//

import Foundation
import Combine
import UIKit

final class PokemonAPI {
    static let shared = PokemonAPI()
    private var cancellable: AnyCancellable?
    private init() {}
    
    func getPokemons(completion: @escaping (Result<GetPokemonsResponse, RequestError>) -> Void) {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151")!
        let urlRequest = URLRequest(url: url)
        execute(request: urlRequest, completion: completion)
    }
    
    func getDetails(
        of pokemon: Pokemon,
        completion: @escaping (Result<PokemonDetail, RequestError>) -> Void
    ) {
        
        let urlRequest = URLRequest(url: pokemon.url)

        execute(request: urlRequest, completion: completion)
    }
    
    func getImage(
        for pokemonDetail: PokemonDetail,
        completion: @escaping (Result<UIImage, RequestError>) -> Void
    ) {
    
        let urlRequest = URLRequest(url: pokemonDetail.imageUrl)

        cancellable = URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map({ UIImage(data: $0.data) ?? UIImage() })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
      completion(.failure(.urlError(error)))
                }
            }) { (image) in
                completion(.success(image))
            }
        }
    
    func execute<Response: Decodable>(
        request: URLRequest,
        completion: @escaping (Result<Response, RequestError>
    ) -> Void) {
        cancellable = URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: Response.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (result) in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    switch error {
                    case let urlError as URLError:
                        completion(.failure(.urlError(urlError)))
                    case let decodingError as DecodingError:
                        completion(.failure(.decodingError(decodingError)))
                    default:
                        completion(.failure(.genericError(error)))
                    }
                }
            }, receiveValue: { (response) in
                completion(.success(response))
            })
        }
}

enum RequestError: Error {
    case urlError(URLError)
    case decodingError(DecodingError)
    case genericError(Error)
}
