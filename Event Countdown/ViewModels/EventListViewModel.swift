//
//  EventListViewModel.swift
//  Event Countdown
//
//  Created by Maksim  on 07.09.2022.
//

import Foundation

enum CellEvent {
    case event(EventCellViewModel)
}

final class EventListViewModel {
    
    weak var coordinator: EventListCoordinator?
    let title = "Events"
    var onUpdate = {}
    
    
    
    private(set) var cells: [CellEvent] = []
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager = CoreDataManager.shared) {
        self.coreDataManager = coreDataManager
    }
    
    func viewDidLoad() {
        reload()
    }
    
    func reload() {
        let events = coreDataManager.fetchEvent()
        cells = events.map { .event(EventCellViewModel($0)) }
        onUpdate()
    }
    
    func tappedAddEvent() {
        coordinator?.startAddNewEvent()
    }
    
    func numberOfRows() -> Int {
        cells.count
    }
    
    func cell(at indexPath: IndexPath) -> CellEvent {
        return cells[indexPath.row]
    }
    
    
}
