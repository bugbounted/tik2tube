FROM mcr.microsoft.com/playwright:v1.23.0-focal

RUN apt update
RUN apt install ffmpeg libsm6 libxext6  -y
RUN apt install python3-pip -y

RUN mkdir /app
ADD . /app
WORKDIR /app

RUN pip install --upgrade pip
RUN pip install playwright
RUN playwright install
RUN pip install TikTokApi
RUN pip install --upgrade google-api-python-client
RUN pip install --upgrade google-auth-oauthlib google-auth-httplib2

CMD ["python3", "main.py"]
