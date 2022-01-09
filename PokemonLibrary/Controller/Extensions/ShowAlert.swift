//
//  ShowAlert.swift
//  PokemonLibrary
//
//  Created by Roman Korobskoy on 09.01.2022.
//

import Foundation
import UIKit

func showAlert(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let actionOk = UIAlertAction(title: "Ok", style: .default)
    
    alert.addAction(actionOk)
    alert.present(alert, animated: true, completion: nil)
}
