//
//  EventListViewController.swift
//  Event Countdown
//
//  Created by Maksim  on 07.09.2022.
//

import UIKit

class EventListViewController: UIViewController {
    
    // достаем методы и свойсва из - EventListViewModel
    var viewModel: EventListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
}


extension EventListViewController {
    
    // Setup Navigation bar
    private func setupNavigationBar() {
        let plusImage = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(tappedAddEventButton))
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        
        navBarAppearance.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.9178135348)]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.9178135348)]
        
        navBarAppearance.backgroundColor = #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        barButtonItem.tintColor = .white
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = viewModel.title
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc private func tappedAddEventButton() {
        viewModel.tappedAddEvent()
    }
    
}
