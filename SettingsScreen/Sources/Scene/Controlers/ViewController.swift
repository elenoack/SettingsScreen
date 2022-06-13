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

    public var model: SettingsContentModel?
   
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = SettingsView()
        model = SettingsContentModel()
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
        guard let models = model?.createModels() else { return }
        models.forEach { [unowned self] model in
            settingsView?.configureView(with: models)
        }
    }
}

