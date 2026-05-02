//
//  main.swift
//  commandLine
//
//  Created by Jakub Pastuszka on 02/05/2026.
//

import Foundation

// game configuration
var board: [String] = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
var isGameOn: Bool = true
var currentPlayer: String = "X"
var isPvE: Bool = false
var startPlayer: String = "X"

// score
var scoreX = 0
var scoreO = 0
var scoreDraws = 0

// print game
func printGame() -> Void{
    print("\n")
    print("Now Playing: \(currentPlayer)")
    printBoard()
}

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
}

func makeMove(player: String) -> Void {
    print("Enter the number of the position you want to place your \(currentPlayer)")
    
    
    
    var correctMove: Bool = false
    // move logic
    while !correctMove{
        if let input = readLine(), let position = Int(input), position >= 0, position <= 8 {
            if board[position] == " " {
                board[position] = currentPlayer
                correctMove = true
            } else {
                print("That spot is already taken, try again")
                correctMove = false
            }
        } else {
            print("That's not a valid number, try again")
            correctMove = false
        }
    }
    correctMove = false
}

func checkWinner(player: String) -> Bool {
    // horizontally
    for i in 0...2{
        if board[i*3] == player && board[i*3+1] == player && board[i*3+2] == player{
            return true
        }
    }
    
    // vertically
    for i in 0...2{
        if board[i] == player && board[i+3] == player && board[i+6] == player{
            return true
        }
    }
    
    // slant 1
    if board[0] == player && board[4] == player && board[8] == player{
        return true
    }
    
    // slant 2
    if board[6] == player && board[4] == player && board[2] == player{
        return true
    }
    
    return false
}

// check if there is an empty place
func isBoardFull() -> Bool{
    return !board.contains(" ")
}

// program
while isGameOn {
    // print board
    printBoard()
    
    // player or computer move
    if isPvE && currentPlayer == "O"{
        print("NOT IMPLEMENTED")
    }
    else {
        makeMove(player: currentPlayer)
    }
    
    // check win or draw -> next player
    if checkWinner(player: currentPlayer){
        print("Player \(currentPlayer) win the GAME!")
        
        if currentPlayer == "X" {
            scoreX += 1
        }
        else {
            scoreO += 1
        }
        
        isGameOn = false
    }
    else if isBoardFull(){
        scoreDraws += 1
        isGameOn = false
        print("DRAW!")
    }
    else {
        currentPlayer = (currentPlayer == "X") ? "O" : "X"
    }
    
    
    if !isGameOn{
        printBoard()
        print()
        print(" --- SCORE --- ")
        print("X: \(scoreX), O: \(scoreO), DRAW: \(scoreDraws)")
        
        print("Wonna play next? (t/n)")
        if readLine() == "t"{
            board = Array(repeating: " ", count: 9)
            isGameOn = true
            startPlayer = (startPlayer == "X") ? "O" : "X"
            currentPlayer = startPlayer
        }else{
            print("Thank you for a game! BYE!")
        }
    }
}

