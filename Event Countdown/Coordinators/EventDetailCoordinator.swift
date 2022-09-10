//
//  EventDetailCoordinator.swift
//  Event Countdown
//
//  Created by Maksim  on 10.09.2022.
//

import CoreData
import UIKit

final class EventDetailCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    private let eventID: NSManagedObjectID
    var parentCoordinator: EventListCoordinator?
    
    init(navigationController: UINavigationController, eventID: NSManagedObjectID) {
        self.navigationController = navigationController
        self.eventID = eventID
    }
    
    func start() {
        let detailViewController: EventDetailViewController = .createObject()
        let eventDetailViewModel = EventDetailViewModel(eventID: eventID)
        eventDetailViewModel.coordinator = self
        detailViewController.viewModel = eventDetailViewModel
        
        navigationController.pushViewController(detailViewController, animated: true)
    }
    
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
    
    deinit {
        print("detail coordinator deinit")
    }
    
}
