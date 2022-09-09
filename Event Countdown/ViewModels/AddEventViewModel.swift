//
//  AddEventViewModel.swift
//  Event Countdown
//
//  Created by Maksim  on 07.09.2022.
//

import UIKit

final class AddEventViewModel {
    
   // var onUpdate: () -> Void = {}
    var title = "Add"
    
    weak var coordinator: AddEventCoordinator?
    private(set) var cells: [Cell] = []
   
    func viewDidLoad(completion: @escaping () -> Void) {
        
        cells = [
            .titleSubtitle(TitleSubtitleCellViewModel(
                title: "Name",
                subtitle: "",
                placeholder: "Add a name",
                type: .text,
                onCellUpdate: {
                    completion()
                })
            ),
            
            .titleSubtitle(TitleSubtitleCellViewModel(
                    title: "Date",
                    subtitle: "",
                    placeholder: "Select a date",
                    type: .date,
                    onCellUpdate: {
                        completion()
                    })
            ),
            
            .titleSubtitle(TitleSubtitleCellViewModel(
                    title: "Image",
                    subtitle: "",
                    placeholder: "",
                    type: .image,
                    onCellUpdate: {
                        completion()
                    })
            )
        ]
        completion()
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
    
    func updateCell(indexPath: IndexPath, subtitle: String) {
        switch cells[indexPath.row] {
        case .titleSubtitle(let titleSubtitleCellViewModel):
            titleSubtitleCellViewModel.update(subtitle)
        }
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        switch cells[indexPath.row] {
        case .titleSubtitle(let titleSubtitleCellViewModel):
            guard titleSubtitleCellViewModel.type == .image else { return }
            coordinator?.showImagePicker { image in
                
            }
        }
    }
}
