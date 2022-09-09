//
//  EventListViewModel.swift
//  Event Countdown
//
//  Created by Maksim  on 07.09.2022.
//

import Foundation

final class EventListViewModel {
    
    let title = "Events"
    
    weak var coordinator: EventListCoordinator?
    
    func tappedAddEvent() {
        coordinator?.startAddNewEvent()
    }
    
    
}
