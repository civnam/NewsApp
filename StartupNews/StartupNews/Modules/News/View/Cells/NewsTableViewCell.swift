//
//  NewsTableViewCell.swift
//  StartupNews
//
//  Created by Isaac Dimas on 17/12/22.
//

import UIKit

final class NewsTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var newsImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    
    // MARK: Methods
    func setNews(news: News) {
        self.titleLabel.text = news.title
        self.dateLabel.text = news.date
        self.authorLabel.text = news.author
        self.newsImage.makeRounded()
        self.newsImage.loadImage(urlStr: news.imageUrl)
    }
}
