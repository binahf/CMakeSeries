#[=[
conditions with if command 
    Generally, you pass the non dereferenced variable as conditions to the if command.
    Here is my understanding of the command:
    . If the variable is undefined: evaluate to false
    . If the variable is defined and set to false: evalute to false
    . Otherwise evaluate to true
    
#]=]

# set(VAR1 TRUE)
# if(VAR1)
#     message("VAR1 is true")
# else()
#     message("VAR1 is false")
# endif()

# Directly passing TRUE or FALSE in an if command
# The only way can get this to print "VAR2 is true" is to set VAR2 to 1
# We keep this in mind and move for now. Avoid in pratice
#[=[
set(VAR2 TRUE)
if(${VAR2})
    message("VAR2 is true")
else()
    message("VAR2 is fale")
endif()  #]=]

# An argument named "TRUE" appears in a conditional statement. 
# Policy CMP0012 is not set: if() recognizes numbers and boolean constants.  
# Run  "cmake --help-policy CMP0012" for policy details.  
# Use the cmake_policy  command to set the policy and suppress this warning.
# This warning is for project developers.  Use -Wno-dev to suppress it.

# EQUAL
if(2 EQUAL 1)
    message("2 EQUAL 1")
else()
    message("2 NOT EQUAL 1")
endif()

# LESS
set(DOG 13)
set(PIG 12)
if(PIG LESS DOG)
    message("PIG LESS THAN DOG")
else()
    message("PIG NOT LESS THAN DOG")
endif()

# STRLESS_EQUAL
if(PIG STRLESS_EQUAL DOG)
    message("PIG LESS THAN OR EQUAL TO DOG ")
else()
    message("PIG NOT LESS THAN OR EQUAL TO DOG")
    
endif()
