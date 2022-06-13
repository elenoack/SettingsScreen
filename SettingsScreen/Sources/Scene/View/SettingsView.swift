//
//  SettingsView.swift
//  SettingsScreen
//
//  Created by mac on 13.06.22.
//

import UIKit

final class SettingsView: UIView, UITableViewDelegate {
    
    // MARK: - Properties
    
    private var models = [[SettingsContent]]()
    
    // MARK: - Views
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .insetGrouped)
        tableView.backgroundColor = .systemGray6
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
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
        backgroundColor = .white
        setupTableView()
    }
    
    // MARK: - Private
    
    func setupTableView() {
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.reuseID)
        
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
        ])
    }
}

// MARK: - UITableViewDataSource

extension SettingsView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return models[0].count
        case 1:
            return models[1].count
        case 2:
            return models[2].count
        default:
            return models[0].count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.reuseID, for: indexPath) as? CustomCell else { return
            UITableViewCell() }
        
        var configuration = cell.defaultContentConfiguration()
        
        let item = models[indexPath.section][indexPath.row]
        
        cell.customIconView.image = item.symbol
        cell.customImageView.backgroundColor = item.color
        cell.nameLabel.text = item.name
        
        let switchView = UISwitch(frame: CGRect.zero)
        switchView.setOn(false, animated: false)
        switchView.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        switchView.tag = indexPath.row
        
        switch (indexPath as NSIndexPath).section {
            
        case 0:
            switch (indexPath as NSIndexPath).row {
            case 0:
                cell.accessoryView = switchView
                cell.updateСircle.isHidden = true
                cell.secondaryTextLabel.text = nil
            case 1:
                cell.accessoryType = .disclosureIndicator
                cell.accessoryView = nil
                cell.updateСircle.isHidden = true
                cell.secondaryTextLabel.text = "Не подключено"
            case 2:
                cell.accessoryType = .disclosureIndicator
                cell.secondaryTextLabel.text = "Вкл."
                cell.accessoryView = nil
                cell.updateСircle.isHidden = true
            case 3, 4:
                cell.accessoryType = .disclosureIndicator
                cell.accessoryView = nil
                cell.updateСircle.isHidden = true
                cell.secondaryTextLabel.text = nil
            case 5:
                cell.accessoryView = switchView
                cell.updateСircle.isHidden = true
                cell.secondaryTextLabel.text = nil
            default: configuration.image = nil
            }
            
        case 1:
            switch (indexPath as NSIndexPath).row {
            case 0:
                cell.accessoryType = .disclosureIndicator
                cell.accessoryView = nil
                cell.updateСircle.isHidden = false
                cell.secondaryTextLabel.text = nil
                cell.updateСircle.setTitle("\(Int.random(in: 2...8))", for: .normal)
            case 1...:
                cell.accessoryType = .disclosureIndicator
                cell.accessoryView = nil
                cell.updateСircle.isHidden = true
                cell.secondaryTextLabel.text = nil
            default:  configuration.image = nil
            }
            
        case 2:
            switch (indexPath as NSIndexPath).row {
            case 0:
                cell.accessoryType = .disclosureIndicator
                cell.accessoryView = nil
                cell.updateСircle.isHidden = false
                cell.updateСircle.setTitle("1", for: .normal)
                cell.secondaryTextLabel.text = nil
            case 3, 4, 6:
                cell.accessoryType = .disclosureIndicator
                cell.accessoryView = nil
                cell.updateСircle.isHidden = true
                cell.secondaryTextLabel.text = nil
            case 1, 2, 5, 7, 8, 10, 11:
                cell.accessoryType = .disclosureIndicator
                cell.accessoryView = nil
                cell.updateСircle.isHidden = true
                cell.secondaryTextLabel.text = nil
            case 9:
                cell.accessoryType = .disclosureIndicator
                cell.customImageView.layer.borderWidth = 0.1
                cell.customImageView.layer.borderColor = UIColor.black.cgColor
                cell.accessoryView = nil
                cell.secondaryTextLabel.text = nil
                cell.updateСircle.isHidden = true
            default:  configuration.image = nil
            }
            
        default: break
        }
        
        cell.contentConfiguration = configuration
        return cell
    }
}

    //MARK: - TableViewDelegate

    extension SettingsView {
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("Нажата ячейка «\(models[indexPath.section][indexPath.row].name)»")
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    // MARK: - Action

    extension SettingsView {
        
        @objc
        func switchChanged(__ sender: UISwitch ) {
            let indexPathRow = sender.tag
            print("Нажата ячейка «\(models[0][indexPathRow].name)»")
        }
    }
