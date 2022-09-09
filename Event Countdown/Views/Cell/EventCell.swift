//
//  EventCell.swift
//  Event Countdown
//
//  Created by Maksim  on 09.09.2022.
//

import Foundation
import UIKit

final class EventCell: UITableViewCell {
    
    private let timeRemainingLabels = [UILabel(), UILabel(), UILabel(), UILabel()]
    private let dateLabel = UILabel()
    private let eventNameLabel = UILabel()
    
    private let backgroundImageView = UIImageView()
    private let verticalStackView = UIStackView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with viewModel: EventCellViewModel) {
        viewModel.timeRemainingString.enumerated().forEach { label in
            timeRemainingLabels[label.offset].text = label.element
        }
        dateLabel.text = viewModel.dateText
        eventNameLabel.text = viewModel.eventName
        viewModel.loadImage { image in
            self.backgroundImageView.image = image
        }
    }

    private func setupView() {
        (timeRemainingLabels + [dateLabel, eventNameLabel, backgroundImageView, verticalStackView]).forEach { tm in
            tm.translatesAutoresizingMaskIntoConstraints = false
        }
        
        timeRemainingLabels.forEach { view in
            view.font = .systemFont(ofSize: 26, weight: .medium)
            view.textColor = .white
        }
        dateLabel.font = .systemFont(ofSize: 22, weight: .medium)
        dateLabel.textColor = .white
        eventNameLabel.font = .systemFont(ofSize: 36, weight: .bold)
        eventNameLabel.textColor = .white
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .trailing
    }
    
    private func setupHierarchy() {
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(verticalStackView)
        contentView.addSubview(eventNameLabel)
        
        timeRemainingLabels.forEach { label in
            verticalStackView.addArrangedSubview(label)
        }
        
        verticalStackView.addArrangedSubview(UIView())
        verticalStackView.addArrangedSubview(dateLabel)
        
    }
    
    private func setupLayout() {
        backgroundImageView.pinToSuperviewEdges([.left, .top, .right], constant: 0)
        let bottomConstraint = backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        bottomConstraint.priority = .required - 1
        bottomConstraint.isActive = true
        
        backgroundImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        verticalStackView.pinToSuperviewEdges([.top, .right, .bottom], constant: 15)
        eventNameLabel.pinToSuperviewEdges([.left, .bottom], constant: 15)
    }
    
    
    
    
}
