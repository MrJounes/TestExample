//
//  TitleBoldLabel.swift
//  TestExample
//
//  Created by Игорь Дикань on 19.01.2021.
//

import UIKit

class TitleBoldLabel: UILabel {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setupLabel()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setupLabel() {
        font = R.font.montserratBold(size: 18)
        textColor = R.color.blackColor()
    }

}
