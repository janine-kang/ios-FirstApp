//
//  RMGetAllCharacterResponse.swift
//  RickandMortyApp
//
//  Created by Janine on 2023/03/04.
//

import Foundation

struct RMGetAllCharactersResponse:Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: Info
    let results: [RMCharacter]
}
