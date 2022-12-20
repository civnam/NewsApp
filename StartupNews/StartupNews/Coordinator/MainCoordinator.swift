//
//  MainCoordinator.swift
//  StartupNews
//
//  Created by Isaac Dimas on 19/12/22.
//

import Foundation
import UIKit

final class MainCoordinator {
    
    // MARK: - Atributes
    private var newsController: NewsViewController?
    private var menuController: MenuViewController?
    private var detailController: DetailNewsViewController?
    private var webController: WebViewController?
    private let navigationController: UINavigationController
    
    // MARK: - Init of class
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    /// Pushes NewsViewController
    func pushNewsViewController() {
        self.newsController = NewsViewController.getInstance(storyboardName: .news)
        self.newsController?.coordinatorDelegate = self
        self.navigationController.pushViewController(self.newsController ?? NewsViewController(), animated: true)
    }
    
    /// Pushes MenuViewController
    func pushMenuViewController() {
        self.menuController = MenuViewController.getInstance(storyboardName: .news)
        self.menuController?.filterDelegate = self.newsController
        self.menuController?.coordinatorDelegate = self
        self.navigationController.present(self.menuController ?? MenuViewController(), animated: true)
    }
    
    /// Pushes DetailViewController
    func pushDetailViewController(with news: News) {
        self.detailController = DetailNewsViewController.getInstance(storyboardName: .detail)
        self.detailController?.presenter.news = news
        self.detailController?.coordinatorDelegate = self
        self.navigationController.pushViewController(self.detailController ?? DetailNewsViewController(), animated: true)
    }
    
    /// Pushes WebViewController
    func pushWebViewController(with link: String) {
        self.webController = WebViewController.getInstance(storyboardName: .detail)
        self.webController?.webUrl = link
        self.navigationController.present(self.webController ?? WebViewController(), animated: true)
    }
    
    /// Dismisses the view
    func dismissView() {
        self.navigationController.dismiss(animated: true)
    }
}
