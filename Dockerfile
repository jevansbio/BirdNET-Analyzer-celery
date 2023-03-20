# Build from Python 3.8 slim
FROM python:3.9-slim

# Install required packages while keeping the image small
RUN apt-get update && apt-get install -y --no-install-recommends ffmpeg  && rm -rf /var/lib/apt/lists/*

# Install required Python packages
RUN pip3 install numpy scipy librosa bottle resampy

#celery libs
RUN pip3 install celery==5.2.7 redis==4.3.3 hiredis==2.0.0

# Install Tensforflow
RUN pip3 install tensorflow 

# Import all scripts
COPY . ./

# Add entry point to run the script
#ENTRYPOINT [ "python3" ]
#CMD [ "analyze.py" ]
