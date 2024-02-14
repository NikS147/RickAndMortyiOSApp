//
//  RMCharacterPhotoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Никита Солодков on 14.02.2024.
//

import Foundation

final class RMCharacterPhotoCollectionViewCellViewModel {
    private let imageURL: URL?
    
    init(imageURL: URL?) {
        self.imageURL = imageURL
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let imageURL = imageURL else {
            completion(.failure(URLError(.badURL)))
            return
        }
        RMImageManager.shared.downloadImage(imageURL, completion: completion)
    }
}
