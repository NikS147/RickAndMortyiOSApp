//
//  RMSearchResultViewModel.swift
//  RickAndMorty
//
//  Created by Никита Солодков on 02.03.2024.
//

import Foundation

enum RMSearchResultViewModel {
    case characters([RMCharacterCollectionCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
}
