//
//  File.swift
//  RickandMortyApp
//
//  Created by Janine on 2023/03/13.
//

import Foundation

final class RMCharacterEpisodeCollectionViewCellViewModel {
    private let episodeDataUrl: URL?
    
    init(
        episodeDataUrl: URL?
    ) {
        self.episodeDataUrl = episodeDataUrl
    }
}
