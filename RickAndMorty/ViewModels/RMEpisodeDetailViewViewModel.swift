//
//  RMEpisodeDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Никита Солодков on 15.02.2024.
//

import Foundation

final class RMEpisodeDetailViewViewModel {
    private let endpointURL: URL?
    
    init(endpointURL: URL?) {
        self.endpointURL = endpointURL
        fetchEpisodeData()
    }
    
    private func fetchEpisodeData() {
        guard let url = endpointURL, let request = RMRequest(url: url) else { return }
        
        RMService.shared.execute(request, expecting: RMEpisode.self) { result in
            switch result {
            case .success(let success):
                print(String(describing: success))
            case .failure(let failure):
                print(String(describing: failure))
            }
        }
    }
}
