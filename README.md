# FiboSeq

This project is a **Fibonacci Sequence Generator** built in Erlang.  
The program asks the user for how many Fibonacci numbers to generate, produces the sequence using recursion, and prints each number in a formatted way (`~p`).  
It runs inside a loop, allowing the user to choose whether to generate another sequence or exit the program.  
Pattern matching is used in the recursive Fibonacci calculation and in the loop control, ensuring clean and efficient logic.

The main concepts explored in this project are:

- **Recursion** for generating the sequence.
- **Pattern matching** to handle user input and loop control.
- **Formatted output** (`~p`) to display values.
- **Interactive loops** for repeated execution.

[Software Demo Video](https://youtu.be/ByTLfLhFGAY)

# Development Environment

- **Editor/IDE:** Erlang shell and any text editor (VS Code recommended with Erlang plugin).
- **Language:** Erlang
- **Libraries:** None – only Erlang standard functions were used.

# Useful Websites

- [Erlang Official Documentation](https://www.erlang.org/docs)
- [Learn You Some Erlang for Great Good](https://learnyousomeerlang.com/content)
- [Erlang TutorialsPoint](https://www.tutorialspoint.com/erlang/index.htm)

# Future Work

- Save the generated sequence to a text file.
- Add input validation to handle non-numeric values.
- Allow filtering for even or odd Fibonacci numbers only.
- Implement a maximum limit to avoid very large numbers in output.
