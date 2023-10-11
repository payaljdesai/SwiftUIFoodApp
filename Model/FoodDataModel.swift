//
//  FoodDataModel.swift
//  SwiftUIFoodApp
//
//  Created by Payal Desai on 10/7/23.
//

import Foundation

struct HomePageData :Codable
{
    let status : Int
    let message : String
    let data : AllFoodDish
}

struct AllFoodDish : Codable
{
    let categories : [FoodDishCategory]
    let populars : [FoodDish]
    let specials : [FoodDish]
}

struct FoodDishCategory : Codable ,Identifiable
{
    let id : String
    let title :String
    let image :String
}
struct FoodDish : Codable ,Identifiable
{
    let id : String
    let description : String
    let name : String
    let image : String
    let calories : Int
    
}

