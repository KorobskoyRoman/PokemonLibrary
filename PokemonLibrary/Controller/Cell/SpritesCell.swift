//
//  SpritesCell.swift
//  PokemonLibrary
//
//  Created by Roman Korobskoy on 15.01.2022.
//

import UIKit
import SDWebImage

protocol SpritesCellProtocol {
    var artWorkFrontDefault: String { get }
    var dreamWorldFrontDefault: String { get }
    var homeFrontDefault: String { get }
}

class SpritesCell: UICollectionViewCell {
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var spritesImageView: UIImageView!
    var sprite: Pokemon!
    var networkingManager = NetworkingManager()
    
    func set(sprites: SpritesCellProtocol) {
        
        guard let url = URL(string: sprite.artWorkFrontDefault) else { return }
        self.spritesImageView.sd_setImage(with: url, completed: nil)
        label1.text = sprite.artWorkFrontDefault
    }
}
