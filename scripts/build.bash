#!/usr/bin/env bash
set -eu

if [ $# -eq 0 ]; then
	echo "target none, exit"
	exit 1
fi

cd $(dirname $0)
script_dir=$PWD
prefix=$HOME/.local

targets=("vim" "go" "tmux" "gdb-dashboard" "opencv" "ctags" "pdfgrep" "rustinstant" "peep" "librealsense")

build_vim() {
	echo "build vim..."
	cd vim/
	make distclean
	./configure --prefix="${prefix}" \
		--disable-darwin \
		--disable-smack \
		--disable-selinux \
		--enable-FEATURE \
		--enable-luainterp=yes \
		--enable-mzschemeinterp \
		--enable-perlinterp=yes \
		--enable-pythoninterp=yes \
		--enable-python3interp=yes \
		--enable-tclinterp=yes \
		--enable-rubyinterp=yes \
		--enable-cscope \
		--enable-multibyte \
		--enable-xim \
		--enable-fontset \
		--enable-gui=no \
		--enable-terminal \
		--with-local-dir="${prefix}" \
		--with-features=huge \
		--with-lua-prefix=/usr \
		--with-ruby-command=ruby \
		cd src
	make
	make install
	cd "${script_dir}"
}

build_go() {
	echo "build go..."
	export GOROOT_BOOTSTRAP=${script_dir}/go1.4-bootstrap
	cd go/src
	./all.bash
	cd "${script_dir}"
}

build_gdb-dashboard() {
	echo "build gdb-dashboard..."
	cp gdb-dashboard/.gdbinit ~/
	# for embedded-rust. refs: http://blog.japaric.io/quickstart/
	echo 'set auto-load safe-path /' >> ~/.gdbinit
	cd "${script_dir}"
}

build_opencv() {
	echo "build opencv..."
	cd opencv/opencv/
	install -d _build && cd _build
	cmake -D CMAKE_BUILD_TYPE=RELEASE \
		-D CMAKE_INSTALL_PREFIX="${prefix}" \
		-D INSTALL_PYTHON_EXAMPLES=ON \
		-D OPENCV_EXTRA_MODULES_PATH=../../contrib/modules \
		-D BUILD_opencv_python3=ON \
		-D BUILD_EXAMPLES=ON ..
	make -j2
	make install
	sudo ldconfig
	cd "${script_dir}"
}

build_ctags() {
	echo "build universal-ctags..."
	cd ctags/
	./autogen.sh
	./configure --prefix="${prefix}"
	make
	make install
	cd "${script_dir}"
}

build_pdfgrep() {
	echo "build pdfgrep..."
	ln -fs "${script_dir}"/pdfgrep/pdfgrep.sh "${prefix}"/bin/pdfgrep
	chmod a+x "${prefix}"/bin/pdfgrep
}

build_rustinstant() {
	echo "build rustinstant..."
	ln -fs "${script_dir}"/rustinstant/rustinstant.sh "${prefix}"/bin/rustinstant
	chmod a+x "${prefix}"/bin/rustinstant
}

build_peep() {
	echo "build peep..."
	cd peep/
	cargo build --release
	ln -fs "${script_dir}"/peep/target/release/peep "${prefix}"/bin/peep
	cd "${script_dir}"
}

build_librealsense() {
	echo "build librealsense..."
	cd librealsense/
	install -d _build && cd _build
	cmake .. \
        -D BUILT_EXAMPLES=ture \
        -D CMAKE_BUILD_TYPE=Release \
		-D CMAKE_INSTALL_PREFIX="${prefix}"
    make uninstall
    make clean
    make -j8
    make install
	cd "${script_dir}"
}

for argv in "$@"; do
    for target in "${targets[@]}"; do
        if [ "${argv%/}" == "${target}" ]; then
            eval "build_${target}"
            break
        fi
    done
done

