FROM python:3.11.4-slim-bullseye

RUN apt update && \
    apt upgrade -y && \
    apt install -y --no-install-recommends pulseaudio portaudio19-dev build-essential gcc libgl1 git alsa-utils tk python3-opencv && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/ditto-assistant/ditto-stack.git && cd ditto-stack && git clone https://github.com/ditto-assistant/assistant.git && git clone https://github.com/ditto-assistant/nlp_server.git && git clone https://github.com/ditto-assistant/vision_server.git && cd assistant/modules && git clone https://github.com/omarzanji/ditto_activation.git && git clone https://github.com/omarzanji/gesture-recognition.git && cd ../../../

COPY .env ./ditto-stack/.env
COPY assistant/resources ./ditto-stack/assistant/resources
COPY requirements.txt ./requirements.txt
COPY users.json ./ditto-stack/users.json
COPY main.sh ./ditto-stack/main.sh
COPY assistant.sh ./ditto-stack/assistant.sh
COPY nlp_server.sh ./ditto-stack/nlp_server.sh
# COPY vision_server.sh ./ditto-stack/vision_server.sh

RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt 

EXPOSE 42032
EXPOSE 42031
EXPOSE 42030

CMD cd ditto-stack && ./main.sh