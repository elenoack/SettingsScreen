//
//  SettingsContentModel.swift
//  SettingsScreen
//
//  Created by mac on 13.06.22.
//

import UIKit

class SettingsContentModel {
    
    func createModels() -> [[SettingsContent]] {
        return [
                [SettingsContent(name: "Авиарежим", symbol: SymbolSetting.airplaneMode, color: .orange),
                 SettingsContent(name: "Wi-Fi", symbol: SymbolSetting.wiFi, color: .systemBlue),
                 SettingsContent(name: "Bluetooth", symbol: SymbolSetting.bluetooth, color: .systemBlue),
                 SettingsContent(name: "Сотовая связь", symbol: SymbolSetting.mobileCommunication, color: .systemGreen),
                 SettingsContent(name: "Режим модема", symbol: SymbolSetting.modem, color: .systemGreen),
                 SettingsContent(name:  "VPN", symbol: SymbolSetting.vpn, color: .systemBlue),],
                
                [SettingsContent(name: "Уведомления", symbol: SymbolSetting.notifications, color: .systemRed),
                 SettingsContent(name: "Звуки, тактильные сигналы", symbol: SymbolSetting.sounds, color: .systemPink),
                 SettingsContent(name: "Не беспокоить", symbol: SymbolSetting.sleepTime, color: .systemIndigo),
                 SettingsContent(name: "Экранное время", symbol: SymbolSetting.screenTime, color: .systemIndigo),],
                
                [SettingsContent(name: "Основные", symbol: SymbolSetting.general, color: .gray),
                 SettingsContent(name: "Пункт управления", symbol: SymbolSetting.control, color: .gray),
                 SettingsContent(name: "Экран и яркость", symbol: SymbolSetting.screen, color: .systemBlue),
                 SettingsContent(name: "Экран «Домой»", symbol: SymbolSetting.home, color: .blue),
                 SettingsContent(name: "Универсальный доступ", symbol: SymbolSetting.access, color: .systemBlue),
                 SettingsContent(name: "Обои", symbol: SymbolSetting.wallpaper, color: .systemTeal),
                 SettingsContent(name: "Siri и Поиск", symbol: SymbolSetting.siri, color: UIColor(red: 5/255, green: 62/255, blue: 130/255, alpha: 1)),
                 SettingsContent(name: "Face ID и код-пароль", symbol: SymbolSetting.faceID, color: .systemGreen),
                 SettingsContent(name: "Экстренный вызов - SOS", symbol: SymbolSetting.sos, color: .red),
                 SettingsContent(name: "Уведомления о контакте", symbol: SymbolSetting.contactNotifications, color: .white),
                 SettingsContent(name: "Аккумулятор", symbol: SymbolSetting.battery, color: .systemGreen),
                 SettingsContent(name: "Конфиденциальность", symbol: SymbolSetting.privacy, color: .systemBlue),],
            ]
    }
}

// MARK: - Constants

extension SettingsContentModel {
    
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
}
