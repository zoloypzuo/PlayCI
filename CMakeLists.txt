cmake_minimum_required(VERSION 3.0)
project(test)

add_executable(main main.cpp)

find_package(unofficial-sqlite3 CONFIG REQUIRED)
target_link_libraries(main PRIVATE unofficial::sqlite3::sqlite3)
