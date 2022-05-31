//
//  ViewController.swift
//  SettingsScreen
//
//  Created by mac on 30.05.22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    // MARK: - Constants
    
    enum SymbolSetting {
        static let airplaneMode = UIImage(systemName: "airplane.circle.fill")?
            .withTintColor(.orange, renderingMode: .alwaysOriginal)
        static let wiFi = UIImage(systemName: "wifi.circle.fill")?
            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
        static let bluetooth = UIImage(named: "bluetooth")
        static let mobileCommunication = UIImage(systemName: "antenna.radiowaves.left.and.right.circle.fill")?
            .withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
        static let modem = UIImage(systemName: "personalhotspot.circle.fill")?
            .withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
        static let vpn = UIImage(named: "vpn")
        
        static let notifications = UIImage(systemName: "bell.circle.fill")?
            .withTintColor(.red, renderingMode: .alwaysOriginal)
        static let sounds = UIImage(systemName: "speaker.wave.2.circle.fill")?
            .withTintColor(.systemPink, renderingMode: .alwaysOriginal)
        static let sleepTime = UIImage(systemName: "moon.circle.fill")?
            .withTintColor(.systemIndigo, renderingMode: .alwaysOriginal)
        static let screenTime = UIImage(systemName: "hourglass.circle.fill")?
            .withTintColor(.systemIndigo, renderingMode: .alwaysOriginal)
        
        static let general = UIImage(systemName: "gear.circle.fill")?
            .withTintColor(.gray, renderingMode: .alwaysOriginal)
        static let control = UIImage(named: "slider")
        static let screen = UIImage(named: "textformat")
        static let home = UIImage(named: "home")
        static let access = UIImage(named: "accessibility")
        static let wallpaper = UIImage(named: "atom")
        static let siri = UIImage(named: "siri")
        static let faceID = UIImage(systemName: "face.smiling.fill")?
            .withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
        static let sos = UIImage(named: "sos")
        static let contactNotifications = UIImage(systemName: "circle.hexagongrid.circle")?
            .withTintColor(.systemRed, renderingMode: .alwaysOriginal)
        static let battery = UIImage(named: "battery")
        static let privacy = UIImage(systemName: "hand.raised.circle.fill")?
            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
    }
    
    // MARK: - Properties
    
    let arraySettings: [[SettingsContent]] = [
        [SettingsContent(name: "Авиарижим", symbol: SymbolSetting.airplaneMode),
         SettingsContent(name: "Wi-Fi", symbol: SymbolSetting.wiFi),
         SettingsContent(name: "Bluetooth", symbol: SymbolSetting.bluetooth),
         SettingsContent(name: "Сотовая связь", symbol: SymbolSetting.mobileCommunication),
         SettingsContent(name: "Режим модема", symbol: SymbolSetting.modem),
         SettingsContent(name:  "VPN", symbol: SymbolSetting.vpn),],
        
        [SettingsContent(name: "Уведомления", symbol: SymbolSetting.notifications),
         SettingsContent(name: "Звуки, тактильные сигналы", symbol: SymbolSetting.sounds),
         SettingsContent(name: "Не беспокоить", symbol: SymbolSetting.sleepTime),
         SettingsContent(name: "Экранное время", symbol: SymbolSetting.screenTime),],
        
        [SettingsContent(name: "Основные", symbol: SymbolSetting.general),
         SettingsContent(name: "Пункт управления", symbol: SymbolSetting.control),
         SettingsContent(name: "Экран и яркость", symbol: SymbolSetting.screen),
         SettingsContent(name: "Экран «Домой»", symbol: SymbolSetting.home),
         SettingsContent(name: "Универсальный доступ", symbol: SymbolSetting.access),
         SettingsContent(name: "Обои", symbol: SymbolSetting.wallpaper),
         SettingsContent(name: "Siri и Поиск", symbol: SymbolSetting.siri),
         SettingsContent(name: "Face ID и код-пароль", symbol: SymbolSetting.faceID),
         SettingsContent(name: "Экстренный вызов - SOS", symbol: SymbolSetting.sos),
         SettingsContent(name: "Уведосления о контакте", symbol: SymbolSetting.contactNotifications),
         SettingsContent(name: "Аккамулятор", symbol: SymbolSetting.battery),
         SettingsContent(name: "Конфиденциальность", symbol: SymbolSetting.privacy),],
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
        var cell = UITableViewCell(style: .value2, reuseIdentifier: "Cell")
      
        var configuration = cell.defaultContentConfiguration()
        configuration.text = arraySettings[indexPath.section][indexPath.row].name
        configuration.image = arraySettings[indexPath.section][indexPath.row].symbol
        
        let switchView = UISwitch(frame: CGRect.zero)
        switchView.setOn(false, animated: false)
        switchView.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        switchView.tag = indexPath.row
        
              switch (indexPath as NSIndexPath).section {
                  
              case 0:
                  switch (indexPath as NSIndexPath).row {
                  case 0, 5:
                      cell.accessoryView = UISwitch(frame: CGRect.zero)
                      cell.accessoryView = switchView
                  case 1:
                      configuration.secondaryText = "Не подключено"
                      cell.accessoryType = .disclosureIndicator
                  case 2:
                      configuration.secondaryText = "Вкл."
                      cell.accessoryType = .disclosureIndicator
                  case 3, 4:
                      cell.accessoryType = .disclosureIndicator
                  default: configuration.image = nil
                  }
                  
              case 1:
                  switch (indexPath as NSIndexPath).row {
                  case 0:
                      cell = CustomCell(style: .default, reuseIdentifier: CustomCell.reuseID)
                      cell.accessoryType = .disclosureIndicator
                  case 1...:
                      cell.accessoryType = .disclosureIndicator
                  default:  configuration.image = nil
                  }
                  
              case 2:
                  switch (indexPath as NSIndexPath).row {
                  case 0:
                      cell = CustomCell(style: .default, reuseIdentifier: CustomCell.reuseID)
                      cell.accessoryType = .disclosureIndicator
                  case 1...:
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
        print("Нажата ячейка \(arraySettings[indexPath.section][indexPath.row].name)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Action

extension ViewController {
    
    @objc
    func switchChanged(__ sender: UISwitch ) {
        let indexPathRow = sender.tag
        print("Нажата ячейка \(arraySettings[0][indexPathRow].name)")
    }
}

