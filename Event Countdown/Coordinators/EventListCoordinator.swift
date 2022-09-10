//
//  EventListCoordinator.swift
//  Event Countdown
//
//  Created by Maksim  on 07.09.2022.
//

import UIKit
import CoreData

final class EventListCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    var onSaveEvent = {}
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // Загрузка это сцены вьюКонтроллера - EventListVC
    func start() {
        // создания объекта
        let eventListViewController: EventListViewController = .createObject()
        // Иницилизировали свойства 
        let eventListViewModel = EventListViewModel()
        eventListViewModel.coordinator = self
        onSaveEvent = eventListViewModel.reload
        eventListViewController.viewModel = eventListViewModel
        navigationController.setViewControllers([eventListViewController], animated: false)
    }
    
    func startAddNewEvent() {
        let addEventCoordinator = AddEventCoordinator(navigationController: navigationController)
        addEventCoordinator.parentCoordinator = self
        childCoordinators.append(addEventCoordinator)
        addEventCoordinator.start()
    }
    
    func onSelect(_ id: NSManagedObjectID) {
        let eventDetailCoordinator = EventDetailCoordinator(navigationController: navigationController, eventID: id)
        eventDetailCoordinator.parentCoordinator = self
        childCoordinators.append(eventDetailCoordinator)
        eventDetailCoordinator.start()
    }
    
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
    
}
