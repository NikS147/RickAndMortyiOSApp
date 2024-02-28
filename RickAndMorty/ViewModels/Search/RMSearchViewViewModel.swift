//
//  RMSearchViewViewModel.swift
//  RickAndMorty
//
//  Created by Никита Солодков on 28.02.2024.
//

import Foundation

// Responsibilities
// - show search results
// - show no results view
// - kick off API requests

final class RMSearchViewViewModel {
    let config: RMSearchViewController.RMConfig
    
    init(config: RMSearchViewController.RMConfig) {
        self.config = config
    }
}
