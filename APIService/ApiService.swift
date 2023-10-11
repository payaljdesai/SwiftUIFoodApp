//
//  ApiService.swift
//  SwiftUIFoodApp
//
//  Created by Payal Desai on 10/7/23.
//

import Foundation

protocol GetFoodData{
    func getHomePageData() async throws -> HomePageData
}

struct ApiService : GetFoodData {
    
     let HomePageDataUrl = "https://yummie.glitch.me/dish-categories"
    
    func getHomePageData() async throws -> HomePageData
    {
        guard let url = URL(string: HomePageDataUrl) else {
            throw ResponceError.InvalidUrl
        }
       
        let (data ,responce) =  try await  URLSession.shared.data(from: url)
        
        guard let responce  = responce as? HTTPURLResponse , responce.statusCode == 200 else
        {
            throw ResponceError.InvalidResponce
        }
        
        do {
             let decoder = JSONDecoder()
           return try decoder.decode(HomePageData.self, from: data)
        }
        catch {
            throw ResponceError.InvalidData
        }
        
    }
    
}
