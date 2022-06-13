//
//  SettingsView.swift
//  SettingsScreen
//
//  Created by mac on 13.06.22.
//

import UIKit

final class SettingsView: UIView {
    // MARK: - Configuration
    
    func configureView(with models: [[SettingsContent]]) {
        self.models = models
        tableView.reloadData()
    }
    
    // MARK: - Properties
    
    private var models = [[SettingsContent]]()
    
    // MARK: - Views
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.reuseID)
        return tableView
    }()
    
    // MARK: - Initial
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .systemBackground
        setupTableView()
    }
    
    // MARK: - Private
    
    func setupTableView() {
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
        ])
    }
}

