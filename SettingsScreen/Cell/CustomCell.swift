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
        static let textIndent: CGFloat = 64
        static let textRightIndenText: CGFloat = 38
        static let secondaryTextIndent: CGFloat = 40
        static let iconSize: CGFloat = 30
        static let iconIndent: CGFloat = 17
        static let circleIndent: CGFloat = 42
        static let circleSize: CGFloat = 24
        static let iconAssetWidht: CGFloat = 28
    }

    // MARK: - Properties
    
    public static let reuseID = "CustomCell"
  
    lazy var customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = Static.iconSize / 4
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var customIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var updateСircle: UIButton = {
        let сircle = UIButton()
        сircle.layer.masksToBounds = true
        сircle.layer.cornerRadius = Static.circleSize / 2
        сircle.setTitleColor(.white, for: .normal)
        сircle.backgroundColor = .systemRed
        сircle.isHidden = true
        return сircle
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var  secondaryTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
 
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
  
        addSubviewsForAutoLayout([
            customImageView,
            updateСircle,
            nameLabel,
            secondaryTextLabel,
            customIconView,
        ])
        
        NSLayoutConstraint.activate([
        customImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        customImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Static.iconIndent),
        customImageView.heightAnchor.constraint(equalToConstant: Static.iconSize),
        customImageView.widthAnchor.constraint(equalToConstant: Static.iconSize),
    
        updateСircle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        updateСircle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Static.circleIndent),
        updateСircle.heightAnchor.constraint(equalToConstant: Static.circleSize),
        updateСircle.widthAnchor.constraint(equalToConstant: Static.circleSize),
   
        nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Static.textIndent),
        nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Static.textRightIndenText),
     
        secondaryTextLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        secondaryTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Static.secondaryTextIndent),
        
        customIconView.centerYAnchor.constraint(equalTo: customImageView.centerYAnchor),
        customIconView.centerXAnchor.constraint(equalTo: customImageView.centerXAnchor),
        customIconView.widthAnchor.constraint(equalToConstant: Static.iconAssetWidht),
        ])
    }
         
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



    

    

