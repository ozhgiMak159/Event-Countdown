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
 
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 20, weight: .medium)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
        
    private lazy var verticalStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: TitleSubtitleCellViewModel) {
        titleLabel.text = viewModel.title
        subtitleTextField.text = viewModel.subtitle
        subtitleTextField.placeholder = viewModel.placeholder
    }
    

    private func setupViews() {
        verticalStackView = UIStackView(
            arrangedSubviews: [titleLabel, subtitleTextField],
            axis: .vertical,
            spacing: 10
        )
        
        contentView.addSubview(verticalStackView)
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
