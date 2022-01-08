//
//  Pokemon.swift
//  PokemonLibrary
//
//  Created by Roman Korobskoy on 08.01.2022.
//

import Foundation

struct Pokemon {
    var height: Int
    var name: String = "Loading..."
    var order: Int
    var frontDefault: String
    var weight: Int
    
    init?(pokemonData: PokemonData) {
        height = pokemonData.height
        name = pokemonData.name
        order = pokemonData.order
        frontDefault = pokemonData.sprites.frontDefault
        weight = pokemonData.weight
    }
}
