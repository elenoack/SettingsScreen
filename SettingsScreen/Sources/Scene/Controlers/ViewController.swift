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
    
    public var model: [[SettingsContent]] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = SettingsView()
        model = SettingsContentModel().createModels()
        settingsView?.tableView.delegate = self
        settingsView?.tableView.dataSource = self
        setupView()
        configureView()
    }
}

// MARK: - Private

private extension ViewController {
    
    func setupView() {
        navigationItem.title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureView() {
        model.forEach { [unowned self] model in
            settingsView?.configureView(with: [model])
        }
    }
}

// MARK: - TableViewDelegate

extension ViewController {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Нажата ячейка «\(model[indexPath.section][indexPath.row].name)»")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


