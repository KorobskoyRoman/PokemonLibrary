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

struct Sprites: Decodable {
    let frontDefault: String
    let frontShiny: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}
