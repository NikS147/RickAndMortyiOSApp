//
//  RMEpisodeDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Никита Солодков on 15.02.2024.
//

import Foundation

protocol RMEpisodeDetailViewViewModelDelegate: AnyObject {
    func didFetchEpisodeDetails()
}

final class RMEpisodeDetailViewViewModel {
    private let endpointURL: URL?
    
    private var dataTuple: (episode: RMEpisode, characters: [RMCharacter])? {
        didSet {
            createCellViewModels()
            delegate?.didFetchEpisodeDetails()
        }
    }
    
    enum SectionType {
        case information(viewModels: [RMEpisodeInfoCollectionViewCellViewModel])
        case characters(viewModels: [RMCharacterCollectionCellViewModel])
    }
    
    public weak var delegate: RMEpisodeDetailViewViewModelDelegate?
    
    public private(set) var cellViewModels: [SectionType] = []
    
    // MARK: - Init
    
    init(endpointURL: URL?) {
        self.endpointURL = endpointURL
    }
    
    public func character(at index: Int) -> RMCharacter? {
        guard let dataTuple = dataTuple else { return nil }
        
        return dataTuple.characters[index]
    }
    
    // MARK: - Private
    
    private func createCellViewModels() {
        guard let dataTuple = dataTuple else { return }
        
        let episode = dataTuple.episode
        let characters = dataTuple.characters
        
        var createdString = ""
        if let date = RMCharacterInfoCollectionViewCellViewModel.dateFormatter.date(from: episode.created) {
            createdString = RMCharacterInfoCollectionViewCellViewModel.shortDateFormatter.string(from: date)
        }
        
        cellViewModels = [
            .information(viewModels: [
                .init(title: "Episode Name", value: episode.name),
                .init(title: "Air Date", value: episode.air_date),
                .init(title: "Episode", value: episode.episode),
                .init(title: "Created", value: createdString)
            ]),
            .characters(viewModels: characters.compactMap {
                return RMCharacterCollectionCellViewModel(characterName: $0.name, characterStatus: $0.status, characterImageUrl: URL(string: $0.image))
            })
        ]
    }
    
    /// Fetch backing episode model
    public func fetchEpisodeData() {
        guard let url = endpointURL, let request = RMRequest(url: url) else { return }
        
        RMService.shared.execute(request, expecting: RMEpisode.self) { [weak self] result in
            switch result {
            case .success(let model):
                self?.fetchRelatedCharacters(episode: model)
            case .failure(let failure):
                print(String(describing: failure))
            }
        }
    }
    
    private func fetchRelatedCharacters(episode: RMEpisode) {
        let requests: [RMRequest] = episode.characters.compactMap { return URL(string: $0) }.compactMap {
            return RMRequest(url: $0)
        }
        
        // 10 of parallel requests
        // Notified once all done
        
        let group = DispatchGroup()
        var characters: [RMCharacter] = []
        
        for request in requests {
            group.enter() // +20
            RMService.shared.execute(request, expecting: RMCharacter.self) { result in
                defer {
                    group.leave() // -20
                }
                switch result {
                case .success(let model):
                    characters.append(model)
                case .failure(let failure):
                    print(String(describing: failure))
                    break
                }
            }
        }
        group.notify(queue: .main) {
            self.dataTuple = (episode: episode, characters: characters)
        }
    }
}
