//
//  QuantityStepperView.swift
//  TestExample
//
//  Created by Игорь Дикань on 19.01.2021.
//

import UIKit

protocol QuantityStepperViewDelegate: class {
    func plus(with count: Int)
    func minus(with count: Int)
}
class QuantityStepperView: UIView {

    // MARK: - IBOutlets
    @IBOutlet weak var plusButton: StepperButton!
    @IBOutlet weak var minusButton: StepperButton!
    @IBOutlet weak var countLabel: TextRegularLabel!
    
    // MARK: - External vars
    weak var delegate: QuantityStepperViewDelegate?
    
    // MARK: - Internal vars
    private let test = "test"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    @IBAction func plusButtonClicked(_ sender: StepperButton) {
        guard let count = countLabel.text, var countInt = Int(count) else {
            return
        }
        countInt += 1
        countLabel.text = String(countInt)
        delegate?.plus(with: countInt)
    }
    
    @IBAction func minusButtonClicked(_ sender: StepperButton) {
        guard let count = countLabel.text, var countInt = Int(count) else {
            return
        }
        countInt -= 1
        if countInt == 0 {
            countLabel.text = String(countInt + 1)
        } else {
            countLabel.text = String(countInt)
        }
        delegate?.minus(with: countInt)
    }
}

// MARK: - Private methods
private extension QuantityStepperView {
    
    func setupView() {
        countLabel.text = "1"
        backgroundColor = .clear
    }
}
