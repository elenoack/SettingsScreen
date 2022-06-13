//
//  ViewController.swift
//  SettingsScreen
//
//  Created by mac on 30.05.22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    // MARK: - Constants
    
    public var modelData = 
   
//    enum SymbolSetting {
//
//        static let airplaneMode = UIImage(systemName: "airplane")?
//            .withTintColor(.white, renderingMode: .alwaysOriginal)
//        static let wiFi = UIImage(systemName: "wifi")?
//            .withTintColor(.white, renderingMode: .alwaysOriginal)
//        static let bluetooth = UIImage(named: "bluetooth")
//        static let mobileCommunication = UIImage(systemName: "antenna.radiowaves.left.and.right")?
//            .withTintColor(.white, renderingMode: .alwaysOriginal)
//        static let modem = UIImage(systemName: "personalhotspot")?
//            .withTintColor(.white, renderingMode: .alwaysOriginal)
//        static let vpn = UIImage(named: "vpn")
//
//        static let notifications = UIImage(systemName: "app.badge", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))?
//            .withTintColor(.white, renderingMode: .alwaysOriginal)
//        static let sounds = UIImage(systemName: "speaker.wave.3.fill")?
//            .withTintColor(.white, renderingMode: .alwaysOriginal)
//        static let sleepTime = UIImage(systemName: "moon.fill")?
//            .withTintColor(.white, renderingMode: .alwaysOriginal)
//        static let screenTime = UIImage(systemName: "hourglass", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))?
//            .withTintColor(.white, renderingMode: .alwaysOriginal)
//
//        static let general = UIImage(systemName: "gear", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24))?
//            .withTintColor(.white, renderingMode: .alwaysOriginal)
//        static let control = UIImage(systemName: "slider.horizontal.3")?
//            .withTintColor(.white, renderingMode: .alwaysOriginal)
//        static let screen = UIImage(systemName: "textformat.size", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))?
//           .withTintColor(.white, renderingMode: .alwaysOriginal)
//        static let home = UIImage(named: "home")
//        static let access = UIImage(named: "accessibility")
//        static let wallpaper = UIImage(systemName: "atom")?
//              .withTintColor(.white, renderingMode: .alwaysOriginal)
//        static let siri = UIImage(named: "siri")
//        static let faceID = UIImage(systemName: "faceid", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24))?
//            .withTintColor(.white, renderingMode: .alwaysOriginal)
//        static let sos = UIImage(named: "sos")
//        static let contactNotifications = UIImage(systemName: "circle.hexagonpath.fill")?
//            .withTintColor(.systemRed, renderingMode: .alwaysOriginal)
//        static let battery = UIImage(systemName: "battery.100", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18))?
//            .withTintColor(.white, renderingMode: .alwaysOriginal)
//        static let privacy = UIImage(systemName: "hand.raised.fill")?
//            .withTintColor(.white, renderingMode: .alwaysOriginal)
//    }
    
//    // MARK: - Properties
//    
//    private lazy var tableView: UITableView = {
//        let tableView = UITableView.init(frame: CGRect.zero, style: .insetGrouped)
//        tableView.backgroundColor = .systemGray6
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.delegate = self
//        tableView.dataSource = self
//        return tableView
//    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
    }
}

// MARK: - Private

private extension ViewController {
    
    func setupView() {
        navigationItem.title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupTableView() {
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.reuseID)
      
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arraySettings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return arraySettings[0].count
        case 1:
            return arraySettings[1].count
        case 2:
            return arraySettings[2].count
        default:
            return arraySettings[0].count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.reuseID, for: indexPath) as? CustomCell else { return
            UITableViewCell() }
        
        var configuration = cell.defaultContentConfiguration()
        
        let item = arraySettings[indexPath.section][indexPath.row]
       
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

extension ViewController {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Нажата ячейка «\(arraySettings[indexPath.section][indexPath.row].name)»")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Action

extension ViewController {
    
    @objc
    func switchChanged(__ sender: UISwitch ) {
        let indexPathRow = sender.tag
        print("Нажата ячейка «\(arraySettings[0][indexPathRow].name)»")
    }
}

