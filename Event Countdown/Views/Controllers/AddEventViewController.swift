//
//  AddEventViewController.swift
//  Event Countdown
//
//  Created by Maksim  on 07.09.2022.
//

import UIKit

class AddEventViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: AddEventViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TitleSubtitleCell.self, forCellReuseIdentifier: "TitleSubtitleCell")
        
        viewModel.viewDidLoad()
        updateTableView()
        setupNavigationBar()
        setupTableView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }
    
    @objc private func tappedDone() {
        viewModel.tappedDone()
    }
    
    private func updateTableView() {
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension AddEventViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel.cell(for: indexPath)
        
        switch cellViewModel {
        case .titleSubtitle(let titleSubtitleCellViewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleSubtitleCell", for: indexPath) as! TitleSubtitleCell
            cell.configure(with: titleSubtitleCellViewModel)
            cell.subtitleTextField.delegate = self
            
            return cell
        }
    }
}

extension AddEventViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}



extension AddEventViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentText = textField.text else { return false }
        let text = currentText + string
        let point = textField.convert(textField.bounds.origin, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) {
            viewModel.updateCell(indexPath: indexPath, subtitle: text)
        }
        return true
    }
}

extension AddEventViewController {
    
    private func setupNavigationBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        navBarAppearance.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tappedDone))
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    private func setupTableView() {
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.setContentOffset(.init(x: 0, y: -1), animated: false)
    }
}
