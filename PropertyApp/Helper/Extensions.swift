//
//  Extensions.swift
//  PropertyApp
//
//  Created by Priya Gajjar on 18/05/21.
//

import Foundation
import UIKit
import NotificationBannerSwift

extension UIViewController {
    
    func showErrorBanner(title:String, subTitle:String) {
        
        let errorBanner = NotificationBanner(title: title, subtitle: subTitle, leftView: nil, rightView: nil, style: .danger, colors: .none)
        errorBanner.show()
    }
}
