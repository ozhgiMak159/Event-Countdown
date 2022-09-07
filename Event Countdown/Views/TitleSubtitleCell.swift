//
//  TitleSubtitleCell.swift
//  Event Countdown
//
//  Created by Maksim  on 07.09.2022.
//

import UIKit

enum Cell {
    case titleSubtitle(TitleSubtitleCellViewModel)
    case titleImage
}

final class TitleSubtitleCell: UITableViewCell {
    private let titleLabel = UILabel()
    private let subtitleTextField = UITextField()
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
    
    func update(with viewModel: TitleSubtitleCellViewModel) {
        titleLabel.text = viewModel.title
        subtitleTextField.text = viewModel.subtitle
        subtitleTextField.placeholder = viewModel.placeholder
    }
    
    private func setupView() {
        verticalStackView.axis = .vertical
        titleLabel.font = .systemFont(ofSize: 22, weight: .medium)
        subtitleTextField.font = .systemFont(ofSize: 20, weight: .medium)
        
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
//        [verticalStackView, titleLabel, subtitleTextField].forEach { tamik in
//            tamik.translatesAutoresizingMaskIntoConstraints = false
//        }
    }
    
    private func setupHierarchy() {
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(subtitleTextField)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            verticalStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            verticalStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
        
        
        
    }
    
    
}
