//
//  CustomLabel.swift
//  TestExample
//
//  Created by Игорь Дикань on 19.01.2021.
//

import UIKit

class CustomLabel: UILabel {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setupLabel()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        //setupLabel()
    }
    
    func setupLabel() {
        font = UIFont.boldSystemFont(ofSize: 32)
    }

}
