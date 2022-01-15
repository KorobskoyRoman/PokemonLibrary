//
//  PokemonCell.swift
//  PokemonLibrary
//
//  Created by Roman Korobskoy on 09.01.2022.
//

import UIKit
import SDWebImage

protocol PokemonCellModel {
    var name: String { get }
    var orderString: String { get }
    var frontDefault: String { get }
}

class PokemonCell: UITableViewCell {

    @IBOutlet var pokemonImage: UIImageView!
    @IBOutlet var pokemonNameLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    var pokemonModel = [Pokemon]()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        pokemonImage.image = nil
    }
    
    func set(pokemon: PokemonCellModel) {
        self.pokemonNameLabel.text = pokemon.name
        self.numberLabel.text = pokemon.orderString
        
        guard let url = URL(string: pokemon.frontDefault) else { return }
        self.pokemonImage.sd_setImage(with: url, completed: nil)
    }
}
