//
//  ChefsSpecialFoodView.swift
//  SwiftUIFoodApp
//
//  Created by Payal Desai on 10/10/23.
//

import SwiftUI


struct ChefsSpecialFoodView : View
{
    var food : FoodDish
    @State private var rect1 = CGRect()

    var body : some View {
            
            VStack(alignment:.leading, spacing:  10) {
                HStack {
                    AsyncImage(url: URL(string: food.image)) { image in
                        image.resizable()
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 100,height: 100)
                    .cornerRadius(10)
                    VStack(alignment: .leading, spacing: 10) {
                        Text(food.name)
                            .foregroundColor(.yellow)
                        HStack(spacing: 2) {
                            ForEach(0..<5) { _ in
                                Image(systemName: "star.fill")
                                    .renderingMode(.template)
                                    .foregroundColor(.blue)
                            }
                        }
                        
                    
                        Text(food.description)
                            .lineLimit(2)
                        Spacer()
                        
                    }
                    
               }
               

            }
                .padding(.trailing, 10)
            .background(Color(backgrouncolor))
            .cornerRadius(10)
            
        
    }
    
    
    
}
