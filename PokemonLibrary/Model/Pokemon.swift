//
//  Pokemon.swift
//  PokemonLibrary
//
//  Created by Roman Korobskoy on 08.01.2022.
//

import Foundation

struct Pokemon {
    
    var abilityName: String
    var height: Int
    var heightString: String {
        return String(height)
    }
    var name: String = "Loading..."
    var order: Int
    var orderString: String {
        return String(order)
    }
    var frontDefault: String
    var weight: Int
    var weightString: String {
        return String(weight)
    }
    
    init?(pokemonData: PokemonData) {
        abilityName = pokemonData.abilities.first!.ability.name
        height = pokemonData.height
        name = pokemonData.name
        order = pokemonData.order
        frontDefault = pokemonData.sprites.frontDefault
        weight = pokemonData.weight
    }
}
