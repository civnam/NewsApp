//
//  String+Localizable.swift
//  StartupNews
//
//  Created by Isaac Dimas on 17/12/22.
//

import Foundation

extension String {
    
    /// Gets the localized string
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
