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
    
    weak var coordinator: AddEventCoordinator?
    private(set) var cells: [Cell] = []
    
    private var nameCellViewModel: TitleSubtitleCellViewModel?
    private var dateCellViewModel: TitleSubtitleCellViewModel?
    private var backgroundImageCellViewModel: TitleSubtitleCellViewModel?
    
    private let cellBuilder: EventsCellBuilder
    
    init(cellBuilder: EventsCellBuilder) {
        self.cellBuilder = cellBuilder
    }
    
    func viewDidLoad() {
        setupCells()
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
    func setupCells() {
        nameCellViewModel = cellBuilder.makeTitleSubtitleCellViewModel(.text, completion: { [weak self] in
            self?.onUpdate()
        })
        
        dateCellViewModel = cellBuilder.makeTitleSubtitleCellViewModel(.date, completion: { [weak self] in
            self?.onUpdate()
        })
        
        backgroundImageCellViewModel = cellBuilder.makeTitleSubtitleCellViewModel(.image, completion: { [weak self] in
            self?.onUpdate()
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
