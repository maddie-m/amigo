#!/bin/bash

#################################################################
# This bash script sets up ns-3 and configures amigo specific
# build options and scripts
#################################################################


git clone https://gitlab.com/nsnam/ns-3-dev.git "$NS3_FOLDER"
cd "$NS3_FOLDER"

echo "Cleaning..."
./ns3 clean

echo "Configuring..."
./ns3 configure --enable-examples --enable-test

echo "Building..."
./ns3 build

echo "Done building ns-3! Adding amigo specific build configurations..."
cp $NS3_FOLDER/../protest/arp/arp-cache.cc $NS3_FOLDER/src/internet/model/arp-cache.cc
cp $NS3_FOLDER/../protest/routing/normal-50000.cpp $NS3_FOLDER/scratch/normal-50000.cc
cp $NS3_FOLDER/../protest/routing/normal-500000.cpp $NS3_FOLDER/scratch/normal-500000.cc
cp $NS3_FOLDER/../protest/routing/normal-5000000.cpp $NS3_FOLDER/scratch/normal-5000000.cc
cp $NS3_FOLDER/../protest/routing/digest-50000.cpp $NS3_FOLDER/scratch/digest-50000.cc
cp $NS3_FOLDER/../protest/routing/digest-500000.cpp $NS3_FOLDER/scratch/digest-500000.cc
cp $NS3_FOLDER/../protest/routing/digest-5000000.cpp $NS3_FOLDER/scratch/digest-5000000.cc
cp $NS3_FOLDER/../protest/routing/dynamic-50000.cpp $NS3_FOLDER/scratch/dynamic-50000.cc
cp $NS3_FOLDER/../protest/routing/dynamic-500000.cpp $NS3_FOLDER/scratch/dynamic-500000.cc
cp $NS3_FOLDER/../protest/routing/dynamic-5000000.cpp $NS3_FOLDER/scratch/dynamic-5000000.cc
cp $NS3_FOLDER/../protest/routing/static-50000.cpp $NS3_FOLDER/scratch/static-50000.cc
cp $NS3_FOLDER/../protest/routing/static-500000.cpp $NS3_FOLDER/scratch/static-500000.cc
cp $NS3_FOLDER/../protest/routing/static-5000000.cpp $NS3_FOLDER/scratch/static-5000000.cc

echo "Building..."
./ns3 build

echo "Amigo build done!"
