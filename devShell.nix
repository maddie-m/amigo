{ pkgs, ... }:
pkgs.mkShell {

  # Add build dependencies

  packages = [
    pkgs.python3
    pkgs.python3Packages.numpy
    pkgs.python3Packages.matplotlib
    pkgs.python3Packages.scipy
    pkgs.python3Packages.pandas
    pkgs.cmake
    pkgs.wget
    pkgs.libgcc
  ];

  # Add environment variables
  env = { };

  # Load custom bash code
  shellHook = ''
    shell_dir="$PWD"
    export NS3_FOLDER="$shell_dir/Routing_Simulations/amigo-docker/ns3"
  '';
}
