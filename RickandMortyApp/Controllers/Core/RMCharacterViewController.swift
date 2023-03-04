//
//  RMCharacterViewController.swift
//  RickandMortyApp
//
//  Created by Janine on 2023/03/01.
//

import UIKit


/// Controller to show and search for Characters
final class RMCharacterViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
//        let request = RMRequest(endpoint: .character, queryParameters: [URLQueryItem(name: "name", value: "rick"), URLQueryItem(name: "status", value: "alive")])
//        print(request.url)
        
        RMService.shared.execute(.listCharactersRequests,
                                 expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total: " + String(model.info.count))
                print("Page result count: " + String(model.results.count))
            case .failure(let e):
                print(String(describing: e))
            }
        }
    }
    
}
