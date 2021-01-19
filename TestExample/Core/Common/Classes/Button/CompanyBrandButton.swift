//
//  CompanyBrandButton.swift
//  TestExample
//
//  Created by Игорь Дикань on 19.01.2021.
//

import UIKit

class CompanyBrandButton: UIButton {
    
    let brandButtonColor = R.color.companyColor()
    let brandUnenableButtonColor = R.color.companyUnenableColor()
    let brandButtonFont = R.font.montserratBold(size: 16)
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setupButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setupButton() {
        setTitleColor(.white, for: .normal)
        titleLabel?.font = brandButtonFont
        backgroundColor = brandButtonColor
        
        layer.cornerRadius = 12
        //layer.shadowColor = R.color.companyUnenableColor() as? CGColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
    }
    
    func enable() {
        isEnabled = true
        backgroundColor = brandButtonColor
    }
    
    func unenable() {
        isEnabled = false
        backgroundColor = brandUnenableButtonColor
    }
}
