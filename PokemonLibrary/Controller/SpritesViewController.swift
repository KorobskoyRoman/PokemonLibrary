//
//  SpritesViewController.swift
//  PokemonLibrary
//
//  Created by Roman Korobskoy on 15.01.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class SpritesViewController: UICollectionViewController {
    
    @IBOutlet var collectionViewOutlet: UICollectionView!
    var pokemon = DetailsViewController().title
    var pokemons = [Pokemon]()
    var networkingManager = NetworkingManager()

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.networkingManager.fetchSprites(pokemonName: "pikachu", completionHandler: { results in
//            self.sprite = [results]
//        })
        
        self.networkingManager.fetchPokemon(searchText: pokemon ?? "no data") { results in
            self.pokemon = results.name
            print(results)
        }
        
//        self.collectionView!.register(SpritesCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(pokemons.count)
        return pokemons.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SpritesCell
//        let sprites = pokemons[indexPath.item]
        cell.set(sprites: pokemons.first!)
        cell.backgroundColor = .blue
        collectionView.reloadData()
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

