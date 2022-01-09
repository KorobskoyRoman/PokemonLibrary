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
    private lazy var footerView = FooterView()
    
    private var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        searchBar(searchController.searchBar, textDidChange: "pikachu")
        tableView.tableFooterView = footerView
        setupNavigationBar()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PokemonCell
        let pokemon = pokemons[indexPath.row]
        cell.set(pokemon: pokemon)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "В данный момент данных нет.\n Введите информацию в строку поиска выше."
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 0
        
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return pokemons.count > 0 ? 0 : 75
    }
    
    private func setupNavigationBar() {
        let navBar = UINavigationBar()
        navBar.prefersLargeTitles = true
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.placeholder = "Enter pokemon name..."
        searchController.searchBar.delegate = self
        searchController.searchBar.autocapitalizationType = .none
        searchController.hidesNavigationBarDuringPresentation = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetails" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let pokemons = pokemons[indexPath.row]
            let destVC = segue.destination as! DetailsViewController
            destVC.pokemonModel = [pokemons]
        }
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.timer?.invalidate()
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { [self] _ in
            footerView.showLoader()
            
            self.networkingManager.fetchPokemon(searchText: searchText) { [weak self] searchResults in
                self?.pokemons = [searchResults]
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    footerView.hideLoader()
                }
            }
        })
    }
}

// фильтр для поиска сохраненных покемонов, тут не работает из-за API
//
//extension ViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        filterContentForSearchText(searchController.searchBar.text!)
//    }
//
//    private func filterContentForSearchText(_ searchText: String) {
//        let filteredPokemons = pokemons.filter {
//            $0.name.contains(searchText)
//        }
//        tableView.reloadData()
//    }
//}
