# A function that mimicks the return mechanism in languages like c++
function(ModifyGlobalvariables VAR1 VAR2)
    set(${VAR1} "New Value for var1" PARENT_SCOPE)
    set(${VAR2} "New Value for VAR2" PARENT_SCOPE)
endfunction()

# Define two global variables
set(GLOBAL_VAR1 "Original Value for VAR1")
set(GLOBAL_VAR2 "Original Value for VAR2")

message("Before function call:")
message("GLOBAL_VAR1: ${GLOBAL_VAR1}")
message("GLOBAL_VAR2: ${GLOBAL_VAR2}")

# Call the function to modify the global variables
ModifyGlobalvariables(GLOBAL_VAR1 GLOBAL_VAR2)
message("After function call:")
message("GLOBAL_VAR1: ${GLOBAL_VAR1}")
message("GLOBAL_VAR2: ${GLOBAL_VAR2}")

# A function that increment a variable 

# function(Increment VAR)
#     math(EXPR ${VAR} "${${VAR}} + 1")
#     set(${VAR} ${${VAR}} PARENT_SCOPE)
# endfunction

# # Define a variable
# set(MyVarible 0)

# # Call the function to increment the variable
# InrementVariable(MyVariable)
# #Print the value in the variable
# message("MyVariable: ${MyVariable}")

# # Call the function to increment the variable
# IncrementVariable(MyVariable)
# #Print the value in the variable
# message("MyVariable: ${MyVariable}")