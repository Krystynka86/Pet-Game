//
//  ContentView.swift
//  Pet Game
//
//  Created by Cristina on 2021-11-08.
//

import SwiftUI

struct ContentView: View {
    
    
    @StateObject var petGameModel = PetGameModel()
    @State var gameOver : Bool = false
    
    
    func buttonAction(_ index : Int) {
        _ = self.petGameModel.makeMove(index: index, player: .home)
        self.gameOver = self.petGameModel.gameOver.1
    }
    
    var body: some View {
        
        ZStack{
            Color.pink
                .opacity(0.3)
                .ignoresSafeArea()
        VStack {
           Spacer()
             Text("Let's PLAY!")
                .font(.custom("PermanentMarker-Regular", size: 40))
                .multilineTextAlignment(.center)
                .padding()
                
                
            
                
            ForEach(0 ..< petGameModel.squares.count / 3, content: {
                row in
                HStack {
                    ForEach(0 ..< 3, content: {
                        column in
                        let index = row * 3 + column
                        SquareView(dataSource: petGameModel.squares[index], action: {self.buttonAction(index)})
                        
                    })
                }
             })
            Spacer(minLength: 180)
        }
        }
        
        
        .alert(isPresented: self.$gameOver, content: {
            Alert(title: Text("Game Over"),
                  message: Text(self.petGameModel.gameOver.0 != .empty ? self.petGameModel.gameOver.0 == .home ? "You Win" : "Piggy Wins!" : "No Winner!" ) , primaryButton: Alert.Button.destructive(Text("Play again! "),  action:{
                self.petGameModel.resetGame()
                
            }), secondaryButton: Alert.Button.cancel(Text("Quit"), action:{
                self.petGameModel.resetGame()
            })
           )
        })
        
    }

    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases,id:\.self){
            ContentView().preferredColorScheme($0)
        }
            
            
      }
    
    
    }


}

