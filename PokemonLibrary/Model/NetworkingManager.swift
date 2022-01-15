//
//  NetworkingManager.swift
//  PokemonLibrary
//
//  Created by Roman Korobskoy on 08.01.2022.
//

import Foundation

struct NetworkingManager {
    
    func fetchPokemon(searchText: String, completionHandler: @escaping (Pokemon) -> Void) {
        
        let urlString = "https://pokeapi.co/api/v2/pokemon/\(searchText)"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("error!!!")
                return
            }
            if let pokemon = self.parseJSON(withData: data) {
                print(pokemon)
                completionHandler(pokemon)
            }
        }
        task.resume()
    }
    
//    func fetchSprites(pokemonName: String, completionHandler: @escaping (Sprite) -> Void) {
//
//        let urlString = "https://pokeapi.co/api/v2/pokemon/\(pokemonName)"
//        guard let url = URL(string: urlString) else { return }
//
//        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
//        request.httpMethod = "GET"
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data else {
//                print("error!!!")
//                return
//            }
//            if let pokemon = self.parseSprites(withData: data) {
//                print(pokemon)
//                completionHandler(pokemon)
//            }
//        }
//        task.resume()
//    }
    
    func parseJSON(withData data: Data) -> Pokemon? {
        
        let decoder = JSONDecoder()
        do {
            let pokemonData = try decoder.decode(PokemonData.self, from: data)
            guard let pokemon = Pokemon(pokemonData: pokemonData) else { return nil }
            return pokemon
        } catch let error {
            print("Ошибка!!! \(error.localizedDescription)")
        }
        return nil
    }
    
//    func parseSprites(withData data: Data) -> Sprite? {
//        
//        let decoder = JSONDecoder()
//        do {
//            let pokemonData = try decoder.decode(PokemonData.self, from: data)
//            let sprites = Sprite(pokemonData: pokemonData)
////            guard let sprite = Sprite(pokemonData: pokemonData) else { return nil }
//            return sprites
//        } catch let error {
//            print("Ошибка!!! \(error)")
//        }
//        return nil
//    }
}
