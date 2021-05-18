//
//  APIHelper.swift
//  PropertyApp
//
//  Created by Priya Gajjar on 12/05/21.
//

import Foundation

class APIHelper: NSObject {
    
    public class var shared: APIHelper {
        struct Singleton {
            static let instance = APIHelper()
        }
        return Singleton.instance
    }
    
    func getPropertyList(completion: @escaping (ErrorStatus?, PropertyListResponse?) -> Void) {
        
        let endPoint = BASE_URL
        
        guard let url = URL(string:endPoint ) else {
            
            return completion(ErrorStatus.invalidUrl,nil)
        }
        print(url)
        
        NetworkReachability.shared.startMonitoring { (isAvailable) in
            
            if isAvailable {
                
                let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    
                    NetworkReachability.shared.stopMonitoring()
                    if let error = error {
                        
                        print(error)
                        return completion(ErrorStatus.invalidResponse,nil)
                    }
                    
                    guard let data = data else {
                        
                        return completion(ErrorStatus.noData,nil)}
                    
                    do {
                        let propertyInfo = try JSONDecoder().decode(PropertyListResponse.self, from: data)
//                        print(propertyInfo)
                        completion(nil,propertyInfo)
                        
                    } catch let error {
                        //FIXME: handle errors
                        print("Error occured while parsing JSON",error)
                    }
                }
                task.resume()
            }else {
                
                completion(ErrorStatus.noInternet, nil)
            }
        }
    }
}
