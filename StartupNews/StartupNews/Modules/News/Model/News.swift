//
//  News.swift
//  StartupNews
//
//  Created by Isaac Dimas on 17/12/22.
//

import Foundation

// MARK: - APIResponse
struct APIResponse: Decodable {
    let category: String
    let data: [News]
}
// MARK: - News
struct News: Decodable {
    let author: String
    let content: String
    let date: String
    let id: String
    let imageUrl: String
    let readMoreUrl: String?
    let time: String
    let title: String
}
// MARK: - NewsCategory
public enum NewsCategory: CaseIterable {
    case national
    case business
    case sports
    case world
    case politics
    case technology
    case startup
    case entertainment
    case miscellaneous
    case hatke
    case science
    case automobile
    
    var endPoint: String {
        switch self {
        case .national:
            return LocalizableKeys.Catagories.national
        case .business:
            return LocalizableKeys.Catagories.business
        case .sports:
            return LocalizableKeys.Catagories.sports
        case .world:
            return LocalizableKeys.Catagories.world
        case .politics:
            return LocalizableKeys.Catagories.politics
        case .technology:
            return LocalizableKeys.Catagories.technology
        case .startup:
            return LocalizableKeys.Catagories.startup
        case .entertainment:
            return LocalizableKeys.Catagories.entertainment
        case .miscellaneous:
            return LocalizableKeys.Catagories.miscellaneous
        case .hatke:
            return LocalizableKeys.Catagories.hatke
        case .science:
            return LocalizableKeys.Catagories.science
        case .automobile:
            return LocalizableKeys.Catagories.automobile
        }
    }
    
    var categoryName: String {
        switch self {
        case .national:
            return "National"
        case .business:
            return "Business"
        case .sports:
            return "Sports"
        case .world:
            return "World"
        case .politics:
            return "Politics"
        case .technology:
            return "Techonology"
        case .startup:
            return "Startup"
        case .entertainment:
            return "Entertainment"
        case .miscellaneous:
            return "Miscellaneous"
        case .hatke:
            return "Hatke"
        case .science:
            return "Science"
        case .automobile:
            return "Automobile"
        }
    }
}
