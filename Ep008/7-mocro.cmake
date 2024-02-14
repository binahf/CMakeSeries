# # A macro modifying a variable in the global scope
# macro(ModifyGlobalvariables VAR1 VAR2)
#     set(${VAR1} "New value for VAR1")
#     set(${VAR2} "New value for VAR2")   
# endmacro()

# # Define two global variables
# set(GLOBAL_VAR1 "Original value for VAR1")
# set(GLOBAL_VAR2 "Original value for VAR2")

# message("Before macro call:")
# message("GLOBAL_VAR1: ${GLOBAL_VAR1}")
# message("GLOBAL_VAR2: ${GLOBAL_VAR2}")

# # call the function to modify the global variables
# ModifyGlobalvariables(GLOBAL_VAR1 GLOBAL_VAR2)

# message("After macro call:")
# message("GLOBAL_VAR1: ${GLOBAL_VAR1}")
# message("GLOBAL_VAR2: ${GLOBAL_VAR2}")

# --------------------------------------------

# set up a macro that increments a variable

macro(IncrementVariable VAR)
    math(EXPR ${VAR} "${${VAR}} + 1")
    # set(${VAR} ${${VAR}} PARENT_SCOPE)  
endmacro()

# # Define a variable
set(MyVariable 0)

# # call the macro to increment the variable
IncrementVariable(MyVariable)
# # print the value in the variable
message("MyVariable: ${MyVariable}")

# # call the macro to increment the variable
IncrementVariable(MyVariable)
# # print the value in the variable
message("MyVariable: ${MyVariable}")

# # write a loop that calls the IncrementVariable function twice
foreach(loop_var RANGE 1)
    message("loop_var: ${loop_var}")
    IncrementVariable(MyVariable)
endforeach()
    
message("MyVariable: ${MyVariable}")



