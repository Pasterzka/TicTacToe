//
//  boardClass.swift
//  
//
//  Created by Jakub Pastuszka on 04/05/2026.
//

class boardClass {
    var board: [String] = Array(repeating: " ", count: 9)
    
    // print board
    func printBoard() -> Void{
        print("")
        print("  0|  1|  2")
        print(" " + board[0] + " | " + board[1] + " | " + board[2])
        print("   |   |")
        print("---+---+---")
        print("  3|  4|  5")
        print(" " + board[3] + " | " + board[4] + " | " + board[5])
        print("   |   |")
        print("---+---+---")
        print("  6|  7|  8")
        print(" " + board[6] + " | " + board[7] + " | " + board[8])
        print("   |   |")
        print()
    }
    
    func resetBoard() -> Void{
        board = Array(repeating: " ", count: 9)
    }
}
