//
//  WebViewController.swift
//  StartupNews
//
//  Created by Isaac Dimas on 18/12/22.
//

import UIKit
import WebKit

final class WebViewController: UIViewController, ViewControllerInstanceDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var webView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Atributes
    var webUrl: String?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupWebView()
    }
    
    // MARK: - Private Methods
    
    /// Prepares the webView
    private func setupWebView() {
        guard let webUrl = webUrl else {
            return
        }
        let urlLink = webUrl.filter{ $0 != " "}
        if let url = URL(string: urlLink) {
            let urlRequest = URLRequest(url: url)
            self.webView.load(urlRequest)
            self.webView.navigationDelegate = self
        }
    }
}

// MARK: - WebKit Methods
extension WebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.activityIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
    }
}
