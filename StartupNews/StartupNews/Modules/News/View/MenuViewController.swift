//
//  MenuViewController.swift
//  StartupNews
//
//  Created by Isaac Dimas on 17/12/22.
//

import UIKit

final class MenuViewController: UIViewController, ViewControllerInstanceDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var menuTableView: UITableView!
    weak private var cell: MenuTableViewCell?
    
    // MARK: - Atributes
    weak var filterDelegate: NewsFilterDelegate?
    weak var coordinatorDelegate: MainCoordinator?
    
    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
    }
    
    // MARK: - Private Methods
    
    /// Registers custom cells for the table
    private func registerCell() {
        self.menuTableView.register(UINib(nibName: LocalizableKeys.Home.menuNibName,
                                          bundle: nil),
                                    forCellReuseIdentifier: LocalizableKeys.Home.menuCellId)
    }
    /// Dismisses MenuViewController
    @IBAction private func dismissMenu(_ sender: UIButton) {
        self.coordinatorDelegate?.dismissView()
    }
    /// Makes a Request according to category selected
    ///
    /// - Parameters:
    ///    - sender: Contains a button object
    @objc private func getNewsByCategory(sender: UIButton) {
        self.filterDelegate?.getNewsByCategory(category: NewsCategory.allCases[sender.tag])
        self.coordinatorDelegate?.dismissView()
    }
}

// MARK: - TableView's DataSource
extension MenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewsCategory.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.cell = menuTableView.dequeueReusableCell(withIdentifier: LocalizableKeys.Home.menuCellId, for: indexPath) as? MenuTableViewCell
        self.cell?.categorySelection.setTitle(NewsCategory.allCases[indexPath.row].categoryName, for: .normal)
        self.cell?.categorySelection.tag = indexPath.row
        self.cell?.categorySelection.addTarget(self, action: #selector(getNewsByCategory(sender:)), for: .touchUpInside)
        return cell ?? MenuTableViewCell()
    }
}

// MARK: - TableView's Delegate
extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
