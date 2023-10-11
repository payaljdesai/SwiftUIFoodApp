//
//  ViewState.swift
//  SwiftUIFoodApp
//
//  Created by Payal Desai on 10/9/23.
//

import Foundation

enum ViewState {
    case loading
    case error(message: String)
    case fetched
}
