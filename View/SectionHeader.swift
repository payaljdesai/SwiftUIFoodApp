//
//  SectionHeader.swift
//  SwiftUIFoodApp
//
//  Created by Payal Desai on 10/9/23.
//

import SwiftUI
struct SectionHeader :View {
    var title : String
    var body: some View
    {
        Text(title)
            .font(.headline)
            .foregroundColor(Color.black)
    }
    
}
