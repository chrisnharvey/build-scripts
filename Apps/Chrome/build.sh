#!/bin/bash

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O chrome.deb

dpkg-deb -R ./chrome.deb ./build


