add_library(calculator calculator.cpp)
target_include_directories(calculator PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

add_library(runApp runApp.cpp)
target_link_libraries(runApp PUBLIC calculator)