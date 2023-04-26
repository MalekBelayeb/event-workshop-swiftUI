//
//  DetailsEventView.swift
//  event-workshop-swiftui
//
//  Created by ODC on 26/4/2023.
//

import SwiftUI

struct DetailsEventView: View {
    var eventId:String?
    @ObservedObject var eventViewModel : EventViewModel
    var body: some View {
        GeometryReader{
            geo in
            VStack{
                Image("Image").resizable().scaledToFill().frame(width: geo.size.width,height: geo.size.height * 0.35)
                
                if(self.eventViewModel.eventDetailIsLoading){
                    ProgressView()
                }else{
                    VStack{
                        VStack{
                            Text(eventViewModel.eventDetail?.title ?? "").font(.custom(Fonts.airbnbCereal_medium, size: 24)).frame(maxWidth: .infinity,alignment: .leading).lineLimit(4)
                            HStack{
                                RoundedRectangle(cornerRadius: 12).fill(.blue.opacity(0.2)).frame(maxWidth: 50, maxHeight: 50).overlay{
                                    Image("calander-ic").resizable().frame(width: 24,height: 24)
                                }.padding([.top,.leading],4)
                                VStack(alignment: .leading){
                                    Text(eventViewModel.eventDetail?.place ?? "")
                                    Text(eventViewModel.eventDetail?.address ?? "").font(.custom(Fonts.airbnbCereal_book, size: 18))
                                }.padding(.leading)
                                Spacer()
                            }
                            
                            HStack{
                                RoundedRectangle(cornerRadius: 12).fill(.blue.opacity(0.2)).frame(maxWidth: 50, maxHeight: 50).overlay{
                                    Image("location-ic").resizable().frame(width: 24,height: 24)
                                }.padding([.top,.leading],4)
                                VStack(alignment: .leading){
                                    Text(eventViewModel.eventDetail?.date ?? "")
                                    Text(eventViewModel.eventDetail?.dateTime ?? "")
                                }.padding(.leading)
                                Spacer()
                            }
                            
                            HStack{
                                Text("Performers").font(.custom(Fonts.airbnbCereal_bold, size: 24))
                                Spacer()
                            }
                            
                            HStack{
                                Image("Image").resizable().frame(width: 160,height: 120).overlay{
                                    
                                    LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.5)]), startPoint: .top, endPoint: .bottom).overlay(alignment:.bottomLeading){
                                        VStack{
                                            Text("TEXT").font(.custom(Fonts.airbnbCereal_bold, size:18)).foregroundColor(.white)
                                            Text("TEXT").font(.custom(Fonts.airbnbCereal_bold, size:12)).foregroundColor(.white)
                                            
                                        }.padding([.leading,.bottom],6)
                                    }
                                    
                                }.cornerRadius(16)
                            }
                        }.padding(16)
                        
                    }
                }
                
            }.edgesIgnoringSafeArea(.top).onAppear{
                if let id = self.eventId{
                    self.eventViewModel.getEventById(id: id)
                }
            }
        }
    }
}

struct DetailsEventView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsEventView(eventId : "123", eventViewModel: EventViewModel())
    }
}
