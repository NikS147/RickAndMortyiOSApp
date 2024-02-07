//
//  RMService.swift
//  RickAndMorty
//
//  Created by Никита Солодков on 06.02.2024.
//

import Foundation

/// Primary API service object to get Rick And Morty data
final class RMService {
    /// Shared singletone instance
    static let shared = RMService(); private init() { }
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object we except to get back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>(_ request: RMRequest, expecting type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
    }
}
