//
//  ProductCell.swift
//  TestExample
//
//  Created by Игорь Дикань on 19.01.2021.
//

import UIKit

class ProductCell: UITableViewCell {

    static let nibName = "ProductCell"
    static let reuseId = nibName
    
    lazy var quantityStepper: QuantityStepperView = {
        let stepper = QuantityStepperView.fromNib()
        stepper.delegate = self
        return stepper
    }()
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: TitleBoldLabel!
    @IBOutlet weak var descriptionLabel: TextGrayRegularLabel!
    @IBOutlet weak var priceLabel: TextBoldLabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var sizeControl: UISegmentedControl!
    @IBOutlet weak var addButton: AddButton!
    
    var title: String? {
        didSet {
            titleLabel.text = title
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
    }
    
    // MARK: - Internal vars
    private var sizePrice: [CatalogViewModel.SizePrice]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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
    
    // MARK: - IBActions
    @IBAction func sizeControlSwitched(_ sender: UISegmentedControl) {
        if sizeControl.selectedSegmentIndex == 0 {
            guard let price = sizePrice?.first?.price else {
                return
            }
            priceLabel.text = price
        }
        if sizeControl.selectedSegmentIndex == 1 {
            guard let price = sizePrice?.last?.price else {
                return
            }
            priceLabel.text = price
        }
    }
    
    @IBAction func addButtonClicked(_ sender: AddButton) {
        quantityStepper.isHidden = false
    }
    
}

// MARK: - Stepper Delegate
extension ProductCell: QuantityStepperViewDelegate {
    
    func plus(with count: Int) {
        
    }
    
    func minus(with count: Int) {
        if count < 1 {
            quantityStepper.isHidden = true
        }
    }
}

// MARK: - Public methods
extension ProductCell {
    
    func setupCell(with data: CatalogViewModel.ProductModel) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        priceLabel.text = data.price
        //quantityStepper.isHidden = true
        if data.sizePrice != nil {
            sizeControl.isHidden = false
            self.sizePrice = data.sizePrice
            let sizeFirst = sizePrice?.first?.size
            let sizeLast = sizePrice?.last?.size
            sizeControl.setTitle(sizeFirst, forSegmentAt: 0)
            sizeControl.setTitle(sizeLast, forSegmentAt: 1)
        } else {
            sizeControl.isHidden = true
        }
    }
}

// MARK: - Private methods
private extension ProductCell {
    
    func setupUI() {
        quantityStepper.isHidden = true
        setupSubView()
    }
    
    func setupSubView() {
        addSubView(quantityStepper)
        addConstraints()
    }
    
    func addConstraints() {
        quantityStepper.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        quantityStepper.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
    }
}
