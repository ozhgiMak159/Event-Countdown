//
//  Date + Ex.swift
//  Event Countdown
//
//  Created by Maksim  on 09.09.2022.
//

import Foundation

extension Date {
    
    func timeRemaining(until endDate: Date) -> String? {
        let dateComponentFormatter = DateComponentsFormatter()
        dateComponentFormatter.allowedUnits = [.year, .month, .weekOfMonth, .day]
        dateComponentFormatter.unitsStyle = .full
        return dateComponentFormatter.string(from: self, to: endDate)
    }
}
