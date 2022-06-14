//
//  SettingsView.swift
//  SettingsScreen
//
//  Created by mac on 13.06.22.
//

import UIKit

final class SettingsView: UIView {
    // MARK: - Properties
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.reuseID)
        return tableView
    }()
    
    // MARK: - Initialization
    
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
    
    func getCell(for model: [[SettingsContent]],_ indexPath: IndexPath, with switchView: UISwitch) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.reuseID, for: indexPath) as? CustomCell else { return
            CustomCell() }
        
        var configuration = cell.defaultContentConfiguration()
        
        switch indexPath.section {
            
        case 0:
            switch indexPath.row {
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
            switch indexPath.row {
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
            switch indexPath.row {
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


