FROM python:3.11.4-slim-bullseye

RUN apt update && \
    apt upgrade -y && \
    apt install -y --no-install-recommends pulseaudio portaudio19-dev build-essential gcc git alsa-utils nodejs npm && \
    rm -rf /var/lib/apt/lists/*

COPY assistant/requirements.txt ./assistant_requirements.txt
COPY nlp_server/requirements.txt ./nlp_server_requirements.txt
COPY vision_server/requirements.txt ./vision_server_requirements.txt
COPY *.sh ./

RUN git clone https://github.com/ditto-assistant/ditto-stack.git --recurse-submodules

RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r assistant_requirements.txt && \
    pip install --no-cache-dir -r nlp_server_requirements.txt && \
    pip install --no-cache-dir -r vision_server_requirements.txt

EXPOSE 42032
EXPOSE 32032
EXPOSE 22032

# tried to enable coreaudio to make the mac container work
# ENV SDL_AUDIODRIVER coreaudio

CMD main.sh