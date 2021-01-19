//
//  CatalogView.swift
//  TestExample
//
//  Created by Игорь Дикань on 19.01.2021.
//

import UIKit

protocol CatalogViewDelegate: class {
    func productDidSelect(_ id: String)
}

class CatalogView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - External vars
    weak var delegate: CatalogViewDelegate?
    var products: [CatalogViewModel.ProductModel] = []
    
    // MARK: - Internal vars
    private let test = "test"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func update() {
        collectionView.reloadData()
        tableView.reloadData()
    }
}

// MARK: - Private methods
private extension CatalogView {
    
    func setupView() {
        setupCollectionView()
        setupTableView()
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: CategoryCell.nibName, bundle: nil), forCellWithReuseIdentifier: CategoryCell.reuseId)
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: ProductCell.nibName, bundle: nil), forCellReuseIdentifier: ProductCell.reuseId)
    }
}

// MARK: - CollectionView Data Source
extension CatalogView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseId, for: indexPath) as? CategoryCell else {
            return UICollectionViewCell()
        }
        cell.titleLabel.text = "Item \(indexPath.item)"
        return cell
    }
}
// MARK: - CollectionView Delegate
extension CatalogView: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

// MARK: - CollectionView Delegate FlowLayout
extension CatalogView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 50)
    }
}

// MARK: - TableView Data Source
extension CatalogView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseId, for: indexPath) as? ProductCell else {
            return UITableViewCell()
        }
        cell.setupCell(with: products[indexPath.row])
        return cell
    }
    
    
}

// MARK: - TableView Delegate
extension CatalogView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 168
//    }
}
