//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Никита Солодков on 06.02.2024.
//

import Foundation

/// Represents unique API endpoints
@frozen enum RMEndpoint: String, CaseIterable, Hashable {
    /// Endpoint to gets character info
    case character
    /// Endpoint to gets location info
    case location
    /// Endpoint to gets episode info
    case episode
}
