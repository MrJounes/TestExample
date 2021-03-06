//
//  ProdutBottomSheetViewController.swift
//  TestExample
//
//  Created by Игорь Дикань on 20.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import PanModal

protocol ProdutBottomSheetDisplayLogic: class {
    func displayProduct(with data: CatalogViewModel.ProductModel)
}

final class ProdutBottomSheetViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: TitleBoldLabel!
    @IBOutlet weak var weightLabel: TextGrayRegularLabel!
    @IBOutlet weak var descriptionLabel: TextRegularLabel!
    @IBOutlet weak var stepper: GMStepper!
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var sizeControl: UISegmentedControl!
    
    // MARK: - External vars
    var interactor: ProdutBottomSheetBusinessLogic?
    var router: (NSObjectProtocol & ProdutBottomSheetRoutingLogic & ProdutBottomSheetDataPassing)?
    
    // MARK: - Internal vars
    var data: CatalogViewModel.ProductModel?
    var sizePrice: [CatalogViewModel.SizePrice]?
    var productId: String?

    // MARK: - Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        ProdutBottomSheetConfigurator.shared.configure(self)
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        ProdutBottomSheetConfigurator.shared.configure(self)
    }
  
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - IBActions
    @IBAction func sizeControlSwitched(_ sender: UISegmentedControl) {
        if sizeControl.selectedSegmentIndex == 0 {
            priceLabel.text = sizePrice?.first?.price
        }
        if sizeControl.selectedSegmentIndex == 1 {
            priceLabel.text = sizePrice?.last?.price
        }
    }
    
    @IBAction func applyButtonClicked(_ sender: UIButton) {
        if stepper.value == 1 {
            guard let key = productId else {
                return
            }
            let value = stepper.value
            UserDefaults.standard.setValue(value, forKey: key)
            print("Add value: \(value) - key: \(key)")
        }
        router?.routeToBack()
    }
    
    @IBAction func stepperClecked(_ sender: GMStepper) {
        guard let key = productId else {
            return
        }
        if stepper.value == 0 {
            applyButton.setTitle("Удалить", for: .normal)
            priceLabel.isHidden = true
            UserDefaults.standard.removeObject(forKey: key)
        } else if stepper.value != 1 {
            applyButton.setTitle("Добавить", for: .normal)
            priceLabel.isHidden = false
            let value = stepper.value
            UserDefaults.standard.setValue(value, forKey: key)
            print("Add value: \(value) - key: \(key)")
        }
    }
}

// MARK: - Display logic
extension ProdutBottomSheetViewController: ProdutBottomSheetDisplayLogic {
    
    func displayProduct(with data: CatalogViewModel.ProductModel) {
        self.data = data
        productId = data.productId
        titleLabel.text = data.title
        weightLabel.text = data.weight
        descriptionLabel.text = data.description
        priceLabel.text = data.price
        applyButton.setTitle("Добавить", for: .normal)
        
        if data.sizePrice != nil {
            self.sizePrice = data.sizePrice
            sizeControl.isHidden = false
            let sizeFirst = data.sizePrice?.first?.size
            let sizeLast = data.sizePrice?.last?.size
            sizeControl.setTitle(sizeFirst, forSegmentAt: 0)
            sizeControl.setTitle(sizeLast, forSegmentAt: 1)
        } else {
            sizeControl.isHidden = true
        }
        
        let key = data.productId
        let value = UserDefaults.standard.integer(forKey: key)
        if value == 0 {
            stepper.value = 1
        } else {
            stepper.value = Double(value)
        }
    }
}

// MARK: - PanModal Presentable
extension ProdutBottomSheetViewController: PanModalPresentable {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    var panScrollable: UIScrollView? {
        return nil
    }

    var longFormHeight: PanModalHeight {
        return .intrinsicHeight
    }

    var anchorModalToLongForm: Bool {
        return false
    }
}

// MARK: - Private methods
private extension ProdutBottomSheetViewController {
    
    func setupView() {
        interactor?.fetchProduct()
    }
}
