# 1  Building Abstractions with Procedures
  * [[1.1  The Elements of Programming]]
    * [[1.1.1  Expressions]]

* **computational process** are active beings of programs execution in a computer
* processes manipulate other abstract things called **data**
* *behavior of a process* is described by a pattern of rules called a **program**

In effect, we write programs to conjure the spirits of the computer with our spells to get something useful or just fun.

## Programming in Lisp

Lisp has scary syntax soup of parens, and considered died due to its strange syntax and low-level list semantics.
To follow modern habits we can reimplement the Lisp power using other popular languages such as Python, to be compatible with the mainstream, to have any tons of tools, libraries, and frameworks integrated, but catch and save the magic force. 

Hey, I hear the stomping adherents cavalry of the dark order. If you claim and protest, try to drag your favorite Racket or Scheme into a team developing any industrial product. You'll be beaten, and rewarded by a Haskell Sword in the worst case. The problem not in the language, but in its compatibility with developers' and contractors' habits, the ease of hiring, and integration with software stacks and frameworks. 

The speed of the language interpreter does not matter. If you are trying to do something like numerical data crunching or machine learning with an interpreter, and worry about the bare computing speed, you just doing something wrong. Interpreters including the base Lisp itself were designed for experimenting, fast program rewriting, and symbolic computations (which includes automated program transformation). If you need to do fast and intensive computations, use the interpreter in a proper way: write a specialized compiler or use code generation, and backend compiler with rich optimizations such as C++, Rust, assembler,.. 

Use the right tools in the right way: symbolic homoiconic languages are the best for metaprogramming, code synthesis, and model-driven development. If a symbolic interpreter faster then your thinking, it is mostly enough. The most significant of these features is the fact that descriptions of processes, called *procedures* or *macroses*, can themselves be represented and manipulated as data. 
