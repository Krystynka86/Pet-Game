//
//  PetGameModel2.swift
//  Pet Game
//
//  Created by Cristina on 2021-12-06.
//

import Foundation

class PetGameModel2 : ObservableObject {
    @Published var squares2 = [Square2]()
    
    init() {
        for _ in 0...8 {
            squares2.append(Square2(status: .empty))
        }
    }
    
    func resetGame2() {
        for i in 0...8 {
            squares2[i].square2Status = .empty
        }
    }
    
    var gameOver2 : (Square2Status, Bool) {
        get {
            if thereIsAWinner2 != .empty {
                return (thereIsAWinner2, true)
            } else {
                for i in 0...8 {
                    if squares2[i].square2Status == .empty {
                        return(.empty, false)
                    }
                }
                return (.empty, true)
            }
        }
    }
    
    private var thereIsAWinner2: Square2Status {
        get {
            if let check = self.checkIndexes2([0, 1, 2]) {
                return check
            } else  if let check = self.checkIndexes2([3, 4, 5]) {
                return check
            }  else  if let check = self.checkIndexes2([6, 7, 8]) {
                return check
            }  else  if let check = self.checkIndexes2([0, 3, 6]) {
                return check
            }  else  if let check = self.checkIndexes2([1, 4, 7]) {
                return check
            }  else  if let check = self.checkIndexes2([2, 5, 8]) {
                return check
            }  else  if let check = self.checkIndexes2([0, 4, 8]) {
                return check
            }  else  if let check = self.checkIndexes2([2, 4, 6]) {
                return check
            }
            return .empty
        }
    }
    
    private func checkIndexes2(_ indexes : [Int]) -> Square2Status? {
        var homeCounter : Int = 0
        var visitorCounter : Int = 0
        for index in indexes {
            let square = squares2[index]
            if square.square2Status == .home {
                homeCounter += 1
            } else if square.square2Status == .visitor {
                visitorCounter += 1
            }
        }
        if homeCounter == 3 {
            return .home
        } else if visitorCounter == 3 {
            return .visitor
        }
        return nil
        }
    
    private func moveAI2() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            var index = Int.random(in: 0...8)
            while self.self.makeMove2(index: index, player: .visitor) == false && gameOver2.1 == false {
                index = Int.random(in: 0...8)
           }
        }
    }
    
    func makeMove2(index: Int, player: Square2Status) -> Bool {
        if squares2[index].square2Status == .empty {
            squares2[index].square2Status = player
            if player == .home {
                moveAI2()
            }
            return true
        }
        return false
    }
    
}
