# SudokuSolver_CSP
This is a MATLAB  Artificial Intelligence (9 x 9) Sudoku Solver modeling the puzzle as a constraint satisfaction problem and then solving it using three levels of AI search algorithms. It can solve it solely with "Back-tracking Search", or with "Forward Checking & Minimum Remaining Value" implemented on top of it, or with "Arc Consistency" also known as "AC3" implemented on top of the previous ones. As it intuitively look, adding each step enhances the search and solves the puzzle with fewer number of steps.

This project was made for an AI course taken at Rafik Hariri University (RHU) - Spring 2015.

The main file is "Sudoku_GUI.m", where it contains the GUI, and the rest are supporting functions.
