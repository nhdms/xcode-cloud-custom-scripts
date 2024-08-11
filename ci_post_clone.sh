#!/bin/zsh

echo "===== Installling CocoaPods ====="
export HOMEBREW_NO_INSTALL_CLEANUP=TRUE
brew install cocoapods

echo "===== Installing Node.js ====="
brew install node@18

echo 'export PATH="/usr/local/opt/node@18/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="$PATH:/opt/homebrew/bin"' >> ~/.zshrc
echo 'export NODE_BINARY=node' >> ~/.zshrc
source ~/.zshrc

cd $CI_PRIMARY_REPOSITORY_PATH
echo "===== Installing yarn ====="
brew install yarn

# Install dependencies
echo "===== Running yarn install ====="
yarn install

echo "===== Running pod install ====="
cd ios
pod install
