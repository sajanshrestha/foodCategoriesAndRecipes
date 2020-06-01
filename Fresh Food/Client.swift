//
//  Client.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 4/21/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import UIKit

// this class make network requests and retrieve recipes

class Client {
    
    static let baseUrl = "https://api.edamam.com/search"
    static private let appId = "f85a3762"
    static private let appKey = "508f411c9deb88d2138fe738dff1686c"
    
    static func getRecipeList(of selectedIngredients: [String], with filter: Filter, completion: @escaping ([Recipe]) -> Void) {
        
        guard var urlComponent = getUrlComponent(queries: selectedIngredients) else {return}
        
        
        if filter.balanced {
            urlComponent.queryItems?.append(URLQueryItem(name: "diet", value: FilterManager.DietFilter.balanced.rawValue))
        }
        if filter.highProtein {
            urlComponent.queryItems?.append(URLQueryItem(name: "diet", value: FilterManager.DietFilter.highProtein.rawValue))
        }
        if filter.vegan {
            urlComponent.queryItems?.append(URLQueryItem(name: "health", value: FilterManager.DietFilter.vegan.rawValue))
        }
        if filter.sugarConscious {
            urlComponent.queryItems?.append(URLQueryItem(name: "health", value: FilterManager.DietFilter.sugarConscios.rawValue))
        }
        if filter.peanutFree {
            urlComponent.queryItems?.append(URLQueryItem(name: "health", value: FilterManager.DietFilter.peanutFree.rawValue))
        }
        if filter.treenutFree {
            urlComponent.queryItems?.append(URLQueryItem(name: "health", value: FilterManager.DietFilter.treeNutFree.rawValue))
        }
                
        guard let url = urlComponent.url else {return}
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            
            guard let response = try? JSONDecoder().decode(Response.self, from: data) else {return}
            let hits = response.hits
            let recipes = hits.map {$0.recipe}
            completion(recipes)
            
        }
        task.resume()
        
    }
    
    static func getUrlComponent(queries items: [String]) -> URLComponents? {
        
        guard var urlComponents = URLComponents(string: baseUrl) else {return nil}
        
        urlComponents.queryItems = [
            URLQueryItem(name: "app_id", value: appId),
            URLQueryItem(name: "app_key", value: appKey),
            URLQueryItem(name: "from", value: "0"),
            URLQueryItem(name: "to", value: "15"),
        ]
        let queryItems = items.joined(separator: "+")
        
        urlComponents.queryItems?.append(URLQueryItem(name: "q", value: queryItems))
                
        return urlComponents
    }
    
    static func getImage(url: String, completion: @escaping (UIImage) -> Void) {
        
        let session = URLSession(configuration: .default)
        
        guard let url = URL(string: url) else {return}
        
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            guard let image = UIImage(data: data) else {return}
            completion(image)
        }
        task.resume()
    }
}
