//
//  AddEventViewModel.swift
//  Event Countdown
//
//  Created by Maksim  on 07.09.2022.
//

import Foundation

final class AddEventViewModel {
    
    var coordinator: AddEventCoordinator?
    
    func viewDidDisappear() {
        coordinator?.didFinishAddEvent()
    }
    
    
    
}
