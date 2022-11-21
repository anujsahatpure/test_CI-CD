FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get install -y npm
ADD ./* $HOME/
RUN ls $HOME/
COPY . .
COPY package*.json ./
RUN npm run build
RUN apt-get install -y wget
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install -y ./google-chrome-stable_current_amd64.deb
RUN npm install cypress
RUN apt-get install -y libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb 