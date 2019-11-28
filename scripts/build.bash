#!/usr/bin/env bash
set -eu

if [ $# -eq 0 ]; then
	echo "target none, exit"
	exit 1
fi

cd $(dirname $0)
SCRIPT_DIR=$PWD
PREFIX=$HOME/.local

PROCESSORS="$(grep processor /proc/cpuinfo | wc -l)"
MAKE_JOBS_OPTION="-j${PROCESSORS}"

TARGETS=("vim" "go" "tmux" "gdb-dashboard" "opencv" "ctags" "pdfgrep" "rustinstant" "peep" "librealsense" "halide")

build_vim() {
	echo "build vim..."
	cd vim/
	make distclean
	./configure --prefix="${PREFIX}" \
		--disable-darwin \
		--disable-smack \
		--disable-selinux \
		--enable-FEATURE \
		--enable-luainterp=yes \
		--enable-mzschemeinterp \
		--enable-perlinterp=yes \
		--enable-pythoninterp=no \
		--enable-python3interp=yes \
		--enable-tclinterp=yes \
		--enable-rubyinterp=yes \
		--enable-cscope \
		--enable-multibyte \
		--enable-xim \
		--enable-fontset \
		--enable-gui=no \
		--enable-terminal \
		--with-local-dir="${PREFIX}" \
		--with-features=huge \
		--with-lua-prefix=/usr \
		--with-ruby-command=ruby \
		cd src
	make "${MAKE_JOBS_OPTION}"
	make install
	cd "${SCRIPT_DIR}"
}

build_go() {
	echo "build go..."
	export GOROOT_BOOTSTRAP=${SCRIPT_DIR}/go1.4-bootstrap
	cd go/src
	./all.bash
	cd "${SCRIPT_DIR}"
}

build_gdb-dashboard() {
	echo "build gdb-dashboard..."
	cp gdb-dashboard/.gdbinit ~/
	# for embedded-rust. refs: http://blog.japaric.io/quickstart/
	echo 'set auto-load safe-path /' >> ~/.gdbinit
	cd "${SCRIPT_DIR}"
}

build_opencv() {
	echo "build opencv..."
	cd opencv/opencv/
	install -d _build && cd _build
	cmake -D CMAKE_BUILD_TYPE=RELEASE \
		-D CMAKE_INSTALL_PREFIX="${PREFIX}" \
		-D INSTALL_PYTHON_EXAMPLES=ON \
		-D OPENCV_EXTRA_MODULES_PATH=../../contrib/modules \
		-D BUILD_opencv_python3=ON \
		-D BUILD_EXAMPLES=ON ..
	make "${MAKE_JOBS_OPTION}"
	make install
	sudo ldconfig
	cd "${SCRIPT_DIR}"
}

build_ctags() {
	echo "build universal-ctags..."
	cd ctags/
	./autogen.sh
	./configure --prefix="${PREFIX}"
	make
	make install
	cd "${SCRIPT_DIR}"
}

build_pdfgrep() {
	echo "build pdfgrep..."
	ln -fs "${SCRIPT_DIR}"/pdfgrep/pdfgrep.sh "${PREFIX}"/bin/pdfgrep
	chmod a+x "${PREFIX}"/bin/pdfgrep
}

build_rustinstant() {
	echo "build rustinstant..."
	ln -fs "${SCRIPT_DIR}"/rustinstant/rustinstant.sh "${PREFIX}"/bin/rustinstant
	chmod a+x "${PREFIX}"/bin/rustinstant
}

build_peep() {
	echo "build peep..."
	cd peep/
	cargo build --release
	ln -fs "${SCRIPT_DIR}"/peep/target/release/peep "${PREFIX}"/bin/peep
	cd "${SCRIPT_DIR}"
}

build_librealsense() {
	echo "build librealsense..."
	cd librealsense/
	install -d _build && cd _build
	cmake .. \
		-D BUILT_EXAMPLES=ture \
		-D CMAKE_BUILD_TYPE=Release \
		-D CMAKE_INSTALL_PREFIX="${PREFIX}"
	make uninstall
	make clean
	make "${MAKE_JOBS_OPTION}"
	make install
	cd "${SCRIPT_DIR}"
}

build_halide() {
	echo "build halide..."
	cd halide/
	install -d _build && cd _build
	cmake .. \
		-D LLVM_DIR=/usr/lib/cmake/llvm \
        -D CMAKE_EXPORT_COMPILE_COMMANDS=ON \
		-D CMAKE_INSTALL_PREFIX="${PREFIX}"
	#make uninstall
	make clean
	make "${MAKE_JOBS_OPTION}"
	#make install
	cd "${SCRIPT_DIR}"
}

for ARGV in "$@"; do
	for TARGET in "${TARGETS[@]}"; do
		if [ "${ARGV%/}" == "${TARGET}" ]; then
			eval "build_${TARGET}"
			break
		fi
	done
done

