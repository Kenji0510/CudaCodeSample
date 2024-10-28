cmake_minimum_required(VERSION 3.10)
cmake_policy(SET CMP0104 NEW)
project(VectorAdd CUDA)

set(CMAKE_CUDA_STANDARD 11)

# Add the executable
add_executable(vector_add src/main_01.cu)

# Set the properties for the CUDA compiler
set_target_properties(vector_add PROPERTIES
    CUDA_SEPARABLE_COMPILATION ON)

# Specify the required CUDA architecture
set(CMAKE_CUDA_ARCHITECTURES 52)

# Include directories if needed
# target_include_directories(vector_add PRIVATE ${CMAKE_CUDA_TOOLKIT_INCLUDE_DIRECTORIES})