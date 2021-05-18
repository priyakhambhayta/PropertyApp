//
//  Constants.swift
//  PropertyApp
//
//  Created by Priya Gajjar on 12/05/21.
//

import Foundation

enum ErrorStatus: Int {
    
    case noInternet
    case noData
    case invalidUrl
    case invalidResponse
}

let BASE_URL = "https://f213b61d-6411-4018-a178-53863ed9f8ec.mock.pstmn.io/properties"


//MARK: Error Message Constants

let MESSAGE_NO_INTERNET = "Looks like you are offline!"
let MESSAGE_NO_INTERNET_SUBTEXT = "Could not load the latest data"
let MESSAGE_DEFAULT_TITLE = "Something went wrong!"
let MESSAGE_DEFAULT_SUBTITLE = "Please try again later"
let MESSAGE_CANNOTLOAD_DATA = "Could not load the data"

