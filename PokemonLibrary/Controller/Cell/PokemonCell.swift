//
//  PokemonCell.swift
//  PokemonLibrary
//
//  Created by Roman Korobskoy on 09.01.2022.
//

import UIKit
import SDWebImage

class PokemonCell: UITableViewCell {

    @IBOutlet var pokemonImage: UIImageView!
    @IBOutlet var pokemonNameLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        pokemonImage.image = nil
    }
    
    func set(pokemon: Pokemon) {
//        self.pokemonImage.image = pokemon.frontDefault
        self.pokemonNameLabel.text = pokemon.name
        self.numberLabel.text = String(pokemon.order)
        
        guard let url = URL(string: pokemon.frontDefault) else { return }
        self.pokemonImage.sd_setImage(with: url, completed: nil)
    }
}
