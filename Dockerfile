FROM ubuntu:18.04

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
	&& apt-get install -y \
	# For VSTSDK
		cmake gcc "libstdc++6" \
	# For VSTGUI
		libx11-xcb-dev \
		libxcb-util-dev \
		libxcb-cursor-dev \
		libxcb-xkb-dev \
		libxkbcommon-dev \
		libxkbcommon-x11-dev \
		libfontconfig1-dev \
		libcairo2-dev \
		libgtkmm-3.0-dev \
		libsqlite3-dev \
		libxcb-keysyms1-dev \
	# For Jack Audio
		libjack-jackd2-dev \
	# Optional
		git ninja-build meson \
	# Additional
		gosu

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
#CMD /usr/bin/bash
