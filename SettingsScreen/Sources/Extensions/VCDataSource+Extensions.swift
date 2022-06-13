//
//  VCDataSource Extensions.swift
//  SettingsScreen
//
//  Created by mac on 13.06.22.
//

import UIKit

extension ViewController: UITableViewDataSource {
    // MARK: - UITableViewDataSource
    
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.reuseID, for: indexPath) as? CustomCell else { return
            UITableViewCell() }
        
        var configuration = cell.defaultContentConfiguration()
        
        let item = model[indexPath.section][indexPath.row]
        
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

// MARK: - Action

extension ViewController {
    
    @objc
    func switchChanged(__ sender: UISwitch ) {
        let indexPathRow = sender.tag
        print("Нажата ячейка «\(model[0][indexPathRow].name)»")
    }
}

