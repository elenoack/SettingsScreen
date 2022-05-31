//
//  CustomCell.swift
//  SettingsScreen
//
//  Created by mac on 31.05.22.
//

import UIKit

class CustomCell: UITableViewCell {
    // MARK: - Constants
    
    enum Static {
        static let circleSize: CGFloat = 22
        static let circleIndent: CGFloat = 36
    }
    
    // MARK: - Properties
    
    public static let reuseID = "СustomCell"
    
    lazy var updateСircle: UITableViewCell = {
        let updateСircleView = UITableViewCell()
        let size: CGFloat = Static.circleSize
        let width = Static.circleSize
        let сircle = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: size))
        сircle.text = "\(Int.random(in: 1...2))"
        сircle.layer.cornerRadius = size / 2
        сircle.layer.masksToBounds = true
        сircle.textAlignment = .center
        сircle.textColor = .white
        сircle.backgroundColor = .red
        updateСircleView.accessoryView = сircle
        return updateСircleView
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        addSubview(updateСircle)
        updateСircle.translatesAutoresizingMaskIntoConstraints = false
        updateСircle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        updateСircle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Static.circleIndent).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



    

    

