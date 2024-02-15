//
//  RMEpisodeViewController.swift
//  RickAndMorty
//
//  Created by Никита Солодков on 06.02.2024.
//

import UIKit

/// Controller to show and search for Episodes
final class RMEpisodeViewController: UIViewController, RMEpisodeListViewDelegate {
    
    private let episodeListView = RMEpisodeListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Episodes"
        
        setupView()
    }
    
    private func setupView() {
        episodeListView.delegate = self
        view.addSubview(episodeListView)
        NSLayoutConstraint.activate([
            episodeListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            episodeListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            episodeListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            episodeListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - RMEpisodeListViewDelegate
    
    func rmEpisodeListView(_ episodeListView: RMEpisodeListView, didSelectEpisode episode: RMEpisode) {
        // Open detail controller for that episode
        let viewModel = RMEpisodeDetailViewViewModel(endpointURL: URL(string: episode.url))
        let detailVC = RMEpisodeDetailViewController(url: URL(string: episode.url))
        detailVC.navigationItem.largeTitleDisplayMode = .never
        
        navigationController?.pushViewController(detailVC, animated: true)
    }

}
