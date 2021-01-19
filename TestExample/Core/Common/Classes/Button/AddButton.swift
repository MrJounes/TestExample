//
//  AddButton.swift
//  TestExample
//
//  Created by Игорь Дикань on 19.01.2021.
//

import UIKit

class AddButton: UIButton {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setupButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setupButton() {
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 1, green: 0.4196078431, blue: 0.1058823529, alpha: 1)
        layer.cornerRadius = 8
        imageView?.tintColor = #colorLiteral(red: 1, green: 0.4196078431, blue: 0.1058823529, alpha: 1)
        backgroundColor = .white
    }
}
