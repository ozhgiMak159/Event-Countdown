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
    
    private var nameCellViewModel: TitleSubtitleCellViewModel?
    private var dateCellViewModel: TitleSubtitleCellViewModel?
    private var backgroundImageCellViewModel: TitleSubtitleCellViewModel?
    
    func viewDidLoad(completion: @escaping () -> Void) {
        setupCells(completion: completion)
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
                titleSubtitleCellViewModel.update(image)
            }
        }
    }
}

private extension AddEventViewModel {
    func setupCells(completion: @escaping () -> Void) {
        nameCellViewModel = TitleSubtitleCellViewModel(
            title: "Name",
            subtitle: "",
            placeholder: "Add a name",
            type: .text,
            onCellUpdate: {
                completion()
            })
        
        dateCellViewModel = TitleSubtitleCellViewModel(
            title: "Date",
            subtitle: "",
            placeholder: "Select a date",
            type: .date,
            onCellUpdate: {
                completion()
            })
        
        backgroundImageCellViewModel = TitleSubtitleCellViewModel(
            title: "Image",
            subtitle: "",
            placeholder: "",
            type: .image,
            onCellUpdate: {
                completion()
            })
        
        guard let nameCellViewModel = nameCellViewModel,
              let dateCellViewModel = dateCellViewModel,
              let backgroundImageCellViewModel = backgroundImageCellViewModel  else { return }

        cells = [
            .titleSubtitle(nameCellViewModel),
            .titleSubtitle(dateCellViewModel),
            .titleSubtitle(backgroundImageCellViewModel)
        ]
    }
}
