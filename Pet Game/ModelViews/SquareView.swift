//
//  SquareView.swift
//  Pet Game
//
//  Created by Cristina on 2021-11-08.
//

import Foundation
import SwiftUI


enum SquareStatus {
    case empty
    case home
    case visitor
}

class Square : ObservableObject {
    @Published var squareStatus : SquareStatus
    
    init(status : SquareStatus) {
        self.squareStatus = status
    }
}

struct SquareView : View {
    @ObservedObject var dataSource : Square
    var action: () -> Void
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Text(self.dataSource.squareStatus == .home ?
                  "🐶" : self.dataSource.squareStatus == .visitor ? "🐷":" ")
            .font(.system(size: 75))
            .frame(width: 100, height: 100, alignment: .center)
            .background(Color.pink.opacity(0.4).cornerRadius(10))
            .padding(1)
            
        })
    }
}
