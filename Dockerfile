FROM python:3.11.4-slim-bullseye

RUN apt update && \
    apt upgrade -y && \
    apt install -y --no-install-recommends pulseaudio portaudio19-dev build-essential gcc\
    git alsa-utils tk python3-opencv nodejs npm libgl1-mesa-dev libglib2.0-0 && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/ditto-assistant/ditto-stack.git --recurse-submodules

COPY .env ./ditto-stack/.env
COPY assistant/resources ./ditto-stack/assistant/resources
COPY assistant/requirements.txt ./assistant_requirements.txt
COPY nlp_server/requirements.txt ./nlp_server_requirements.txt
COPY nlp_server/users.json ./ditto-stack/nlp_server/users.json
# COPY vision_server/requirements.txt ./vision_server_requirements.txt
COPY main.sh ./ditto-stack/main.sh
COPY assistant.sh ./ditto-stack/assistant.sh
COPY nlp_server.sh ./ditto-stack/nlp_server.sh
# COPY vision_server.sh ./ditto-stack/vision_server.sh

RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r assistant_requirements.txt && \
    pip install --no-cache-dir -r nlp_server_requirements.txt
    # pip install --no-cache-dir -r vision_server_requirements.txt

EXPOSE 42032
EXPOSE 32032
EXPOSE 22032

# tried to enable coreaudio to make the mac container work
# ENV SDL_AUDIODRIVER coreaudio

CMD cd ditto-stack && ./main.sh