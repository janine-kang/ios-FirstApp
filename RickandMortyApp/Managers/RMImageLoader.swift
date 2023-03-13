//
//  ImageLoader.swift
//  RickandMortyApp
//
//  Created by Janine on 2023/03/10.
//

import Foundation

final class RMImageLoader {
    static let shared = RMImageLoader()
    
    private var imageDataCache = NSCache<NSString, NSData>()
    
    private init() {}
    
    public func downloadImage(_ url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let key = url.absoluteString as NSString
        if let data = imageDataCache.object(forKey: key) {
            completion(.success(data as Data))
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] d, _, e in
            guard let d = d, e == nil else {
                completion(.failure(e ?? URLError(.badServerResponse)))
                return
            }
            let key = url.absoluteString as NSString
            let value = d as NSData
            self?.imageDataCache.setObject(value, forKey: key)
            completion(.success(d))
        }
        task.resume()
    }
}
