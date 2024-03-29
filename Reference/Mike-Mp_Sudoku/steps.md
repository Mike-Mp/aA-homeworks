# Sudoku Game

---------------

* Learning Goals
  * Understand what factory methods are and how to use them.
  * Understand how classes interact and how to use require_relative
  * Be able to write and explain how bracket methods [] and []= work
  * Be able to use pry to test small parts of your code

## Tile Class

Each `Tile` has a value and is either given or not. You cannot change the value of any Tile unless it was given. The game would be incredibly frustrating if we didn't have some way to distinguish given `Tiles` from non-givens. You;ll want to acount for this when writing the `Tile#to_s` method. If you haven't already, check out the colorize gem!

 => Initialize Tile Class
 => Create instance variables for @value and @given. @given = false/true
 => User can't change given values. Values have dfferent colors whether they are given or not.

## Board Class

A Board should store a `grid` of Tiles. Define your `Board#initialize` method to accept such a grid as argument. Since our puzzles exist as text files, let's write a `Board::from_file` factory method to read a file and parse it into a two-dimensional Array containing Tile instances.

The Board class will be doing much of the heavy lifting for our game's logic. It will need the following methods:

* A method to update the value of a Tile at the given position
* A render method to display the current board state
* A solved? method to let us know if the game is over
  * Use several helper methods here. You will want to know if each row, column, and 3x3 square has been solved.

## Game Class

The Game should have an instance variable for the Board. It should also have methods for managing the Board-Player interaction. You may want a play loop that runs until the puzzle is solved. Inside the loop, you should render the board, prompt the player for input, and then get both a pos and a value from the player. It should then update the tile at pos with the new value. I wrote helper methods to get and validate input from the user; this should help keep our program from crashing.
