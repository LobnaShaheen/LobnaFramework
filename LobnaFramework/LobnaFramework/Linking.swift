//
//  Linking.swift
//  LobnaFramework
//
//  Created by Lobna Shaheen on 13/12/2022.
//

import Foundation

public class Linking {
    private let defaults = UserDefaults.standard
    
    private init(){}
    
    public func saveShoppingTrip(url: URL){
        guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            return
        }
        guard let items = urlComponents.queryItems else {return}
        var queryItems: [String : String] = [:]
        for item in items {
            queryItems[item.name] = item.value?.removingPercentEncoding
            if(item.name == "shoppingTrip")
            {
                defaults.set(queryItems[item.name]!, forKey: "ShoppintTripID")
                
            }
        }
        if #available(iOS 15, *) {
            defaults.set(Date.now, forKey: "ShoppingTripDate")
        } else {
            // Fallback on earlier versions
        }
    }
    public func endShoppingTrip(){
        let shoppintTripID = defaults.integer(forKey: "ShoppintTripID")
        let shoppingTripDate = defaults.object(forKey: "ShoppingTripDate") as! Date
        print(shoppintTripID)
        print(shoppingTripDate)
        // MARK: CALL API HERE
    }
}
