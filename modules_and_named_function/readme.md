##### Modules and Named Functions
Modules are the best way to organize functions into a namespace.

>Syntanx

```elixir
defmodule module do
  def function do

  end
end
```
In order to run the module you can use
```shell
$iex module.exs
$iex > module.function
```
This loads the module and then enters the Elixir command line

The other method to load the module is after opening the elixir module like

```shell
iex> c "module.exs"
```
##### The Function’s Body Is a Block

you can create a function following the **do... end** syntax or by using **do:**

ie
>do..end

```elixir
def double(n) do
  n * 2
end
```

>do:

```elixir
def double(n), do: n * 2
```

for multiple line you can write
```elixir
def double(n), do: (
IO.puts "The output is"
n * 2
)
```
With this learned method we can write our code like
```elixir
defmodule Maths do
  def double(n), do: n * 2
  def triple(n), do: n * 3
end
```
##### Function Calls and Pattern Matching
This is where you declare multiple function of same name and arity.Elixir tries to match every function to the provided parameters until it finds a match to execute the parameters or runs out of options

>Factorial example

```elixir
defmodule Factorial do
  def of(0), do: 1
  def of(n), do: n * of(n - 1)
end
```
>NOTE:
order of the function matter since elixir tries to match function from top to down.writing the above function like

```elixir
defmodule Factorial do
  def of(n), do: n * of(n - 1)
  def of(0), do: 1
end
```

Wont work.Since **def of(n)** will match all and **of(0)** wont be called.

##### Guard Clauses
This will prevent elixir Pattern matching from using functions that have not met some specified rules


```elixir
defmodule Factorial do
  def forx(0), do: 1
  def forx(n) when n > 0 do
    n * forx(n - 1)
  end
end
```
In the above Module for(n) will not match any value that is less than 0

To use multiple guard clause you just have to follow this syntax

```elixir
  def forx(n) when n > 0 and is_number(n) do
```

##### Default Parameters

When you define a named function, you can give a default value to any of its
parameters by using the syntax param \\ value . When you call a function that
is defined with default parameters, Elixir compares the number of arguments
you are passing with the number of required parameters for the function. If
you’re passing fewer arguments than the number of required parameters,
then there’s no match. If the two numbers are equal, then the required
parameters take the values of the passed arguments, and the other parameters
take their default values. If the count of passed arguments is greater than
the number of required parameters, Elixir uses the excess to override the
default values of some or all parameters. Parameters are matched left to right.

>default arguments

```elixir
defmodule Example do
def func(p1, p2 \\ 2, p3 \\ 3, p4) do
    IO.inspect [p1, p2, p3, p4]
  end
end

Example.func("a", "b")
Example.func("a", "b", "c")
Example.func("a", "b", "c", "d")
# => ["a",2,3,"b"]
# => ["a","b",3,"c"]
# => ["a","b","c","d"]
```

##### Private Functions
The defp macro defines a private function—one that can be called only within
the module that declares it.

##### |> — The Amazing Pipe Operator
