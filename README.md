# Mastermind

18.02.2023

It is planned to represent a basic version of Mastermind using 4 classes and 1 module.

module Rules:   This module is used to represent the game rules.
                It stores a color table.
                It determines the respone for a given guess.

class Board:    This class is used to represent the game state.
                It stores a list of all guesses.
                It draws up all guesses.

class Player:   This class is used to represent the human player.
                It gets the players guesses

class KIPlayer: This class is used to represent the computer player.
                It gets the sequence that is to be solved.

class Guess:    This class is used to represent a single guess.
                It stores the chosen colors and the corresponging pegs.