# Summary
This repo contains an xcconfig file which allows the OpenMP API to be used in Xcode. There is also a bash script with instructions on how to add the necessary libiomp.dylib to your OMP Xcode project.

**If you haven't already installed brew, go ahead and do so by using this:**

```/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"```

# Step 1 - Run Helper Script
The purpose of this script is to: 
- Check if llvm is installed 
- Copy the libomp.dylib into your project for you to spare you the manual searching
### Script Usage: 
- Drag the script to the top level of your project directory and run it there
- If llvm is not already installed on your machine, this script will give you the option of installing it
- Once this is finished, the libiomp.dylib file will be copied into your project

# Step 2 - Add Build Configuration File
- Place a copy of the included Config.xcconfig into your project
- File > Add files to "Your Project" > Config.xcconfig
- Make sure the versions specified for LLVM are up to date for HEADER_SEARCH_PATHS and LIBRARY_SEARCH_PATHS
  - You can check the version installed by running: ```ls /usr/local/Cellar/llvm```
- Go to Project > Info > Under "Configurations" select Config for debug and release

![Screenshot of configurations](https://github.com/DanielCarns/openmp-xcode-config/blob/master/adding-config.png?raw=true)

# Step 3 - Add libomp to Embedded Binaries
- Targets > Build Phases > Link with binaries and libraries
- Select libomp.dylib which the script placed in your project directory

![Screenshot of libraries](https://github.com/DanielCarns/openmp-xcode-config/blob/master/adding-library.png?raw=true)

