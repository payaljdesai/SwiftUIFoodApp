//
//  HomeViewModel.swift
//  SwiftUIFoodApp
//
//  Created by Payal Desai on 10/9/23.
//

import Foundation

final class HomeViewModel : ObservableObject
{
    let apiService : ApiService
   @Published var alllFoodData : AllFoodDish?
   @Published var viewState: ViewState = .loading

    init(apiService: ApiService)
    {
        self.apiService = apiService
    }
    
    func fetchHomePageData() async
    {
        do {
          let homepagedata = try await apiService.getHomePageData()

            DispatchQueue.main.async {
                self.alllFoodData = homepagedata.data
                self.viewState = .fetched
            }
        }
        catch {
            DispatchQueue.main.async {
                
                self.viewState = .error(message: somethingWentWrong)
            }

        }
    }
    
}
