.PHONY: deqp.js
deqp.js:
	make -C deqp-web-harness/ build
	cp deqp-web-harness/src/index.html .
	cp deqp-web-harness/build/deqp.{js,data,wasm} .
	echo -n "${shell git --git-dir .git/modules/deqp-web-harness/ describe --always --dirty} " > build.txt
	cmake -L deqp-web-harness/build/ | grep CMAKE_BUILD_TYPE | cut -f2 -d= >> build.txt
	date -u +'%Y-%m-%d %H:%M:%SZ' >> build.txt
