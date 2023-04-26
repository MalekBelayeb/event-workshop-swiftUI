//
//  HomeView.swift
//  event-workshop-swiftui
//
//  Created by ODC on 25/4/2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var eventViewModel: EventViewModel = EventViewModel()
    @State var navigatTo: Bool = false
    @State var selectedId : String?
    
    var body: some View {
        
        ZStack{
            NavigationLink("",destination: DetailsEventView(eventId:selectedId,eventViewModel: self.eventViewModel ), isActive: $navigatTo)
            VStack
            {
                SearchInputView()
                ScrollView(showsIndicators: false){
                    
                    VStack{
                        
                        VStack{
                            HStack{
                                Text("Upcoming Event").font(.custom(Fonts.airbnbCereal_bold, size: 16))
                                Spacer()
                                Button{
                                    
                                }label: {
                                    Text("See All").font(.custom(Fonts.airbnbCereal_medium, size: 14)).foregroundColor(Color.black.opacity(0.5))
                                }
                            }
                            if self.eventViewModel.upcomingEventIsLoading{
                                
                                ProgressView()
                                
                            }
                            else{
                                ScrollView(.horizontal,showsIndicators: false) {
                                    HStack{
                                        ForEach(self.eventViewModel.upcomingEvents){
                                            event in
                                            Button{
                                                self.navigatTo = true
                                                self.selectedId = event.id
                                            }label: {
                                                EventHItemView(event: event)
                                            }
                                        }
                                    }.padding(.vertical,16)
                                }
                            }
                            
                                
                            
                          
                        }
                        
                        VStack{
                            HStack{
                                Text("Upcoming Event").font(.custom(Fonts.airbnbCereal_bold, size: 16))
                                Spacer()
                                Button{
                                    
                                    
                                }label: {
                                    Text("See All").font(.custom(Fonts.airbnbCereal_medium, size: 14)).foregroundColor(Color.black.opacity(0.5))
                                }
                            }
                            
                            
                            ScrollView(.horizontal,showsIndicators: false) {
                                HStack{
                                    ForEach(self.eventViewModel.upcomingEvents){
                                        event in
                                        Button{
                                            self.navigatTo = true
                                        }label: {
                                            EventHItemView(event: event)
                                        }
                                    }
                                }.padding(.vertical,16)
                            }
                        }
                        
                    }.frame(maxWidth:  .infinity, maxHeight: .infinity)
                }.padding(.top , 32)
                Spacer()
            }.frame(maxWidth:  .infinity, maxHeight: .infinity).onAppear{
                
                
                self.eventViewModel.getAllEvents()
                
                
            }.padding(.horizontal,16)
        }
        
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
