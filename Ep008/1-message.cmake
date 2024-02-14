# scripts can be run with the command belwo:
# cmake -P < script_name>.cmake

# ===== The message command. How it's generally used 
message("The sky is blue")

# ===== Bracket arguments. can be used to print multiple lines
message([=[
Bracket arguments.
can be used to print multiple lines 
The sky is blue ]=])

# ====== Quoted arguments and escapce sequences 
# Escaping characters 
message("The sky is blue : \" \n my friend")
# Multiple line quoted arguments. 
message("With great power...
              comes great responsibility")
# Variable evaluation
message("The cmake version is ${CMAKE_VERSION}")

# ====== Unquoted arguments. space and semicolons act as separators
message(The\ sky is blue) # One argument, the spaces are escaped
message(Tow arguments) # Two arguments: the space acts as separator 
message(The;sky;is;blue) # Four arguments: The ; acts as a separator