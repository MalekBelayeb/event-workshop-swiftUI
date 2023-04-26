//
//  SearchInputView.swift
//  event-workshop-swiftui
//
//  Created by ODC on 26/4/2023.
//

import SwiftUI

struct SearchInputView: View {
    @State var searchInput : String = ""
    var body: some View {
        RoundedRectangle(cornerRadius: 24).stroke( Color.black.opacity(0.5)).frame(height: 60).overlay{
            HStack {
                TextField("Search" , text: $searchInput).foregroundColor(Color.black.opacity(0.5)).font(.custom(Fonts.airbnbCereal_medium, size: 14))
                Image("searchic").frame(width: 24, height: 24)
            }.padding(.horizontal,16)
        }
        
        
    }
}

struct SearchInputView_Previews: PreviewProvider {
    static var previews: some View {
        SearchInputView()
    }
}
