//
//  ViewController.swift
//  SettingsScreen
//
//  Created by mac on 30.05.22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    // MARK: - Properties
    
    private var settingsView: SettingsView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsView
    }
    
    private lazy var model: [[SettingsContent]] = SettingsContentModel().createModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = SettingsView()
        setupNavigationController()
        configureView()
    }
}

// MARK: - Private

private extension ViewController {
  
    func setupNavigationController() {
        navigationItem.title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureView() {
        settingsView?.tableView.delegate = self
        settingsView?.tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return model[0].count
        case 1:
            return model[1].count
        case 2:
            return model[2].count
        default:
            return model[0].count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = model[indexPath.section][indexPath.row]
        
        let switchView = UISwitch(frame: CGRect.zero)
        switchView.setOn(false, animated: false)
        switchView.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        switchView.tag = indexPath.row
        
        guard let cell = settingsView?.getCell(for: model, indexPath, with: switchView) as? CustomCell else { return CustomCell() }
        cell.configure(with: item)
        
        return cell
    }
}

// MARK: - TableViewDelegate

extension ViewController {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Нажата ячейка «\(model[indexPath.section][indexPath.row].name)»")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Action

extension ViewController {
    
    @objc
    func switchChanged(__ sender: UISwitch) {
        let indexPathRow = sender.tag
        print("Нажата ячейка «\(model[0][indexPathRow].name)»")
    }
}

