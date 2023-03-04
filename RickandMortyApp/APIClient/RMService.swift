//
//  RMService.swift
//  RickandMortyApp
//
//  Created by Janine on 2023/03/01.
//

import Foundation


/// Primary API service object to get RM data
final class RMService {
    
    /// Shared singleton instance
    static let shared = RMService()
    /// Privatized constructor
    private init() {}
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object we expect to receive
    ///   - completion: Callback with data or error
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void) {
            guard let urlRequest = self.request(from: request) else {
                completion(.failure(RMServiceError.failedToCreateRequest))
                return
            }
            let task = URLSession.shared.dataTask(with: urlRequest){d, _ ,e in
                guard let d = d, e == nil else {
                    completion(.failure(e ?? RMServiceError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(type.self, from: d)
                    completion(.success(result))
                }
                catch {
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    // MARK: - Private
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {return nil}
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        
        return request
    }
}

