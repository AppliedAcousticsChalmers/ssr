#!/usr/bin/env bash

set -euo pipefail

if [ "$TRAVIS_OS_NAME" == "osx" ]; then
  # brew rightfully abandoned qt4
  # https://github.com/cartr/homebrew-qt4
  brew tap cartr/qt4
  brew tap-pin cartr/qt4
  brew install --c++11 \
    asio \
    autoconf \
    ecasound \
    fftw \
    jack \
    liblo \
    libsndfile \
    libxml2 \
    qt@4
  # using brew, it's not possible to install needed perl dependencies for
  # help2man (Locale::gettext), therefore best disabled for now
#    doxygen \
#    help2man \
fi

if [ "$TRAVIS_OS_NAME" == "linux" ]; then
  # autotools, automake, make are present in the trusty image
  sudo apt-get install -y \
    g++ \
    libasio-dev \
    libqt4-dev \
    libqt4-opengl-dev \
    libecasoundc-dev \
    doxygen \
    ecasound \
    libxml2-dev \
    libfftw3-dev \
    libsndfile1-dev \
    libjack-dev \
    libjack0 \
    help2man \
    jackd1 \
    pkg-config \
    libtool
  # force installation of gcc-6 if required
  if [ "${CC}" == "gcc-6" ]; then
    sudo apt-get install gcc-6 g++-6
  fi
  # force installation of gcc-7 if required
  if [ "${CC}" == "gcc-7" ]; then
    sudo apt-get install gcc-7 g++-7
  fi
  # force installation of clang-3.8 if required
  if [ "${CC}" == "clang-3.8" ]; then
    sudo apt-get install clang-3.8
  fi
fi

exit 0
