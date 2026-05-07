//
//  aiPlayer.swift
//  commandLine
//
//  Created by Jakub Pastuszka on 07/05/2026.
//

class AiPlayer{
    var ai: String = "O"
    var player: String = "X"
    
    
    func getBestMove(board: [String], aiMark: String, playerMark: String) -> Int?{
        self.ai = aiMark
        self.player = playerMark
        
        var bestMove = -Int.max
        var move = -1
        
        for i in 0..<9{
            if board[i] == " "{
                var tempboard = board
                tempboard[i] = ai
                let score = minMax(board: tempboard, isMaximizing: false)
                if score > bestMove{
                    bestMove = score
                    move = i
                }
                
            }
        }
        
        return move
    }
    
    func minMax(board: [String], isMaximizing: Bool) -> Int{
        if checkWinner(board: board, currentPlayer: ai){
            return 10
        }
        if checkWinner(board: board, currentPlayer: player){
            return -10
        }
        if !board.contains(" "){
            return 0
        }
        
        if (isMaximizing){
            var bestScore = -Int.max
                for i in 0..<9 {
                    if board[i] == " " {
                        var tempBoard = board
                        tempBoard[i] = ai
                        let score = minMax(board: tempBoard, isMaximizing: false)
                        bestScore = max(score, bestScore)
                    }
                }
            return bestScore
        }else{
            var bestScore = Int.max
                for i in 0..<9 {
                    if board[i] == " " {
                        var tempBoard = board
                        tempBoard[i] = player
                        let score = minMax(board: tempBoard, isMaximizing: true)
                        bestScore = min(score, bestScore)
                    }
                }
            return bestScore
        
        }
    }
    
    
    func checkWinner(board: [String], currentPlayer: String) -> Bool{
        for i in 0...2{
            if board[i*3] == currentPlayer && board[i*3+1] == currentPlayer && board[i*3+2] == currentPlayer{
                return true
            }
            if board[i] == currentPlayer && board[i+3] == currentPlayer && board[i+6] == currentPlayer{
                return true
            }
        }
        if board[0] == currentPlayer && board[4] == currentPlayer && board[8] == currentPlayer{
            return true
        }
        if board[6] == currentPlayer && board[4] == currentPlayer && board[2] == currentPlayer{
            return true
        }
        return false
    }
    
}
