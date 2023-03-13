//
//  File2.swift
//  RickandMortyApp
//
//  Created by Janine on 2023/03/13.
//

import Foundation

final class RMCharacterInfoCollectionViewCellViewModel {
    public let value: String
    public let title: String
    
    init(
        value: String,
        title: String
    ) {
        self.value = value
        self.title = title
    }
}
