//
//  ContentView2.swift
//  Pet Game
//
//  Created by Cristina on 2021-11-10.
//

import SwiftUI

struct ContentView2: View {
    
    
    @StateObject var petGameModel2 = PetGameModel2()
    @State var gameOver2 : Bool = false
    
    func buttonAction(_ index : Int) {
            _ = self.petGameModel2.makeMove2(index: index, player: .home)
            self.gameOver2 = self.petGameModel2.gameOver2.1
        }
        
        var body: some View {
            
            ZStack{
                Color.green
                    .opacity(0.3)
                    .ignoresSafeArea()
                
            VStack {
                Spacer()
                 Text("LET'S PLAY!")
                    .font(.custom("PermanentMarker-Regular", size: 40))
                    .multilineTextAlignment(.center)
                    .padding()
                    
                    
                    
                    
                ForEach(0 ..< petGameModel2.squares2.count / 3, content: {
                    row in
                    HStack {
                        ForEach(0 ..< 3, content: {
                            column in
                            let index = row * 3 + column
                            SquareView2(dataSource: petGameModel2.squares2[index], action: {self.buttonAction(index)})
                        })
                     
                    }
                
                })
               Spacer(minLength: 180)
             } 
            
            }
            
            .alert(isPresented: self.$gameOver2, content: {
                Alert(title: Text("Game Over"),
                      message: Text(self.petGameModel2.gameOver2.0 != .empty ? self.petGameModel2.gameOver2.0 == .visitor ? "Doggy wins!" : "You win!" : "No Winner!" ) , primaryButton: Alert.Button.destructive(Text("Play again! "), action: {
                    self.petGameModel2.resetGame2()
                    
                }), secondaryButton: Alert.Button.cancel(Text("Quit"), action:{
                    self.petGameModel2.resetGame2()
                })
                )
                
            })
        }

    struct ContentView2_Previews: PreviewProvider {
        static var previews: some View {
            ForEach(ColorScheme.allCases,id:\.self){
                ContentView2().preferredColorScheme($0)
            }
        }
     }
    
}

