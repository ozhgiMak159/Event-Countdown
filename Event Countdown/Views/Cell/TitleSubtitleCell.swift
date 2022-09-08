//
//  TitleSubtitleCell.swift
//  Event Countdown
//
//  Created by Maksim  on 07.09.2022.
//

import UIKit

enum Cell {
    case titleSubtitle(TitleSubtitleCellViewModel)
}

final class TitleSubtitleCell: UITableViewCell {
 
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var subtitleTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 20, weight: .medium)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var datePickerView: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        return datePicker
    }()
    
    private let photoImageView = UIImageView()
    
    
    private lazy var toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 45)) // ????
    private lazy var doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tapedDone))
    
    private lazy var verticalStackView = UIStackView()
    
    private var viewModel: TitleSubtitleCellViewModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: TitleSubtitleCellViewModel) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        subtitleTextField.text = viewModel.subtitle
        subtitleTextField.placeholder = viewModel.placeholder
        
        subtitleTextField.inputView = viewModel.type == .text
            ? nil
            : datePickerView
        
        subtitleTextField.inputAccessoryView = viewModel.type == .text
            ? nil
            : toolbar
        
        photoImageView.isHidden = viewModel.type != .image
        subtitleTextField.isHidden = viewModel.type == .image
        
       // verticalStackView.spacing = viewModel.type == .image ? 15 : verticalStackView.spacing
    }
    
    
    @objc private func tapedDone() {
        viewModel?.update(datePickerView.date)
    }
    
    private func setupViews() {
        verticalStackView = UIStackView(
            arrangedSubviews: [titleLabel, subtitleTextField, photoImageView],
            axis: .vertical,
            spacing: 10
        )
        
        contentView.addSubview(verticalStackView)
        toolbar.setItems([doneButton], animated: false)
       // datePickerView.datePickerMode = .date
        photoImageView.backgroundColor = .black.withAlphaComponent(0.4)
        photoImageView.layer.cornerRadius = 10
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            verticalStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            verticalStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
        
        photoImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
    
}
