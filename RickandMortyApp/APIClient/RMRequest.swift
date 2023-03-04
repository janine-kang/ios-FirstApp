//
//  RMRequest.swift
//  RickandMortyApp
//
//  Created by Janine on 2023/03/01.
//

import Foundation


/// Object that represents a single API call
final class RMRequest {
    // base url
    // endpoint
    // path component
    // puery params
    
    
    /// API Constatns
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Desired endpoint
    private let endpoint: RMEndpoint
    
    
    /// Path components for API,  if any
    private let pathComponents: [String]
    
    /// Query Parmas for API, if any
    private let queryParameters: [URLQueryItem]
    
    
    /// Constructed url for the api request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let val = $0.value else {return nil}
                return "\($0.name)=\(val)"
            }).joined(separator: "&")
            string += argumentString
        }
        return string
    }
    
    
    /// Computed & Constructed URL
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    // MARK: - Public
    
    
    /// Contstuct request
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathComponents: Collection of Path components
    ///   - queryParameters: Collection of query params
    init(endpoint: RMEndpoint, pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}

extension RMRequest {
    static let listCharactersRequests = RMRequest(endpoint: .character)
}
