//
//  EventListViewModel.swift
//  Event Countdown
//
//  Created by Maksim  on 07.09.2022.
//

import Foundation

final class EventListViewModel {
    
    let title = "Events"
    
    // ХЗ - надо ли это
    weak var coordinator: EventListCoordinator?
    
    func tappedAddEvent() {
        coordinator?.startAddNewEvent()
    }
    
    
}
