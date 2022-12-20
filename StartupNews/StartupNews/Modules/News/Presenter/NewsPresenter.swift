//
//  NewsPresenter.swift
//  StartupNews
//
//  Created by Isaac Dimas on 17/12/22.
//

import Foundation

final class NewsPresenter {
    
    // MARK: - Atributes
    weak private var newsViewDelegate: NewsViewDelegate?
    weak private var newsSearchDelegate: NewsSearchDelegate?
    private var newsApiService: NewsAPI
    private var news = [News]()
    private var filteredNews = [News]()
    
    // MARK: - Init of class
    init(newsApiService: NewsAPI) {
        self.newsApiService = newsApiService
    }
    
    // MARK: - Methods
    
    /// Sets the value of the view delegate
    func setNewsDelegate(newsViewDelegate: NewsViewDelegate) {
        self.newsViewDelegate = newsViewDelegate
    }
    
    /// Sets the value of the search delegate
    func setNewsSearchDelegate(newsSearchDelegate: NewsSearchDelegate) {
        self.newsSearchDelegate = newsSearchDelegate
    }
    
    /// Gest the number of news retrieved in the query
    ///  - Returns: The number of the news retrieved
    func getTotalNews() -> Int {
        return self.news.count
    }
    
    /// Gets the number of the filtered news retrieved in the query
    ///  - Returns: The number of the filtered news
    func getTotalFilteredNews() -> Int {
        return self.filteredNews.count
    }
    
    /// Gets a news object according to the indexPath of the table view
    ///
    /// - Parameters:
    ///    - indexPath: The index of the array of news to query
    /// - Returns: A news object
    func getNews(indexPath: Int) -> News {
        return news[indexPath]
    }
    
    /// Gets a filtered news object according to the indexPath of the table view
    ///
    /// - Parameters:
    ///    - indexPath: The index of the array of the filtered news
    /// - Returns: A news object
    func getFilteredNews(indexPath: Int) -> News {
        return filteredNews[indexPath]
    }
    
    /// Makes an API request  according to a category
    ///
    /// - Parameters:
    ///    - category: Represents the name of the category used in the endpoint
    func getAllNews(category: NewsCategory) {
        self.newsApiService.getNews(category: category.endPoint) { [weak self] news in
            self?.news = news
            self?.newsViewDelegate?.showNews()
        }
    }
    
    /// Gets the filtered news according to the query
    ///
    /// - Parameters:
    ///    - wordToSearch: Represents the query of the search
    func getSearchNews(wordToSearch: String) {
        self.filteredNews = news.filter{ $0.title.contains(wordToSearch) }
        self.newsSearchDelegate?.showSearchNews()
    }
}
