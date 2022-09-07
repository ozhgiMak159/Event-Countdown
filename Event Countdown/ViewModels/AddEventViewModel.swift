//
//  AddEventViewModel.swift
//  Event Countdown
//
//  Created by Maksim  on 07.09.2022.
//

import UIKit

final class AddEventViewModel {
    
    var onUpdate: () -> Void = {}
    var title = "Add"
    
    var coordinator: AddEventCoordinator?
    private(set) var cells: [Cell] = []
    
    func viewDidLoad() {
        cells = [
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Name", subtitle: "", placeholder: "Add a name")),
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Date", subtitle: "", placeholder: "Select a date"))
        ]
        onUpdate()
    }
    
    func viewDidDisappear() {
        coordinator?.didFinishAddEvent()
    }
    
    func numberOfRows() -> Int {
        cells.count
    }
    
    func cell(for indexPath: IndexPath) -> Cell {
        cells[indexPath.row]
    }
    
    func tappedDone() {
        print("1234")
    }
    
}
