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
    private var optionMap: [RMSearchInputViewViewModel.DynamicOption : String] = [:]
    private var searchText = ""
    
    private var optionMapUpdateBlock: (((RMSearchInputViewViewModel.DynamicOption, String)) -> Void)?
    
    // MARK: - Init
    
    init(config: RMSearchViewController.RMConfig) {
        self.config = config
    }
    
    // MARK: - Public
    
    public func executeSearch() {
        // Create request based on filters
        // Send API Call
        // Notify view of results, no results or error
    }
    
    public func set(query text: String) {
        self.searchText = text
    }
    
    public func set(value: String, for option: RMSearchInputViewViewModel.DynamicOption) {
        optionMap[option] = value
        let tuple = (option, value)
        optionMapUpdateBlock?(tuple)
    }
    
    public func registerOptionChangeBlock(_ block: @escaping ((RMSearchInputViewViewModel.DynamicOption, String)) -> Void) {
        self.optionMapUpdateBlock = block
    }
}
