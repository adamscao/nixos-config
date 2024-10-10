{ config, pkgs, lib, ... }:

# Recursively find all .nix files in the desktop directory and import them as modules
let
  # Function to find and import all .nix files in the current directory and subdirectories
  importModules = directory: 
    let
      nixFiles = builtins.filter (file: builtins.match ".*\\.nix$" file != null) (builtins.readDir directory);
    in
      map (file: import (directory + "/" + file) { inherit config pkgs lib; }) nixFiles;
in
{
  # Import all modules from the current directory and its subdirectories
  imports = importModules ./;
}
