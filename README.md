# Mastermind
04.03.2023

Mastermind has reached v1.0. 
There are two different modes: 
- The computer generates a sequence and the player has to guess it.
- The player gives a sequence and the computer has to guess it.

Possible ToDos:
- Scorekeeping
- Tyding up the Code
- Tyding up the outputs
- Optimizing the code
- Additional difficulties for the computer guessing
- Help mode

Learned/Trained:

- Preplanning
- Encapsulation


Implementing the first game mode was straightforward, using what I learned in Tic Tac Toe.
The second gamemode required me to think of a way for a computer to guess the sequence. My solution uses a list of all possible sequences. This list is reduced to only those results that could lead to the given feedback. Afterwards, one of the remaining sequences is randomly chosen. Although there are Algorithms that can definitly solve a game of Mastermind in a certain number of turns, the solution used proved to be good enough.
One important decision that had to be made at the beginning was how to store a single guess.
I decided to use a Guess class, that stores the colors both as a list of strings as well as list of numbers. This meant, that I only had to think about converting one into the other at the moment of instanziation. The returned pegs are also stored in this class, allowing the entire boardstate to be represendet by a single list of guesses.


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