//
//  RMLocationViewViewModel.swift
//  RickAndMorty
//
//  Created by Никита Солодков on 26.02.2024.
//

import Foundation

final class RMLocationViewViewModel {
    
    private var locations: [RMLocation] = []
    
    private var cellViewModels: [String] = []
    
    // MARK: - Init
    
    init() {
        
    }
    
    public func fetchLocations() {
        RMService.shared.execute(.listLocationsRequests, expecting: String.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure(let failure):
                print(String(describing: failure))
            }
        }
    }
    
    private var hasMoreResults: Bool {
        return false
    }
}
