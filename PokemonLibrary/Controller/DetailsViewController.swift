//
//  DetailsViewController.swift
//  PokemonLibrary
//
//  Created by Roman Korobskoy on 09.01.2022.
//

import UIKit
import SDWebImage
import SwiftSVG

class DetailsViewController: UIViewController {

    @IBOutlet var pokemonNameLabel: UILabel!
    @IBOutlet var pokemonImage: UIImageView!
    @IBOutlet var pokedexNumber: UILabel!
    @IBOutlet var showShinyButton: UIButton!
    
    @IBOutlet var segmentedFirst: UILabel!
    @IBOutlet var segmentedSecond: UILabel!
    @IBOutlet var segmentedThird: UILabel!
    @IBOutlet var segmentedFourth: UILabel!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @IBOutlet var imagePokemon1: UIImageView!
    @IBOutlet var imagePokemon2: UIImageView!
    var pokemonModel = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshLabels()
        title = pokemonNameLabel.text
    }
    
    private func refreshLabels() {
    
        showShinyButton.backgroundColor = #colorLiteral(red: 0.7373737693, green: 0.9387527108, blue: 0.1350902021, alpha: 1)
        pokemonNameLabel.text = pokemonModel.first?.name
        guard let url = URL(string: pokemonModel.first?.frontDefault ?? "") else { return }
        pokemonImage.sd_setImage(with: url, completed: nil)
        pokedexNumber.text = pokemonModel.first?.orderString

        segmentedFirst.text = "Height:"
        segmentedSecond.text = "Weight:"
        segmentedThird.text = "\(pokemonModel.first!.heightString) cm"
        segmentedFourth.text = ("\(pokemonModel.first!.weightString) kg")
    
        guard let urlArt = URL(string: pokemonModel.first?.artWorkFrontDefault ?? "") else { return }
        imagePokemon1.sd_setImage(with: urlArt, completed: nil)
        
        guard let urlHome = URL(string: pokemonModel.first?.homeFrontDefault ?? "") else {return}
        imagePokemon2.sd_setImage(with: urlHome, completed: nil)
    }
    
    @IBAction func segmentedControllPressed(_ sender: UISegmentedControl) {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            
            segmentedThird.isHidden = false
            segmentedFourth.isHidden = false
            
            segmentedFirst.text = "Height:"
            segmentedSecond.text = "Weight:"
            segmentedThird.text = "\(pokemonModel.first!.heightString) cm"
            segmentedFourth.text = ("\(pokemonModel.first!.weightString) kg")
        } else {
            segmentedFirst.text = "Main ability of selected pokemon:"
            segmentedSecond.text = pokemonModel.first!.abilityName
            segmentedThird.isHidden = true
            segmentedFourth.isHidden = true
        }
    }
    
    @IBAction func showShinyAction(_ sender: UIButton) {
        
        if showShinyButton.currentTitle == "Show normal" {
            
            showShinyButton.setTitle("Show shiny", for: .normal)
            showShinyButton.backgroundColor = #colorLiteral(red: 0.7373737693, green: 0.9387527108, blue: 0.1350902021, alpha: 1)
            
            pokemonNameLabel.text = pokemonModel.first?.name
            guard let url = URL(string: pokemonModel.first?.frontDefault ?? "") else { return }
            pokemonImage.sd_setImage(with: url, completed: nil)
        } else {
            showShinyButton.setTitle("Show normal", for: .normal)
            showShinyButton.backgroundColor = #colorLiteral(red: 0.7373737693, green: 0.9387527108, blue: 0.1350902021, alpha: 1)
            
            guard let url = URL(string: pokemonModel.first?.frontShiny ?? "") else { return }
            pokemonImage.sd_setImage(with: url, completed: nil)
        }
    }
}
