//
//  DetailsViewController.swift
//  PokemonLibrary
//
//  Created by Roman Korobskoy on 09.01.2022.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {

    @IBOutlet var pokemonNameLabel: UILabel!
    @IBOutlet var pokemonImage: UIImageView!
    @IBOutlet var pokedexNumber: UILabel!
    
    @IBOutlet var segmentedFirst: UILabel!
    @IBOutlet var segmentedSecond: UILabel!
    @IBOutlet var segmentedThird: UILabel!
    @IBOutlet var segmentedFourth: UILabel!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    var pokemonModel = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshLabels()
    }
    
    private func refreshLabels() {
        
        pokemonNameLabel.text = pokemonModel.first?.name
        guard let url = URL(string: pokemonModel.first?.frontDefault ?? "") else { return }
        pokemonImage.sd_setImage(with: url, completed: nil)
        pokedexNumber.text = pokemonModel.first?.orderString
        
        segmentedFirst.text = "Height:"
        segmentedSecond.text = "Weight:"
        segmentedThird.text = pokemonModel.first?.heightString
        segmentedFourth.text = pokemonModel.first?.weightString
    }
}
