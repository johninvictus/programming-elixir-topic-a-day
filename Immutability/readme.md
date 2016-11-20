### ImmutabilityA
An immutable object (unchangeable[1] object) is an object whose state cannot be modified after it is created.

Elixir object are not modified but a new copy is produced

ie
```shell
iex(1)> name = "john"
"john"
iex(2)> String.capitalize name
"John"
iex(3)> name
"john"
iex(4)> 
```

As you can see above the the variable name was not modified after calling **String.capitalize** , hence the variable data is immutable.

The data in the variable will remain the same unless the variable is rebinded by another value ie
``` shell
iex(10)> sex = "male"
"male"
iex(11)> String.capitalize sex
"Male"
iex(12)> sex
"male"
iex(13)> sex = "female"
"female"
iex(14)> sex
"female"
iex(15)> 
```
