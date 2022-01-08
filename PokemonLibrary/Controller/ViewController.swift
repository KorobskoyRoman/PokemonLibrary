//
//  ViewController.swift
//  PokemonLibrary
//
//  Created by Roman Korobskoy on 08.01.2022.
//

import UIKit

class ViewController: UITableViewController {
    
    var pokemons = [Pokemon]()
    let searchController = UISearchController(searchResultsController: nil)
    let networkingManager = NetworkingManager()
    let defaultPokemons = ["pikachu", "bulbasaur", "ivysaur", "venusaur", "charmander", "charmeleon", "charizard"]
    
    private var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        networkingManager.fetchPokemon()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let pokemon = pokemons[indexPath.row]
//        var content = cell.defaultContentConfiguration()
//        content.image = #imageLiteral(resourceName: "25")
//        content.text = "\(pokemon)"
//        content.imageProperties.cornerRadius = 33
//        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.placeholder = "Enter pokemon name..."
        searchController.searchBar.delegate = self
        searchController.searchBar.autocapitalizationType = .none
    }
    
    // *** СОЗДАТЬ ЯЧЕЙКУ ТАБЛИЦЫ ***
    
//    private func refreshLabels() {
//        let pokemon = [Pokemon]()
//        nameLabel.text = pokemon.first!.name
//
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.timer?.invalidate()
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { [self] _ in
            
            self.networkingManager.fetchPokemon(searchText: searchText) { [weak self] searchResults in
                self?.pokemons = [searchResults]
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        })
    }
}
