//
//  PokemonData.swift
//  PokemonLibrary
//
//  Created by Roman Korobskoy on 08.01.2022.
//

import Foundation

struct PokemonData: Decodable {
    
    let abilities: [Ability]
    let height: Int
    let name: String
    let order: Int
    let sprites: Sprites
    let weight: Int
}

struct Ability: Decodable {
    let ability: Species
}

struct Species: Decodable {
    let name: String
}

struct Sprites: Codable {
    let frontDefault: String
    let frontShiny: String
    let other: Other?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case other
    }
}

struct Other: Codable {
//    let dreamWorld: DreamWorld
    let home: Home
    let officialArtwork: OfficialArtwork
    
    enum CodingKeys: String, CodingKey {
//        case dreamWorld = "dream_world"
        case home
        case officialArtwork = "official-artwork"
    }
}

struct OfficialArtwork: Codable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

//struct DreamWorld: Codable {
//    let frontDefault: String
//
//    enum CodingKeys: String, CodingKey {
//        case frontDefault = "front_default"
//    }
//}

struct Home: Codable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
