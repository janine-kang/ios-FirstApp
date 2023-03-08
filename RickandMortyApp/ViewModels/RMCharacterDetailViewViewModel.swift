//
//  RMCharacterDetailViewViewModel.swift
//  RickandMortyApp
//
//  Created by Janine on 2023/03/06.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    
    // Create Character with a RMCharacter
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
