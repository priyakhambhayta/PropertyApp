//
//  PropertyListViewController.swift
//  PropertyApp
//
//  Created by Priya Gajjar on 12/05/21.
//

import UIKit
import AppstoreTransition
import NotificationBannerSwift

class PropertyListViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var cvPropertyList: UICollectionView!
    
    private var transition: CardTransition?
    private var propertyModel: PropertyListViewModel!

    //MARK: - Life cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.setupView()
    }
    
    //MARK: - Custom Methods
    
    func setupView() {
        
        self.title = PROPERTY_LIST_TITLE
        self.cvPropertyList.dataSource = self
        self.cvPropertyList.delegate = self
        self.propertyModel = PropertyListViewModel()
        self.propertyModel.isError.bind { [weak self] isError in
            
            if isError == true {
                DispatchQueue.main.async {
                    
                    self?.showErrorBanner(title: self?.propertyModel.strErrorMessage ?? "", subTitle: self?.propertyModel.strErrorSubMessage ?? "")
                }
            }else {
                
                self?.callViewModelForUIUpdate()
            }
        }
    }
    
    func callViewModelForUIUpdate() {
        
        self.propertyModel.bindPropertyListViewModelToController = {
            
            DispatchQueue.main.async {
                
                self.activityIndicator.stopAnimating()
                self.cvPropertyList.reloadData()
            }
        }
    }
    
    private func showTransition(indexPath: IndexPath, bottomDismiss: Bool = false) {

        let storyboard = UIStoryboard(name: MAIN_STORYBOARD, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: PROPERTY_DETAIL_SCREEN) as! PropertyDetailViewController
        viewController.propertyModel = PropertyCollectionCellViewModel(propertyInfo: self.propertyModel.arrPropertyData[indexPath.item])
        let cell = cvPropertyList.cellForItem(at: indexPath) as! CardCollectionViewCell
        cell.settings.isEnabledBottomClose = bottomDismiss
        cell.settings.blurColor = .white
        transition = CardTransition(cell: cell, settings: cell.settings)
        viewController.settings = cell.settings
        viewController.transitioningDelegate = transition
        viewController.modalPresentationStyle = .custom
        presentExpansion(viewController, cell: cell, animated: true)
    }
}

extension PropertyListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.showTransition(indexPath: indexPath)
    }
}

extension PropertyListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if propertyModel != nil && propertyModel.arrPropertyData != nil {
            
            return propertyModel.arrPropertyData.count
            
        }else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PROPERTY_LIST_CELL_ID, for: indexPath) as! PropertyCollectionCell
        
        let propertyInfo = propertyModel.arrPropertyData[indexPath.row]
        let viewModel = PropertyCollectionCellViewModel(propertyInfo: propertyInfo)
        cell.setupData(viewModel: viewModel)
        cell.delegate = self
        
        return cell
    }
}

extension PropertyListViewController: UICollectionViewDelegateFlowLayout {
    
    //MARK: - UICollectionViewDelegateFlowLayout Method
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return self.calculateCellSize()
    }
    
    public override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
        if cvPropertyList != nil, let layout = cvPropertyList.collectionViewLayout as? UICollectionViewFlowLayout {
            
            layout.itemSize = self.calculateCellSize()
            layout.invalidateLayout()
        }
    }
    
    //MARK: - Custom Method
    
    func calculateCellSize() -> CGSize {
        
        let width = self.view.safeAreaLayoutGuide.layoutFrame.width
        let deviceWidth = self.view.safeAreaLayoutGuide.layoutFrame.width
        let imageHeight = deviceWidth * 2/3
        let cellHeight = imageHeight + 144 //8+33.5+8+31.5+8+40+8+7
        return CGSize(width: width, height: cellHeight)
    }
}

extension PropertyListViewController: PropertyCollectionCellDelegate {
    
    func imageTapped(atCell: PropertyCollectionCell) {
        
        let indexPath = self.cvPropertyList.indexPath(for: atCell)
        collectionView(self.cvPropertyList, didSelectItemAt: indexPath!)
    }
}

extension PropertyListViewController: CardsViewController {
    
}
