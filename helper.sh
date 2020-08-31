#!/bin/bash

clear

#Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

#Paths
PROJECT_PATH=$(pwd)
libomp_path='' #path to where libiomp.dylib resides
llvm_version=''
llvm_path='/usr/local/Cellar/llvm'

confirm_llvm_install() {
    # call with a prompt string or use a default
    read -r -p "${1:-LLVM is not currently installed with brew, would you like to install it now? (y/n)} " response
    case "$response" in
        [yY][eE][sS]|[yY])
            true
            ;;
        *)
            false
            ;;
    esac
}

# Because the version of llvm will change over time, get the version this way
function set_paths {
    cd "$llvm_path"
    llvm_version="$(ls -d */)lib"
    libomp_path="$llvm_path/$llvm_version"
}

# Copy libiomp to the project folder
function copy_dylib_to_project {
    cd "$libomp_path"
    cp -v libomp.dylib "$PROJECT_PATH"
    cd "$PROJECT_PATH"
    printf "${GREEN} libiomp copied to project"
}

function check_if_llvm_installed {
    cd "/"

    INFO_OUTPUT="$(brew info llvm)"
    PATH_TO_LLVM="/usr/"
    searchString="/usr/"
    restOfPath=${INFO_OUTPUT#*$searchString}
    
    # takes the rest of the string from (brew info llvm) and assigns strings as arguments separated by spaces
    # this is the easy way to get the rest of the path so we can determine the version
    # this is used as an Xcode build setting in HEADER_SEARCH_PATHS and LIBRARY_SEARCH_PATHS
    
    notInstalled="Not installed"
    notInstalledSearchRes=${INFO_OUTPUT#*notInstalled}

    #if [ "$notInstalledSearchRes" == "$notInstalled" ]; then
    if [[ "$notInstalledSearchRes" == *"$notInstalled"* ]]; then
        # This will ask the user to confirm, if they do then it'll run brew install llvm
        confirm_llvm_install && brew install llvm
    fi
}

check_if_llvm_installed
set_paths
copy_dylib_to_project
