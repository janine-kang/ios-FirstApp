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
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - completion: Callback with data or error
    public func execute(_ request: RMRequest, completion: @escaping ()->Void) {
        
    }
}
