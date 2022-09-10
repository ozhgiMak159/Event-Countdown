//
//  EventListViewController.swift
//  Event Countdown
//
//  Created by Maksim  on 07.09.2022.
//

import UIKit

class EventListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: EventListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        tableView.register(EventCell.self, forCellReuseIdentifier: "Cell")
        viewModel.viewDidLoad()
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension EventListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath)
    }
    
    
}

extension EventListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.cell(at: indexPath) {
        case .event(let eventCellViewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EventCell
            cell.update(with: eventCellViewModel)
            return cell
        }
    }
    
    
}

extension EventListViewController {
    
    // Setup Navigation bar
    private func setupNavigationBar() {
        let plusImage = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(tappedAddEventButton))
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.configureWithOpaqueBackground()
//
//        navBarAppearance.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
//        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
//
//        navBarAppearance.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
//
//        navigationController?.navigationBar.standardAppearance = navBarAppearance
//        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        barButtonItem.tintColor = .white
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = viewModel.title
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc private func tappedAddEventButton() {
        viewModel.tappedAddEvent()
    }
    
}
