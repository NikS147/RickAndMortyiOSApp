//
//  RMSearchResultsViewModel.swift
//  RickAndMorty
//
//  Created by Никита Солодков on 02.03.2024.
//

import Foundation

enum RMSearchResultsViewModel {
    case characters([RMCharacterCollectionCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
}
