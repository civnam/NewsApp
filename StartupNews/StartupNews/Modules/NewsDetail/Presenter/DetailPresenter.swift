//
//  DetailPresenter.swift
//  StartupNews
//
//  Created by Isaac Dimas on 18/12/22.
//

import Foundation

final class DetailPresenter {
    
    // MARK: - Atributes
    var news: News?
    
    // MARK: - Methods
    
    /// Gets the new's title
    ///
    /// - Returns: The title of the news
    func getNewsTitle() -> String {
        return self.news?.title ?? ""
    }
    
    /// Gets the new's image URL
    ///
    /// - Returns: The url of the new's image
    func getNewsImageUrl() -> String {
        return self.news?.imageUrl ?? ""
    }
    
    /// Gets the new's Date
    ///
    /// - Returns: The date of the news
    func getNewsDate() -> String {
        return self.news?.date ?? ""
    }
    
    /// Gets the new's Time
    ///
    /// - Returns: The time of the news
    func getNewsTime() -> String {
        return self.news?.time ?? ""
    }
    
    /// Gets the new's Author
    ///
    /// - Returns: The author of the news
    func getNewsAuthor() -> String {
        return self.news?.author ?? ""
    }
    
    /// Gets the new's Content
    ///
    /// - Returns: The content of the news
    func getNewsContent() -> String {
        return self.news?.content ?? ""
    }
    
    /// Gets the new's read more URL
    ///
    /// - Returns: The url for reading more
    func getReadMoreUrl() -> String {
        return self.news?.readMoreUrl ?? ""
    }
    
    /// Ask if the news has a read more link
    ///
    /// - Returns: A flag if exists a read more link
    func isNewsReadMoreEmpty() -> Bool? {
        return self.news?.readMoreUrl?.isEmpty
    }
}
