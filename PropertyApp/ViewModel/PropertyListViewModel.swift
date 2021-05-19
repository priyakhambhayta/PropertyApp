//
//  PropertyListViewModel.swift
//  PropertyApp
//
//  Created by Priya Gajjar on 13/05/21.
//

public class PropertyListViewModel {

    var isError = Box(false)
    var strErrorMessage = ""
    var strErrorSubMessage = ""
    private(set) var arrPropertyData: [PropertyList]! {
        
        didSet {
            self.bindPropertyListViewModelToController()
        }
    }
    var bindPropertyListViewModelToController : (() -> ()) = {}
    
    //MARK: - Initializer
    init() {
        
        self.getPropertyList()
    }
    
    //MARK: - API Call Methods
    
    func getPropertyList() {
        
        APIHelper.shared.getPropertyList { (errorStatus, propertyList) in
            
            if errorStatus == nil {
                
                self.arrPropertyData = propertyList?.data
                self.strErrorMessage = ""
                self.strErrorSubMessage = ""
                self.isError.value = false
            }else {
                
                self.isError.value = true
                switch(errorStatus) {
                
                case .noInternet:
                    
                    self.strErrorMessage = MESSAGE_NO_INTERNET
                    self.strErrorSubMessage = MESSAGE_NO_INTERNET_SUBTEXT
                    break
                case .noData:
                    
                    self.strErrorMessage = MESSAGE_DEFAULT_TITLE
                    self.strErrorSubMessage = MESSAGE_CANNOTLOAD_DATA
                default:
                    
                    self.strErrorMessage = MESSAGE_DEFAULT_TITLE
                    self.strErrorSubMessage = MESSAGE_DEFAULT_SUBTITLE
                }
            }
        }
    }
}
