//
//  EventDetailViewController.swift
//  Event Countdown
//
//  Created by Maksim  on 10.09.2022.
//

import UIKit

final class EventDetailViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    var viewModel: EventDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.onUpdate = { [weak self] in
            self?.backgroundImageView.image = self?.viewModel.image
            
        }
        viewModel.viewDidLoad()
    }
    
    
}
