//
//  CardCell.swift
//  TestExample
//
//  Created by Игорь Дикань on 20.01.2021.
//

import UIKit

protocol CardCellDelegate: class {
    func updateTable()
}

class CardCell: UITableViewCell {

    static let nibName = "CardCell"
    static let reuseId = nibName
    
    // MARK: - IBOutlets
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var stepper: GMStepper!
    @IBOutlet weak var titleLabel: TextRegularLabel!
    @IBOutlet weak var priceLabel: TextBoldLabel!
    @IBOutlet weak var sizeLabel: TextGrayRegularLabel!
    
    weak var delegate: CardCellDelegate?
    
    private var productId: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func stepperClicked(_ sender: Any) {
        let value = stepper.value
        guard let key = productId else {
            return
        }
        if value == 0 {
            stepper.isHidden = true
            UserDefaults.standard.removeObject(forKey: key)
            print("Remove: \(value)")
            delegate?.updateTable()
        } else {
            UserDefaults.standard.setValue(value, forKey: key)
            print("Add value: \(value) - key: \(key)")
        }
    }
    
    func setupCell(with data: CardProductModel) {
        productId = data.productId
        titleLabel.text = data.title
        priceLabel.text = data.price
        let value = UserDefaults.standard.integer(forKey: data.productId)
        if value == 0 {
            stepper.isHidden = true
        } else {
            stepper.isHidden = false
            stepper.value = Double(value)
        }
    }
}

// MARK: - Private methods
private extension CardCell {
    
    func setupUI() {
        setupStepper()
    }
    
    func setupStepper() {
        stepper.minimumValue = 0
        stepper.value = 1
        
        stepper.cornerRadius = 8
        
        stepper.limitHitAnimationColor = R.color.companyUnenableColor()!
        stepper.labelSlideLength = 0
        
        stepper.buttonsBackgroundColor = R.color.companyColor()!
        
        stepper.labelBackgroundColor = R.color.whiteColor()!
        stepper.labelTextColor = R.color.blackColor()!
        stepper.labelFont = R.font.montserratRegular(size: 14)!
    }
}

