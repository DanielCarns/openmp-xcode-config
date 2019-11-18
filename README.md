# openmp-xcode-config
This contains an xcconfig file which allows the OpenMP API to be used in Xcode. There is also a bash script with instructions on how to add the necessary libiomp.dylib to your OMP Xcode project.

# Attention
- If you haven't already installed brew, go ahead and do so by using this command:

```/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"```

# Step 1 - Add Build Configuration File
- Create your XCode project then add the build configuration file.
- File > Add files to "Your Project"
- Select and add OMPConfig.xcconfig to your project.


# Step 2 - Run Helper Script
The purpose of this script is to: 
- Check if llvm is installed 
- Copy the libomp.dylib into your project for you to spare you the manual searching.

## Usage: 
- Drag the script to the top level of your project file and run it there.
- If llvm is not already installed on your machine, this script will give you the option of installing it.
- Once this is finished, the libiomp.dylib file will be copied into your project.

# Step 3 - Add libiomp to Embedded Binaries


