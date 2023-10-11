//
//  CategoryView.swift
//  SwiftUIFoodApp
//
//  Created by Payal Desai on 10/9/23.
//

import SwiftUI

struct Categoryview :View
{
    var catDish : FoodDishCategory
   
    var body: some View
    {
        VStack(alignment: .center, spacing: 20) {
            AsyncImage(url: URL(string: catDish.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 60,height: 60)
            
            
            Text(catDish.title)
                .font(.body)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
        }
        .frame(width: 125,height: 125)
        .background(Color(backgrouncolor))

        .cornerRadius(10)
    }
}
