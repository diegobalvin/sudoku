# Ruby Sudoku

I proposed this solution to the sudoku solver problem to avoid using the brute force approach where we just test all possible boards and see which one works. Using a recursive backtracking method, we can arrive at a solution much more efficiently. Before we begin the process however, we first check that the input is properly formatted. If from the get-go the board is improperly formatted or does not meet the requirments for a valid sudoku board, we don't bother to enter the recursive backtracking method at all.

# Pregunta: Si ofrecieras un servicio de solución de Sudokus, ¿cómo le darías valor?

There are a myriad of sudoku solvers already on the web, google play store, and app store. Anyone who is unsure about whether or not their sudoku puzzle is solvable or just wants hints on potential next moves can find an existing solver very very quickly. I think all the value there is to be brought by a Sudoku solver service in the online world is already maxed out: there's simply too much competition to bring about any more value.

However, I believe there's a huge market for an older population of sudoku players around the world who aren't as technologically adjusted to the online world as younger populations. I propose building a very small, handheld sudoku solver device (similar to a kindle paperwhite), and trying to get it on as many bookstore shelves as possible. This is something that could actually offer value to people who love the game, yet either don't have access to the internet (4 billion) or are part of an older generation that missed the technology train (65+ = 15% of world population ~ 1 billion).
