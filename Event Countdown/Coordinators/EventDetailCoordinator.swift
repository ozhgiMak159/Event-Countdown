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
    
    init(navigationController: UINavigationController, eventID: NSManagedObjectID) {
        self.navigationController = navigationController
        self.eventID = eventID
    }
    
    func start() {
        let detailViewController: EventDetailViewController = .createObject()
        detailViewController.viewModel = EventDetailViewModel(eventID: eventID)
        navigationController.pushViewController(detailViewController, animated: true)
    }
    
    
}
