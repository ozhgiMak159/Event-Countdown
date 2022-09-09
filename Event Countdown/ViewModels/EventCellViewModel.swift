//
//  EventCellViewModel.swift
//  Event Countdown
//
//  Created by Maksim  on 09.09.2022.
//

import UIKit

struct EventCellViewModel {
    
    var timeRemainingString:
    
    var yearText: String {
        "1 year"
    }
    
    var monthText: String {
        "2 months"
    }
    
    var dayText: String {
        "2 days"
    }
    
    var weekText: String {
        "2 weeks"
    }
    
    var dateText: String {
        "25 Mar 2020"
    }
    
    var eventName: String {
        "Barbados"
    }
    
    var backgroundImage: UIImage {
        #imageLiteral(resourceName: "Новый год")
    }
    
    private let event: Event
    
    init(_ event: Event) {
        self.event = event
    }
    
    
    
    
}
