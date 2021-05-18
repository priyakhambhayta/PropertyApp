//
//  PropertyCollectionCellViewModel.swift
//  PropertyApp
//
//  Created by Priya Gajjar on 17/05/21.
//

import Foundation
import ImageSlideshow

public class PropertyCollectionCellViewModel {
    
    let txtId:String
    let imgProperty: [SDWebImageSource]
    let txtTitle: String
    let txtAddress: String
    let txtRooms: String
    let txtBathrooms: String
    let txtCarSpace: String
    let urlAgent:URL
    let txtAgentName:String
    
    init(propertyInfo:PropertyList) {
        
        self.txtId = propertyInfo.id ?? ""
        let arrImages:[SDWebImageSource] = propertyInfo.property_images!.compactMap{value in
            
            let placeHolderUrl = Bundle.main.url(forResource: "imgNotAvailable", withExtension: ".png")?.absoluteString
            let url = SDWebImageSource(urlString: (value.attachment?.medium?.url ?? placeHolderUrl)!,placeholder: #imageLiteral(resourceName: "ImgNotAvailable"))
            return url
        }
        self.imgProperty = arrImages
        self.txtTitle = (propertyInfo.property_type ?? "").capitalized
        self.txtAddress = propertyInfo.location?.address ?? ""
        self.txtRooms = "\(String(describing: propertyInfo.bedrooms!))"
        self.txtBathrooms = "\(String(describing: propertyInfo.bathrooms!))"
        self.txtCarSpace = "\(String(describing: propertyInfo.carspaces!))"
        let agentImageUrl = URL(string: (propertyInfo.agent?.avatar?.small?.url)!)
        self.urlAgent = agentImageUrl!
        self.txtAgentName = propertyInfo.agent?.first_name ?? "" + " " + (propertyInfo.agent?.last_name)! 
    }
}
