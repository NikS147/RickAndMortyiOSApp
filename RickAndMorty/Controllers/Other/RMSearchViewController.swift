//
//  RMSearchViewController.swift
//  RickAndMorty
//
//  Created by Никита Солодков on 15.02.2024.
//

import UIKit

// Dynamic search option view
// Render results
// Render no results zero state
// Searching | API Call

/// Configurable controller to search
final class RMSearchViewController: UIViewController {
    
    /// Configuration for search session
    struct RMConfig {
        enum `Type` {
            case character // allow name | gender | status
            case episode // allow name
            case location // allow name | type
            
            var title: String {
                switch self {
                case .character:
                    return "Search Character"
                case .episode:
                    return "Search Episode"
                case .location:
                    return "Search Location"
                }
            }
        }
        let type: `Type`
    }
    
    private let config: RMConfig
    
    // MARK: - Init
    
    init(config: RMConfig) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = config.type.title
        view.backgroundColor = .systemBackground
    }
    
}
