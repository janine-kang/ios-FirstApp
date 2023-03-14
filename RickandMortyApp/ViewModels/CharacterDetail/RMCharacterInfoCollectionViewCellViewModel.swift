//
//  File2.swift
//  RickandMortyApp
//
//  Created by Janine on 2023/03/13.
//

import UIKit

final class RMCharacterInfoCollectionViewCellViewModel {
    private let value: String
    private let type: `Type`
    
    /// initializing date formatters is incredibly expensive in terms of performance overhead
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ"
        formatter.timeZone = .current
        return formatter
    }()
    
    static let shortDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
    public var title: String {
        type.displayTitle
    }
    public var displayValue: String {
        if value.isEmpty { return "None" }
        
        if let date = Self.dateFormatter.date(from: value), type == .created {
            return Self.shortDateFormatter.string(from: date)
        }
        return value
    }
    
    public var iconImage: UIImage? {
        return type.iconImage
    }
    
    public var tintColor: UIColor {
        return type.tintColor
    }
    
    enum `Type`: String {
        case status
        case species
        case type
        case gender
        case origin
        case location
        case created
        case episodeCount
        
        var tintColor: UIColor {
            switch self {
            case .status:
                return .systemCyan
            case .species:
                return .systemRed
            case .type:
                return .systemGreen
            case .gender:
                return .systemYellow
            case .origin:
                return .systemOrange
            case .location:
                return .systemPurple
            case .created:
                return .systemBlue
            case .episodeCount:
                return .systemPink
            }
            
        }
        var iconImage: UIImage? {
            switch self {
            case .status:
                return UIImage(systemName: "bell")
            case .species:
                return UIImage(systemName: "bell")
                
            case .type:
                return UIImage(systemName: "bell")
                
            case .gender:
                return UIImage(systemName: "bell")
            case .origin:
                return UIImage(systemName: "bell")
            case .location:
                return UIImage(systemName: "bell")
            case .created:
                return UIImage(systemName: "bell")
            case .episodeCount:
                return UIImage(systemName: "bell")
            }
            
        }
        
        var displayTitle: String {
            switch self {
            case .status,
                    .species,
                    .type,
                    .gender,
                    .origin,
                    .location,
                    .created:
                return rawValue.uppercased()
            case .episodeCount:
                return "EPISODE COUNT"
            }
        }
    }
    
    //MARK: - Init
    init(
        type: `Type`,
        value: String
    ) {
        self.type = type
        self.value = value
    }
}

