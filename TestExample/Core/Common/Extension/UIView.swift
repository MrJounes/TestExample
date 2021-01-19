//
//  UIView.swift
//  TestExample
//
//  Created by Игорь Дикань on 19.01.2021.
//

import Foundation
import UIKit

extension UIView {
    
    class func fromNib(named: String? = nil) -> Self {
        let name = named ?? "\(Self.self)"
        guard let nib = Bundle.main.loadNibNamed(name, owner: nil, options: nil) else {
            fatalError("missing expected nib named: \(name)")
        }
        guard let view = nib.first as? Self else {
            fatalError("view of type \(Self.self) not found in \(nib)")
        }
        return view
    }
    
    func addSubView(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
    }
}
