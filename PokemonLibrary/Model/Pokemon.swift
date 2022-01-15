//
//  Pokemon.swift
//  PokemonLibrary
//
//  Created by Roman Korobskoy on 08.01.2022.
//

import Foundation

struct Pokemon: PokemonCellModel, SpritesCellProtocol {
    
    var abilityName: String
    var height: Int
    var heightString: String {
        return String(height * 10)
    }
    var name: String = "Loading..."
    var order: Int
    var orderString: String {
        return String(order)
    }
    var frontDefault: String
    var frontShiny: String
    var weight: Int
    var weightString: String {
        return String(weight / 10)
    }
    var artWorkFrontDefault: String
    var dreamWorldFrontDefault: String
    var homeFrontDefault: String
    
    init?(pokemonData: PokemonData) {
        abilityName = pokemonData.abilities.first!.ability.name
        height = pokemonData.height
        name = pokemonData.name
        order = pokemonData.order
        frontDefault = pokemonData.sprites.frontDefault
        frontShiny = pokemonData.sprites.frontShiny
        weight = pokemonData.weight
        
        artWorkFrontDefault = pokemonData.sprites.other?.officialArtwork.frontDefault ?? "No data"
        dreamWorldFrontDefault = pokemonData.sprites.other?.dreamWorld.frontDefault ?? "No data"
        homeFrontDefault = pokemonData.sprites.other?.home.frontDefault ?? "No data"
    }
}

//struct Sprite: SpritesCellProtocol {
//
//    var artWorkFrontDefault: String
//    var dreamWorldFrontDefault: String
//    var homeFrontDefault: String
//
//    init(pokemonData: PokemonData) {
//    artWorkFrontDefault = pokemonData.sprites.other?.officialArtwork.frontDefault ?? "No data"
//    dreamWorldFrontDefault = pokemonData.sprites.other?.dreamWorld.frontDefault ?? "No data"
//    homeFrontDefault = pokemonData.sprites.other?.home.frontDefault ?? "No data"
////        artWorkFrontDefault = pokemonData.officialArtwork.frontDefault
////        dreamWorldFrontDefault = pokemonData.dreamWorld.frontDefault ?? "no data"
////        homeFrontDefault = pokemonData.home.frontDefault
//    }
//}
