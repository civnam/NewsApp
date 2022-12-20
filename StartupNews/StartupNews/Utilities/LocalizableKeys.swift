//
//  LocalizableKeys.swift
//  StartupNews
//
//  Created by Isaac Dimas on 17/12/22.
//

import Foundation

/// Stores all the constants
struct LocalizableKeys {
    struct API {
        static let urlApi = "url.api".localized
    }
    struct Catagories {
        static let national = "category.national".localized
        static let business = "category.business".localized
        static let sports = "category.sports".localized
        static let world = "category.world".localized
        static let politics = "category.politics".localized
        static let technology = "category.technology".localized
        static let startup = "category.startup".localized
        static let entertainment = "category.entertainment".localized
        static let miscellaneous = "category.miscellaneous".localized
        static let hatke = "category.hatke".localized
        static let science = "category.science".localized
        static let automobile = "category.automobile".localized
    }
    struct Home {
        static let menuStoryboardName = "menu.storyboard.name".localized
        static let detailStoryboardName = "detail.storyboard.name".localized
        static let newsCellId = "news.cell.id".localized
        static let menuCellId = "menu.cell.id".localized
        static let newsNibName = "newsNibName".localized
        static let menuNibName = "menuNibName".localized
        static let menuIdentifier = "menu.identifier".localized
        static let detailIdentifier = "detail.identifier".localized
        static var title = "title".localized
    }
}
