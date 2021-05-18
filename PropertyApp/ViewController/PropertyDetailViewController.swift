//
//  PropertyDetailViewController.swift
//  PropertyApp
//
//  Created by Priya Gajjar on 17/05/21.
//

import UIKit
import AppstoreTransition
import ImageSlideshow

class PropertyDetailViewController: UIViewController {

    @IBOutlet weak var contentScrollView: UIScrollView!
    @IBOutlet weak var imgProperty: ImageSlideshow!
    @IBOutlet weak var lblPropertyId: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var btnBack: UIButton!
    
    var propertyModel: PropertyCollectionCellViewModel!
    var dismissAnimationFinishedAction: (()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.btnBack.alpha = 0.0
        view.clipsToBounds = true
        contentScrollView.delegate = self
        
        scrollView.contentInsetAdjustmentBehavior = .never
        
        let _ = dismissHandler
        self.setupData()
    }
    @IBAction func btnBackTapped(_ sender: UIButton) {
    }
    
    func setupData() {
        
        self.imgProperty.setImageInputs(self.propertyModel.imgProperty)
        self.lblPropertyId.text = self.propertyModel.txtId
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PropertyDetailViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // prevent bouncing when swiping down to close
        scrollView.bounces = scrollView.contentOffset.y > 100
        
        dismissHandler.scrollViewDidScroll(scrollView)
    }
    
}

extension PropertyDetailViewController: CardDetailViewController {
    
    var scrollView: UIScrollView {
        return contentScrollView
    }
    
    
    var cardContentView: UIView {
        return viewContainer
    }
    
    func didFinishPresentAnimationProgress() {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.btnBack.alpha = 1.0
        })
        
    }
    
    func didBeginDismissAnimation()  {
        UIView.animate(withDuration: 0.3, animations: {
                        self.btnBack.alpha = 0.0
        })
    }
}
