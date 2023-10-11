//
//  PopulerFoodView.swift
//  SwiftUIFoodApp
//
//  Created by Payal Desai on 10/9/23.
//

import SwiftUI
struct PopulerFoodView : View
{
    var populerfood : FoodDish
    
    var body : some View {
        VStack(alignment: .leading,spacing: 10){
            HStack (alignment: .top ,spacing: 10) {
                AsyncImage(url: URL(string: populerfood.image)) { image in
                        image.resizable()
                    
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 100,height: 100)
                    .cornerRadius(20)
                Spacer()
                    
                Image(systemName: "heart")
                    .foregroundColor(.yellow)


            }
            .padding(.top ,10)
       
            HStack (alignment: .top) {
                Text(populerfood.name)
                    .font(.system(size: 15))
                    //.font(.title3)
                    .foregroundColor(.black)
                Spacer()
                Text( "Price : $7.2")
                    .foregroundColor(.red)
                    .font(.system(size: 15))

            }
            HStack(spacing: 2) {
                ForEach(0..<5) { _ in
                    Image(systemName: "star.fill")
                        .renderingMode(.template)
                        .foregroundColor(.yellow)
                }
            }


           // HStack{
                Text( "calories : \(populerfood.calories)")
           // }

        }
        .padding()
        .frame(width: 200,height: 250)
        .background(Color(backgrouncolor))
        .cornerRadius(10)
    }
    
}
 
