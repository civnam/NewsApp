//
//  DetailNewsViewController.swift
//  StartupNews
//
//  Created by Isaac Dimas on 18/12/22.
//

import UIKit

final class DetailNewsViewController: UIViewController, ViewControllerInstanceDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var newsHour: UIButton!
    @IBOutlet private weak var newsTitle: UITextView!
    @IBOutlet private weak var newsImage: UIImageView!
    @IBOutlet private weak var newsDate: UILabel!
    @IBOutlet private weak var newsBody: UITextView!
    @IBOutlet private weak var readMoreButton: UIButton!
    @IBOutlet private weak var authorName: UILabel!
    @IBOutlet private weak var newsCategory: UILabel!
    
    // MARK: - Delegates
    weak var coordinatorDelegate: MainCoordinator?
    var presenter = DetailPresenter()
    
    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.readMoreButton.isHidden = self.presenter.isNewsReadMoreEmpty() ?? true
        self.setNews()
    }
    
    // MARK: - Private Methods
    
    /// Makes a Request according to the category
    ///
    /// - Parameters:
    ///    - sender: Constaints a UIButton object
    @IBAction private func readMore(_ sender: UIButton) {
        let readMoreUrl = presenter.getReadMoreUrl()
        self.coordinatorDelegate?.pushWebViewController(with: readMoreUrl)
    }
    
    /// Sets the view according to the news
    private func setNews() {
        self.newsHour.setTitle(self.presenter.getNewsTime(), for: .normal)
        self.newsTitle.text = self.presenter.getNewsTitle()
        self.newsImage.loadImage(urlStr: self.presenter.getNewsImageUrl())
        self.newsDate.text = self.presenter.getNewsDate()
        self.newsBody.text = self.presenter.getNewsContent()
        self.authorName.text = self.presenter.getNewsAuthor()
    }
}

