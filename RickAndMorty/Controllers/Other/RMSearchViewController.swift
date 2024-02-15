//
//  RMSearchViewController.swift
//  RickAndMorty
//
//  Created by Никита Солодков on 15.02.2024.
//

import UIKit

/// Configurable controller to search 
final class RMSearchViewController: UIViewController {
    
    struct RMConfig {
        enum `Type` {
            case character
            case episode
            case location
        }
        let type: `Type`
    }
    
    private let config: RMConfig
    
    init(config: RMConfig) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        view.backgroundColor = .systemBackground
    }

}
