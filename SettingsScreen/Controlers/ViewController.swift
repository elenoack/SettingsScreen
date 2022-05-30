//
//  ViewController.swift
//  SettingsScreen
//
//  Created by mac on 30.05.22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController, UITableViewDelegate {
    // MARK: - Properties
    
    let settingsContent = [
        ["Авиарижим",
        "Wi-Fi",
        "Bluetooth",
        "Сотовая связь",
        "Режим модема",
        "VPN"],
        
        ["Уведомления",
        "Звуки, тактильные сигналы",
        "Не беспокоить",
        "Экранное время"],
        
        ["Основные",
        "Пункт управления",
        "Экран и яркость",
        "Экран «Домой»",
        "Универсальный доступ",
        "Обои"],
    ]

    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .insetGrouped)
        tableView.backgroundColor = .systemGray6
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
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
        tableView.register(UITableViewCell.self,
                                  forCellReuseIdentifier: "Cell")
        
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
        return settingsContent.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
                case 0:
                    return settingsContent[0].count
                case 1:
                    return settingsContent[1].count
                case 2:
                    return settingsContent[2].count
                default:
                    return settingsContent[0].count
                }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value2, reuseIdentifier: "Cell")
        var configuration = cell.defaultContentConfiguration()
    
        configuration.text = settingsContent[indexPath.section][indexPath.row]
       
            
        let switchView = UISwitch(frame: CGRect.zero)
        switchView.setOn(false, animated: false)
        switchView.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        switchView.tag = indexPath.row
        
              switch (indexPath as NSIndexPath).section {
                  
              case 0:
                  switch (indexPath as NSIndexPath).row {
                  case 0:
                      configuration.image = UIImage(systemName: "airplane.circle.fill")?
                          .withTintColor(.orange, renderingMode: .alwaysOriginal)
                      cell.accessoryView = switchView
                  case 1:
                    
                      configuration.image = UIImage(systemName: "wifi.circle.fill")?
                          .withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
                      configuration.secondaryText = "Не подключено"
                      cell.accessoryType = .disclosureIndicator
                  case 2:
                      configuration.image = UIImage(named: "bluetooth")
                      configuration.secondaryText = "Вкл."
                      cell.accessoryType = .disclosureIndicator
                  case 3:
                      configuration.image = UIImage(systemName: "antenna.radiowaves.left.and.right.circle.fill")?
                          .withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
                      cell.accessoryType = .disclosureIndicator
                  case 4:
                      configuration.image = UIImage(systemName: "personalhotspot.circle.fill")?
                          .withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
                      cell.accessoryType = .disclosureIndicator
                  case 5:
                      configuration.image = UIImage(named: "vpn")
                      cell.accessoryType = .disclosureIndicator
                      cell.accessoryView = UISwitch(frame: CGRect.zero)
                      cell.accessoryView = switchView
                  default: configuration.image = nil
                  }
                  
              case 1:
                  switch (indexPath as NSIndexPath).row {
                  case 0:
                      configuration.image = UIImage(systemName: "bell.circle.fill")?
                          .withTintColor(.red, renderingMode: .alwaysOriginal)
                      cell.accessoryType = .disclosureIndicator
                  case 1:
                      configuration.image = UIImage(systemName: "speaker.wave.2.circle.fill")?
                          .withTintColor(.systemPink, renderingMode: .alwaysOriginal)
                      cell.accessoryType = .disclosureIndicator
                  case 2:
                      configuration.image = UIImage(systemName: "moon.circle.fill")?
                          .withTintColor(.systemIndigo, renderingMode: .alwaysOriginal)
                      cell.accessoryType = .disclosureIndicator
                  case 3:
                      configuration.image = UIImage(systemName: "hourglass.circle.fill")?
                          .withTintColor(.systemIndigo, renderingMode: .alwaysOriginal)
                      cell.accessoryType = .disclosureIndicator
                  default:  configuration.image = nil
                  }
                  
              case 2:
                  switch (indexPath as NSIndexPath).row {
                  case 0:
                      configuration.image = UIImage(systemName: "gear.circle.fill")?
                          .withTintColor(.gray, renderingMode: .alwaysOriginal)
                      configuration.secondaryText = "gear.circle.fill"
                      cell.accessoryType = .disclosureIndicator
                  case 1:
                      configuration.image = UIImage(systemName: "slider.horizontal.3")?
                          .withTintColor(.gray, renderingMode: .alwaysOriginal)
                      cell.accessoryType = .disclosureIndicator
                  case 2:
                      configuration.image = UIImage(systemName: "textformat")?
                          .withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
                      cell.accessoryType = .disclosureIndicator
                  case 3:
                      configuration.image = UIImage(named: "home")
                      cell.accessoryType = .disclosureIndicator
                  case 4:
                      configuration.image = UIImage(named: "accessibility")
                      cell.accessoryType = .disclosureIndicator
                  case 5:
                      configuration.image = UIImage(named: "atom")
                      cell.accessoryType = .disclosureIndicator
                  default:  configuration.image = nil
                  }
                  
      default: break
              }
        cell.contentConfiguration = configuration
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Нажата ячейка \(settingsContent[indexPath.section][indexPath.row])")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Action

extension ViewController {
    
    @objc
    func switchChanged(__ sender: UISwitch ) {
        let indexPathRow = sender.tag
        print("Нажата ячейка \(settingsContent[0][indexPathRow])")
    }
}

