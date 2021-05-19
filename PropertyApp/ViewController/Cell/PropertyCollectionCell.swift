//
//  PropertyCollectionCell.swift
//  PropertyApp
//
//  Created by Priya Gajjar on 17/05/21.
//

import UIKit
import ImageSlideshow
import AppstoreTransition

protocol PropertyCollectionCellDelegate {
    
    func imageTapped(atCell:PropertyCollectionCell)
}

class PropertyCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imgProperty: ImageSlideshow!
    @IBOutlet weak var imgAgent: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var svRooms: UIStackView!
    @IBOutlet weak var svBathrooms: UIStackView!
    @IBOutlet weak var svCarSpace: UIStackView!
    @IBOutlet weak var lblRooms: UILabel!
    @IBOutlet weak var lblBathrooms: UILabel!
    @IBOutlet weak var lblCarSpaces: UILabel!
    @IBOutlet weak var svPropertyDetail: UIStackView!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblAgentName: UILabel!
    var delegate:PropertyCollectionCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func layoutSubviews() {
        
        super.layoutSubviews()
        self.imgAgent.layer.cornerRadius = (self.contentView.frame.size.height * 0.122) / 2
        self.imgAgent.layer.masksToBounds = true
    }
    
    func setupData(viewModel:PropertyCollectionCellViewModel) {
        
        self.imgProperty.setImageInputs(viewModel.imgProperty)
        self.imgAgent.sd_setImage(with: viewModel.urlAgent, placeholderImage: nil)
        self.lblTitle.text = viewModel.txtTitle
        self.lblAddress.text = viewModel.txtAddress
        self.lblRooms.text = viewModel.txtRooms
        self.lblBathrooms.text = viewModel.txtBathrooms
        self.lblCarSpaces.text = viewModel.txtCarSpace
        self.lblAgentName.text = viewModel.txtAgentName
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        self.imgProperty.scrollView.addGestureRecognizer(recognizer)
    }
    
    @objc func imageTapped() {
        
        self.delegate.imageTapped(atCell: self)
    }
}

extension PropertyCollectionCell {
    
    // Make it appears very responsive to touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        animate(isHighlighted: true)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        animate(isHighlighted: false)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        animate(isHighlighted: false)
    }
}

extension PropertyCollectionCell: CardCollectionViewCell {
    
    var cardContentView: UIView {
        get {
            return self.contentView
        }
    }
    
}
