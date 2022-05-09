# Patched Tensorflow v1.15.5 Docker Image (Unsigned NVIDIA `compose/cuda` Public Key)

The key for NVIDIA's cuda repository was changed recently and Tensorflow are no longer building/updating the 1.15.5 image (which I need for my PhD).

Repository simple adds the key, runs an `apt update` to verify it all works fine then pushes the image to dockerhub.

GitHub Actions error logs in case someone else searches for the problem:
```
#8 [base 4/9] RUN apt update  && apt install -y 	git 	curl 	wget 	software-properties-common 	libsndfile1 	sox 	libsox-dev 	swig 	nano 	sudo 	python3 	llvm-8* 	parallel  && apt clean  && rm -rf /var/lib/apt/lists/*  && apt autoremove -yqq
#0 0.058 
#0 0.058 WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
#0 0.058 
#8 0.195 Get:1 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  InRelease [1575 B]
#8 0.246 Ign:2 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  InRelease
#8 0.261 Get:3 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  Release [564 B]
#8 0.275 Get:4 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  Release.gpg [833 B]
#8 0.317 Err:1 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  InRelease
#8 0.317   The following signatures couldn't be verified because the public key is not available: NO_PUBKEY A4B469963BF863CC
#8 0.335 Get:5 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
#8 0.346 Hit:6 http://archive.ubuntu.com/ubuntu bionic InRelease
#8 0.427 Get:7 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  Packages [73.8 kB]
#8 0.453 Get:8 http://archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]
#8 0.840 Get:9 http://security.ubuntu.com/ubuntu bionic-security/main amd64 Packages [2734 kB]
#8 0.859 Get:10 http://archive.ubuntu.com/ubuntu bionic-backports InRelease [74.6 kB]
#8 1.038 Get:11 http://archive.ubuntu.com/ubuntu bionic-updates/multiverse amd64 Packages [29.8 kB]
#8 1.062 Get:12 http://archive.ubuntu.com/ubuntu bionic-updates/universe amd64 Packages [2272 kB]
#8 1.488 Get:13 http://security.ubuntu.com/ubuntu bionic-security/universe amd64 Packages [1498 kB]
#8 1.528 Get:14 http://security.ubuntu.com/ubuntu bionic-security/multiverse amd64 Packages [21.1 kB]
#8 1.529 Get:15 http://security.ubuntu.com/ubuntu bionic-security/restricted amd64 Packages [909 kB]
#8 1.556 Get:16 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 Packages [3168 kB]
#8 1.691 Get:17 http://archive.ubuntu.com/ubuntu bionic-updates/restricted amd64 Packages [942 kB]
#8 1.721 Get:18 http://archive.ubuntu.com/ubuntu bionic-backports/main amd64 Packages [12.2 kB]
#8 1.722 Get:19 http://archive.ubuntu.com/ubuntu bionic-backports/universe amd64 Packages [12.9 kB]
#8 2.259 Reading package lists...
#8 3.352 W: GPG error: https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY A4B469963BF863CC
#8 3.352 E: The repository 'https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  InRelease' is no longer signed.
#8 ERROR: process "/bin/bash -c apt update  && apt install -y \tgit \tcurl \twget \tsoftware-properties-common \tlibsndfile1 \tsox \tlibsox-dev \tswig \tnano \tsudo \tpython3 \tllvm-8* \tparallel  && apt clean  && rm -rf /var/lib/apt/lists/*  && apt autoremove -yqq" did not complete successfully: exit code: 100
------
 > [base 4/9] RUN apt update  && apt install -y 	git 	curl 	wget 	software-properties-common 	libsndfile1 	sox 	libsox-dev 	swig 	nano 	sudo 	python3 	llvm-8* 	parallel  && apt clean  && rm -rf /var/lib/apt/lists/*  && apt autoremove -yqq:
#8 1.488 Get:13 http://security.ubuntu.com/ubuntu bionic-security/universe amd64 Packages [1498 kB]
#8 1.528 Get:14 http://security.ubuntu.com/ubuntu bionic-security/multiverse amd64 Packages [21.1 kB]
#8 1.529 Get:15 http://security.ubuntu.com/ubuntu bionic-security/restricted amd64 Packages [909 kB]
#8 1.556 Get:16 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 Packages [3168 kB]
#8 1.691 Get:17 http://archive.ubuntu.com/ubuntu bionic-updates/restricted amd64 Packages [942 kB]
#8 1.721 Get:18 http://archive.ubuntu.com/ubuntu bionic-backports/main amd64 Packages [12.2 kB]
#8 1.722 Get:19 http://archive.ubuntu.com/ubuntu bionic-backports/universe amd64 Packages [12.9 kB]

#8 3.352 W: GPG error: https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY A4B469963BF863CC
#8 3.352 E: The repository 'https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  InRelease' is no longer signed.
```
