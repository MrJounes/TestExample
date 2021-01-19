//
//  CategoryCollectionViewCell.swift
//  TestExample
//
//  Created by Игорь Дикань on 19.01.2021.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    static let nibName = "CategoryCell"
    static let reuseId = nibName
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: TextRegularLabel!
    
    var title: String? {
        didSet {
            titleLabel.text = title
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                titleLabel.font = R.font.montserratBold(size: 14)
            } else {
                titleLabel.font = R.font.montserratRegular(size: 14)
            }
        }
    }

}
