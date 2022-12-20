//
//  NewsViewController.swift
//  StartupNews
//
//  Created by Isaac Dimas on 17/12/22.
//

import UIKit

protocol NewsViewDelegate: NSObject {
    func showNews()
}
protocol NewsFilterDelegate: NSObject {
    func getNewsByCategory(category: NewsCategory)
}

protocol NewsSearchDelegate: NSObject {
    func showSearchNews()
}

final class NewsViewController: UIViewController, ViewControllerInstanceDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var newsTableView: UITableView!
    @IBOutlet weak var searchNewsTableView: UITableView!
    weak private var cell: NewsTableViewCell?
    
    // MARK: - Delegates
    weak var coordinatorDelegate: MainCoordinator?
    private var presenter = NewsPresenter(newsApiService: NewsAPI())
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.setNewsDelegate(newsViewDelegate: self)
        self.presenter.setNewsSearchDelegate(newsSearchDelegate: self)
        self.presenter.getAllNews(category: .startup)
        self.registerCell()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.title = LocalizableKeys.Home.title
    }
    override func viewDidAppear(_ animated: Bool) {
        self.activityIndicator.startAnimating()
    }
    
    //MARK: - Private Methods
    
    /// Registers customs cells for the table view
    private func registerCell() {
        self.newsTableView.register(UINib(nibName: LocalizableKeys.Home.newsNibName,
                                          bundle: nil),
                                    forCellReuseIdentifier: LocalizableKeys.Home.newsCellId)
        self.searchNewsTableView.register(UINib(nibName: LocalizableKeys.Home.newsNibName,
                                                bundle: nil),
                                          forCellReuseIdentifier: LocalizableKeys.Home.newsCellId)
    }
    /// Shows a modal menu which displays the categories options for the news
    ///
    /// - Parameters:
    ///    - sender: Contains a button object
    @IBAction private func showMenu(_ sender: UIBarButtonItem) {
        self.coordinatorDelegate?.pushMenuViewController()
    }
}

// MARK: - TableView's Datasource
extension NewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.newsTableView {
            return self.presenter.getTotalNews()
        } else {
            return self.presenter.getTotalFilteredNews()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.newsTableView {
            self.cell = newsTableView.dequeueReusableCell(withIdentifier: LocalizableKeys.Home.newsCellId, for: indexPath) as? NewsTableViewCell
            self.cell?.setNews(news: self.presenter.getNews(indexPath: indexPath.row))
            return self.cell ?? NewsTableViewCell()
        } else {
            self.cell = searchNewsTableView.dequeueReusableCell(withIdentifier: LocalizableKeys.Home.newsCellId, for: indexPath) as? NewsTableViewCell
            self.cell?.setNews(news: self.presenter.getFilteredNews(indexPath: indexPath.row))
            return self.cell ?? NewsTableViewCell()
        }
    }
}

// MARK: - TableView's Delegate
extension NewsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.newsTableView {
            tableView.deselectRow(at: indexPath, animated: true)
            let news = presenter.getNews(indexPath: indexPath.row)
            self.coordinatorDelegate?.pushDetailViewController(with: news)
        } else {
            tableView.deselectRow(at: indexPath, animated: true)
            let news = presenter.getFilteredNews(indexPath: indexPath.row)
            self.coordinatorDelegate?.pushDetailViewController(with: news)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

// MARK: - Implement NewsViewDelegate
extension NewsViewController: NewsViewDelegate {
    
    /// Shows news in table newsTableView
    func showNews() {
        DispatchQueue.main.async {
            self.newsTableView.reloadData()
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.newsTableView.alpha = 1
            self.newsTableView.isUserInteractionEnabled = true
        }
    }
}

// MARK: - Implement NewsSearchViewDelegate
extension NewsViewController: NewsSearchDelegate {
    
    /// Shows the search news in table searchNewsTableView
    func showSearchNews() {
        DispatchQueue.main.async {
            self.searchNewsTableView.reloadData()
        }
    }
}


// MARK: - Implement NewsFilterDelegate
extension NewsViewController: NewsFilterDelegate {
    
    /// Makes a Request according to the category
    ///
    /// - Parameters:
    ///    - category: The new's category for requesting
    func getNewsByCategory(category: NewsCategory) {
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        self.newsTableView.isUserInteractionEnabled = false
        self.newsTableView.alpha = 0.6
        self.presenter.getAllNews(category: category)
        self.title = "\(category.categoryName) News"
        LocalizableKeys.Home.title = "\(category.categoryName) News"
    }
}

// MARK: - Implement SearchBarDelegate
extension NewsViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.newsTableView.isHidden = false
            self.searchNewsTableView.isHidden = true
        } else {
            self.newsTableView.isHidden = true
            self.searchNewsTableView.isHidden = false
            self.presenter.getSearchNews(wordToSearch: searchText)
        }
        
    }
}
