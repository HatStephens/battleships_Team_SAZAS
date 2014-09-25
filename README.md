**BATTLESHIPS**

**TEAM: SAZAS**

Makers Academy Week 2 Project: Battleship Command Line Game

**Team Members**

Sean Smith
Ana Nogal
Zeeshan Rasool
Anna Jerofejeva
Stephen Giles


**Description**

Battleships is a command line version of the popular real-world game with the same name. It is written entirely in Ruby.

**Model**

The classes in our game are: Ships, Grid, Game, Input Manager, Player, Enemy, and Table to Screen.

Ship: The ship class creates five different type of ships each with a different name, length, direction.

Grid: This is the central object on which the game takes place. The grid class defines the dimensions (10x10 by default) of the grid, places the ship (either horizontally or vertically) for the human player and computer player. It also registers hits and misses by the two players. 

Game: This class initializes the components of the games. It presents the player with a start message, creates player, creates opponent, gets their ships and places them on the grid. It also randomises the hits by the opponent player. It manages the turns and keeps track of scores by both the players.

Enemy: This class defines the computer opponent, initialising it with a score of zero, creates ships on behalf of the computer, places the ship on the enemy grid. The placement of the ship occurs at random and will be different for all new instances of the game. 

Input Manager: The input manager classes defines what messages will be displayed to the user and what inputs will be required from the user. The user will be asked to give a name, and direction and coordinate for the ships.

Player: The player classes initialises the human player profile, asking for a name, with an initial score of zero, and creates a new grid for the human player.

Table to Screen: This class works off of a gem called Terminal-Table and prints the grid to the user in the command line interface.
