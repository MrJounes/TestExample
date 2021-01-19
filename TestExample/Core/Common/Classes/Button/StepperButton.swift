//
//  StepperButton.swift
//  TestExample
//
//  Created by Игорь Дикань on 19.01.2021.
//

import UIKit

class StepperButton: UIButton {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setupButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setupButton() {
        layer.cornerRadius = 8
        imageView?.tintColor = R.color.whiteColor()
        backgroundColor = R.color.companyColor()
    }
}
