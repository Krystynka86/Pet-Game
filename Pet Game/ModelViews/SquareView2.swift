//
//  SquareView2.swift
//  Pet Game
//
//  Created by Cristina on 2021-12-06.
//

import Foundation
import SwiftUI

enum Square2Status {
    case empty
    case home
    case visitor
}

class Square2 : ObservableObject {
    @Published var square2Status : Square2Status
    
    init(status : Square2Status) {
        self.square2Status = status
    }
}

struct SquareView2 : View {
    @ObservedObject var dataSource : Square2
    var action: () -> Void
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Text(self.dataSource.square2Status == .home ?
                 "🐷" : self.dataSource.square2Status == .visitor ?"🐶" : " ")
                .font(.system(size: 75))
                .frame(width: 100, height: 100, alignment: .center)
                .background(Color.green.opacity(0.5).cornerRadius(10))
                .padding(1)
        })
    }
}
