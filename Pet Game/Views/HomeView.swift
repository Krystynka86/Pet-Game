//
//  HomeView.swift
//  Pet Game
//
//  Created by Cristina on 2021-11-10.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isActiveDog: Bool = false
    @State private var isActivePig: Bool = false

    var body: some View {
        NavigationView{
            ZStack{
                Color.blue.opacity(0.4)
                    .ignoresSafeArea()
                
                VStack{
                    
                    
                    
                    Label("Choose a pet !", systemImage: "")
                        .font(.custom("PermanentMarker-Regular", size: 45))
                        .padding()
                         
                    
                    HStack{
                        
                        NavigationLink(destination: ContentView(), isActive: self.$isActiveDog){
                            Button("🐶"){
                                self.isActiveDog = true
                                playSound(sound: "dog", type: "mp3")
                                    
                            }
                            
                        }
                        
                        
                        NavigationLink(destination: ContentView2(), isActive: self.$isActivePig){
                            Button("🐷"){
                                self.isActivePig = true
                                playSound(sound: "pig", type: "mp3")
                                
                            }
                            
                        }
                        
                        
                    }
                    . font(.system(size: 120))
                    .accessibilityLabel("Label")
                    
                    Spacer()
                }
                 
                
            }
            
         }
        
     }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
             HomeView().preferredColorScheme($0)
                .previewInterfaceOrientation(.portrait)
        }
    }
}

