//
//  EventsCellBuilder.swift
//  Event Countdown
//
//  Created by Maksim  on 09.09.2022.
//

import Foundation

struct EventsCellBuilder {
    
    func makeTitleSubtitleCellViewModel(_ type: CellType, completion:  (() -> Void)? = nil)  -> TitleSubtitleCellViewModel {
        switch type {
        case .text:
            return TitleSubtitleCellViewModel(
                title: "Name",
                subtitle: "",
                placeholder: "Add a name",
                type: .text,
                onCellUpdate: completion
            )
            
        case .date:
            return TitleSubtitleCellViewModel(
                title: "Date",
                subtitle: "",
                placeholder: "Select a date",
                type: .date,
                onCellUpdate: completion
            )
            
        case .image:
            return TitleSubtitleCellViewModel(
                title: "Image",
                subtitle: "",
                placeholder: "",
                type: .image,
                onCellUpdate: completion
            )
        }
    }
    
    
}
