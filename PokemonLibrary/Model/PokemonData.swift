//
//  PokemonData.swift
//  PokemonLibrary
//
//  Created by Roman Korobskoy on 08.01.2022.
//

import Foundation

struct PokemonData: Decodable {
    
    let height: Int
    let name: String
    let order: Int
    let sprites: Sprites
    let weight: Int
}

struct Sprites: Decodable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
