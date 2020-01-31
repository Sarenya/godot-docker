ARG GODOT_VERSION=3.2

FROM ubuntu:16.04

RUN apt-get update && apt-get install --no-install-recommends -y curl p7zip-full python ca-certificates && rm -rf /var/lib/apt/lists/*

ARG GODOT_VERSION

RUN curl https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-stable_linux_headless.64.zip --output Godot.zip && \
	7za x -o. Godot.zip && rm -f Godot.zip && mv Godot_v${GODOT_VERSION}-stable_linux_headless.64 /usr/local/bin/godot

RUN mkdir -p /root/.local/share/godot/templates/${GODOT_VERSION}.stable

RUN curl https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-stable_export_templates.tpz --output templates.zip && \
	7za x -o. templates.zip && mv templates/* /root/.local/share/godot/templates/${GODOT_VERSION}.stable && \
	rm -f templates.zip && rm -rf templates