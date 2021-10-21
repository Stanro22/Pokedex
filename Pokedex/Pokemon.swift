//
//  Pokemon.swift
//  Pokedex
//
//  Created by user206981 on 10/5/21.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let id = UUID()
    let name: String
    let url: URL

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}

struct PokemonDetail: Decodable {
    let id: Int
    let name: String
    let imageUrl: URL

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case sprites = "sprites"
    }

    enum SpritesCodingKeys: String, CodingKey {
        case other = "other"
    }

    enum SpritesOtherCodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }

    enum SpritesOtherOfficialArtworkCodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)

        let officialArtworkContainer = try container.nestedContainer( // sprites
            keyedBy: SpritesCodingKeys.self,
            forKey: .sprites
        ).nestedContainer( // other
            keyedBy: SpritesOtherCodingKeys.self,
            forKey: .other
        ).nestedContainer( // official artwork
            keyedBy: SpritesOtherOfficialArtworkCodingKeys.self,
            forKey: .officialArtwork
        )

        imageUrl = try officialArtworkContainer.decode(URL.self, forKey: .frontDefault)
    }
}
