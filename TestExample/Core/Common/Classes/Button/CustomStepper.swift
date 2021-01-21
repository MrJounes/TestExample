//
//  CustomStepper.swift
//  TestExample
//
//  Created by Игорь Дикань on 20.01.2021.
//

import Foundation

class CustomStepper: GMStepper {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setupButton()
    }
    
    func setupButton() {
        minimumValue = 0
        value = 0
        
        cornerRadius = 8
        
        limitHitAnimationColor = R.color.companyUnenableColor()!
        labelSlideLength = 0
        
        buttonsBackgroundColor = R.color.companyColor()!
        
        labelBackgroundColor = R.color.whiteColor()!
        labelTextColor = R.color.blackColor()!
        labelFont = R.font.montserratRegular(size: 14)!
    }
}
