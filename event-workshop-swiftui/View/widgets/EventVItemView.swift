//
//  EventVItemView.swift
//  event-workshop-swiftui
//
//  Created by ODC on 25/4/2023.
//

import SwiftUI

struct EventVItemView: View {
    
    let height: CGFloat = 120
    let event: Event
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 12).fill(.white).shadow(radius:2,x:2, y: 2)
            .overlay{
                
                HStack(spacing:16)
                {
                    
                    
                    Image(self.event.image).resizable().frame(maxWidth:90,maxHeight:110).scaledToFit().cornerRadius(12)
                    
                    VStack(spacing:12)
                    {
                        
                        Text(self.event.date
                        ).font(.custom(Fonts.airbnbCereal_book, size: 13)).frame(maxWidth:.infinity,alignment:.leading).foregroundColor(Styles.blue)
                        
                        Text(self.event.title).font(.custom(Fonts.airbnbCereal_medium, size: 14)).frame(maxWidth: .infinity,alignment: .leading).lineLimit(2)
                            
                        HStack
                        {
                            
                            Image("location-ic").resizable().frame(width:16,height: 16)
                            Text(self.event.location).font(.custom(Fonts.airbnbCereal_book, size: 13)).frame(maxWidth:.infinity,alignment: .leading)

                        }
                    }
                    
                    Spacer()
                    
                }.frame(maxWidth: .infinity).padding(12)
               
            }.padding(.horizontal,16).frame(maxHeight:self.height)
        
        
        
        
    }
}

struct EventVItemView_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        EventVItemView(event: Event(date: "Sat, May 1 •2:00 PM", image: "event-img", title: "A Virtual Evening of Smooth Jazz A Virtual Evening of Smooth Jazz A Virtual Evening of Smooth Jazz A Virtual Evening of Smooth Jazz", location: "Lot 13 • Oakland, CA", performers: []))
    }
}
