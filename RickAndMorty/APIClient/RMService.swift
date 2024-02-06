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
    ///   - completion: Callback with data or error
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {
        
    }
}
