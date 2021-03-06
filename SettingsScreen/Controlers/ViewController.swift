//
//  ViewController.swift
//  SettingsScreen
//
//  Created by mac on 30.05.22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    // MARK: - Constants
    
     private let fixedSizeTable: CGFloat = 46
   
    enum SymbolSetting {
        
        static let airplaneMode = UIImage(systemName: "airplane")?
            .withTintColor(.white, renderingMode: .alwaysOriginal)
        static let wiFi = UIImage(systemName: "wifi")?
            .withTintColor(.white, renderingMode: .alwaysOriginal)
        static let bluetooth = UIImage(named: "bluetooth")
        static let mobileCommunication = UIImage(systemName: "antenna.radiowaves.left.and.right")?
            .withTintColor(.white, renderingMode: .alwaysOriginal)
        static let modem = UIImage(systemName: "personalhotspot")?
            .withTintColor(.white, renderingMode: .alwaysOriginal)
        static let vpn = UIImage(named: "vpn")
        
        static let notifications = UIImage(systemName: "app.badge", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))?
            .withTintColor(.white, renderingMode: .alwaysOriginal)
        static let sounds = UIImage(systemName: "speaker.wave.3.fill")?
            .withTintColor(.white, renderingMode: .alwaysOriginal)
        static let sleepTime = UIImage(systemName: "moon.fill")?
            .withTintColor(.white, renderingMode: .alwaysOriginal)
        static let screenTime = UIImage(systemName: "hourglass", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))?
            .withTintColor(.white, renderingMode: .alwaysOriginal)
        
        static let general = UIImage(systemName: "gear", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24))?
            .withTintColor(.white, renderingMode: .alwaysOriginal)
        static let control = UIImage(systemName: "slider.horizontal.3")?
            .withTintColor(.white, renderingMode: .alwaysOriginal)
        static let screen = UIImage(systemName: "textformat.size", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))?
           .withTintColor(.white, renderingMode: .alwaysOriginal)
        static let home = UIImage(named: "home")
        static let access = UIImage(named: "accessibility")
        static let wallpaper = UIImage(systemName: "atom")?
              .withTintColor(.white, renderingMode: .alwaysOriginal)
        static let siri = UIImage(named: "siri")
        static let faceID = UIImage(systemName: "faceid", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24))?
            .withTintColor(.white, renderingMode: .alwaysOriginal)
        static let sos = UIImage(named: "sos")
        static let contactNotifications = UIImage(systemName: "circle.hexagonpath.fill")?
            .withTintColor(.systemRed, renderingMode: .alwaysOriginal)
        static let battery = UIImage(systemName: "battery.100", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18))?
            .withTintColor(.white, renderingMode: .alwaysOriginal)
        static let privacy = UIImage(systemName: "hand.raised.fill")?
            .withTintColor(.white, renderingMode: .alwaysOriginal)
    }
    
    // MARK: - Properties
    
    let arraySettings: [[SettingsContent]] = [
        [SettingsContent(name: "??????????????????", symbol: SymbolSetting.airplaneMode, color: .orange),
         SettingsContent(name: "Wi-Fi", symbol: SymbolSetting.wiFi, color: .systemBlue),
         SettingsContent(name: "Bluetooth", symbol: SymbolSetting.bluetooth, color: .systemBlue),
         SettingsContent(name: "?????????????? ??????????", symbol: SymbolSetting.mobileCommunication, color: .systemGreen),
         SettingsContent(name: "?????????? ????????????", symbol: SymbolSetting.modem, color: .systemGreen),
         SettingsContent(name:  "VPN", symbol: SymbolSetting.vpn, color: .systemBlue),],
        
        [SettingsContent(name: "??????????????????????", symbol: SymbolSetting.notifications, color: .systemRed),
         SettingsContent(name: "??????????, ???????????????????? ??????????????", symbol: SymbolSetting.sounds, color: .systemPink),
         SettingsContent(name: "???? ????????????????????", symbol: SymbolSetting.sleepTime, color: .systemIndigo),
         SettingsContent(name: "???????????????? ??????????", symbol: SymbolSetting.screenTime, color: .systemIndigo),],
        
        [SettingsContent(name: "????????????????", symbol: SymbolSetting.general, color: .gray),
         SettingsContent(name: "?????????? ????????????????????", symbol: SymbolSetting.control, color: .gray),
         SettingsContent(name: "?????????? ?? ??????????????", symbol: SymbolSetting.screen, color: .systemBlue),
         SettingsContent(name: "?????????? ??????????????", symbol: SymbolSetting.home, color: .blue),
         SettingsContent(name: "?????????????????????????? ????????????", symbol: SymbolSetting.access, color: .systemBlue),
         SettingsContent(name: "????????", symbol: SymbolSetting.wallpaper, color: .systemTeal),
         SettingsContent(name: "Siri ?? ??????????", symbol: SymbolSetting.siri, color: UIColor(red: 5/255, green: 62/255, blue: 130/255, alpha: 1)),
         SettingsContent(name: "Face ID ?? ??????-????????????", symbol: SymbolSetting.faceID, color: .systemGreen),
         SettingsContent(name: "???????????????????? ?????????? - SOS", symbol: SymbolSetting.sos, color: .red),
         SettingsContent(name: "?????????????????????? ?? ????????????????", symbol: SymbolSetting.contactNotifications, color: .white),
         SettingsContent(name: "??????????????????????", symbol: SymbolSetting.battery, color: .systemGreen),
         SettingsContent(name: "????????????????????????????????????", symbol: SymbolSetting.privacy, color: .systemBlue),],
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
        navigationItem.title = "??????????????????"
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
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.reuseID,
                                for: indexPath) as! CustomCell
        
        var configuration = cell.defaultContentConfiguration()
       
        cell.customIconView.image = arraySettings[indexPath.section][indexPath.row].symbol
        cell.customImageView.backgroundColor = arraySettings[indexPath.section][indexPath.row].color
        cell.nameLabel.text = arraySettings[indexPath.section][indexPath.row].name
        
        let switchView = UISwitch(frame: CGRect.zero)
        switchView.setOn(false, animated: false)
        switchView.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        switchView.tag = indexPath.row
        
        switch (indexPath as NSIndexPath).section {
            
        case 0:
            switch (indexPath as NSIndexPath).row {
            case 0:
                cell.accessoryView = switchView
                cell.update??ircle.isHidden = true
                cell.secondaryTextLabel.text = nil
            case 1:
                cell.accessoryType = .disclosureIndicator
                cell.accessoryView = nil
                cell.update??ircle.isHidden = true
                cell.secondaryTextLabel.text = "???? ????????????????????"
            case 2:
                cell.accessoryType = .disclosureIndicator
                cell.secondaryTextLabel.text = "??????."
                cell.accessoryView = nil
                cell.update??ircle.isHidden = true
            case 3, 4:
                cell.accessoryType = .disclosureIndicator
                cell.accessoryView = nil
                cell.update??ircle.isHidden = true
                cell.secondaryTextLabel.text = nil
            case 5:
                cell.accessoryView = switchView
                cell.update??ircle.isHidden = true
                cell.secondaryTextLabel.text = nil
            default: configuration.image = nil
            }
            
        case 1:
            switch (indexPath as NSIndexPath).row {
            case 0:
                cell.accessoryType = .disclosureIndicator
                cell.accessoryView = nil
                cell.update??ircle.isHidden = false
                cell.secondaryTextLabel.text = nil
                cell.update??ircle.setTitle("\(Int.random(in: 2...8))", for: .normal)
            case 1...:
                cell.accessoryType = .disclosureIndicator
                cell.accessoryView = nil
                cell.update??ircle.isHidden = true
                cell.secondaryTextLabel.text = nil
            default:  configuration.image = nil
            }
            
        case 2:
            switch (indexPath as NSIndexPath).row {
            case 0:
                cell.accessoryType = .disclosureIndicator
                cell.accessoryView = nil
                cell.update??ircle.isHidden = false
                cell.update??ircle.setTitle("1", for: .normal)
                cell.secondaryTextLabel.text = nil
            case 3, 4, 6:
                cell.accessoryType = .disclosureIndicator
                cell.accessoryView = nil
                cell.update??ircle.isHidden = true
                cell.secondaryTextLabel.text = nil
            case 1, 2, 5, 7, 8, 10, 11:
                cell.accessoryType = .disclosureIndicator
                cell.accessoryView = nil
                cell.update??ircle.isHidden = true
                cell.secondaryTextLabel.text = nil
            case 9:
                cell.accessoryType = .disclosureIndicator
                cell.customImageView.layer.borderWidth = 0.1
                cell.customImageView.layer.borderColor = UIColor.black.cgColor
                cell.accessoryView = nil
                cell.secondaryTextLabel.text = nil
                cell.update??ircle.isHidden = true
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return fixedSizeTable
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("???????????? ???????????? ??\(arraySettings[indexPath.section][indexPath.row].name)??")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Action

extension ViewController {
    
    @objc
    func switchChanged(__ sender: UISwitch ) {
        let indexPathRow = sender.tag
        print("???????????? ???????????? ??\(arraySettings[0][indexPathRow].name)??")
    }
}

