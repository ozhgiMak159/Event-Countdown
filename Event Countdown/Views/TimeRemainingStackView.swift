//
//  TimeRemainingStackView.swift
//  Event Countdown
//
//  Created by Maksim  on 10.09.2022.
//

import UIKit

final class TimeRemainingStackView: UIStackView {
    private let timeRemainingLabels = [UILabel(), UILabel(), UILabel(), UILabel()]
    
    func setup() {
        timeRemainingLabels.forEach { label in
            addArrangedSubview(label)
        }
        axis = .vertical
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func update(with viewModel: TimeRemainingViewModel) {
        timeRemainingLabels.forEach { element in
            element.text = ""
            element.font = .systemFont(ofSize: viewModel.fontSize, weight: .medium)
            element.textColor = .white
        }
        
        viewModel.timeRemainingParts.enumerated().forEach { label in
            timeRemainingLabels[label.offset].text = label.element
        }
        
        alignment = viewModel.alignment
        
    }
    
    
    
    
}
