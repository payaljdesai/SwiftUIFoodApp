//
//  HomeView.swift
//  SwiftUIFoodApp
//
//  Created by Payal Desai on 10/7/23.
//

import SwiftUI

struct HomeView: View {
    var homepagedata : HomePageData?
    let apiservice = ApiService()
   @StateObject private var viewModel = HomeViewModel(apiService: ApiService())

    var body: some View {
        
        NavigationStack {
            ZStack {
                switch viewModel.viewState {
                case .loading:
                    ProgressView("Fetching foods, Please Be Patient")
                case .fetched:
                   MainPage
                    
                case .error(message: let message):
                    Text(message)

                }
            }
        }.accentColor(.pink)
        .onAppear {
            Task {
                
               await viewModel.fetchHomePageData()
            }
        }
    }
    var MainPage: some View
    {
        ScrollView(.vertical, showsIndicators: false) {
            Spacer(minLength: 10)
            VStack(alignment: .leading,spacing: 10){
                
                Text("Hi Payal")
                    .font(.title2)
                    .foregroundColor(Color(yellowColor))
                
                Text("Grab your order. . .")
                    .font(.title3)
                    .foregroundColor(Color(yellowColor))
                
                SectionHeader(title: "Food Category")
                    .frame(height: 30)
                
                    ScrollView(.horizontal ,showsIndicators: false)
                    {
                        LazyHStack {
                            if let allDishes = viewModel.alllFoodData {
                                ForEach(allDishes.categories){ foodDish in
                                    Categoryview(catDish: foodDish)
                                }
                            }
                        }
                }
                .frame(height: 150)
                
                
                SectionHeader(title: "Populaer Food")
                    .frame(height: 30)
                
           
                ScrollView(.horizontal ,showsIndicators: false)
                    {
                        HStack {
                            if let alldish = viewModel.alllFoodData{
                                ForEach(alldish.populars) { dish in
                                    PopulerFoodView(populerfood: dish)
                                }
                            }
                        }
                }
                SectionHeader(title: "Chef's Special")
                    .frame(height: 30)
                
                //ScrollView(.horizontal)
                //{
                LazyVStack {
                        if let alldish = viewModel.alllFoodData {
                            ForEach(alldish.specials){ food in
                                ChefsSpecialFoodView(food: food)
                                    

                            }
                        }
                    }
               // }
                //.frame(maxWidth: .infinity)

               // .frame(maxWidth: .infinity)
                
            }
            .padding(.leading ,10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {       
        HomeView()
    }
}
