BitcoinNickel Core
=============

Setup
---------------------
BitcoinNickel Core is the original BitcoinNickel client and it builds the backbone of the network. It downloads and, by default, stores the entire history of BitcoinNickel transactions; depending on the speed of your computer and network connection, the synchronization process can take anywhere from a few hours to a day or more.


Running
---------------------
The following are some helpful notes on how to run BitcoinNickel Core on your native platform.

All steps are to be run from your terminal emulator, i.e. the command line.

    Ensure the dependencies are installed:

        Linux: sudo apt-get install build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 libssl-dev libevent-dev libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev libminiupnpc-dev libzmq3-dev libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler git ccache

        macOS (with command line tools and Homebrew already installed): brew install automake berkeley-db4 libtool boost miniupnpc openssl pkg-config protobuf python qt libevent qrencode ccache

    Download the BitcoinNickel source files by git cloning the repository:
        git clone https://github.com/bitcoinNickel/bitcoinnickel.git

    Install Berkeley DB (BDB) v4.8, a backward-compatible version needed for the wallet, using the script in /contrib:
        Enter your local copy of the BitcoinNickel repository: cd bitcoinnickel
        Now that you are in the root of the bitcoinnickel repository, run ./contrib/install_db4.sh `pwd`
        Take note of the instructions displayed in the terminal at the end of the BDB installation process:

      db4 build complete.

      When compiling bitcoinnickeld, run `./configure` in the following way:

      export BDB_PREFIX='<PATH-TO>/db4'

      ./configure BDB_LIBS="-L${BDB_PREFIX}/lib -ldb_cxx-4.8" BDB_CFLAGS="-I${BDB_PREFIX}/include" ...

    Compile from a tagged release branch instead of master, unless you want to test the bleeding edge:
        git tag -n | sort -V to see tags and descriptions ordered by most recent last
        git checkout <TAG> to use a tagged release, for example: git checkout v0.0.0.1

    Compile BitcoinNickel from source:
        ./autogen.sh
        export BDB_PREFIX='<PATH-TO>/db4' (you can use the output from the BDB build above)
        ./configure BDB_LIBS="-L${BDB_PREFIX}/lib -ldb_cxx-4.8" BDB_CFLAGS="-I${BDB_PREFIX}/include"
        make, or if you have multiple threads on your machine, you can tell make to use all of them and reduce compile time significantly with
        make -j"$(($(nproc)+1))" on Linux, or
        make -j"$(($(sysctl -n hw.physicalcpu)+1))" on macOS

    You can run ./configure --help to see the various configuration options.

    If you build frequently from source (e.g. for testing pull requests), as long as you don't need to change the configuration options you can skip directly to the make step for subsequent builds.

    Be sure to use ccache to speed up your builds. You can also gain time by building only what you need. See the BitcoinNickel Core productivity notes for more.

    Run the unit tests:
        make check, or
        make -j"$(($(nproc)+1))" check to use multithreading on Linux, or
        make -j"$(($(sysctl -n hw.physicalcpu)+1))" check on macOS

    Run the functional tests. From the repository root:
        test/functional/test_runner.py to run the standard test suite
        test/functional/test_runner.py --extended to run the extended test suite
        test/functional/test_runner.py --help to see the various options for running tests


### Unix

Unpack the files into a directory and run:

- `bin/bitcoinnickel-qt` (GUI) or
- `bin/bitcoinnickeld` (headless)

### Windows

Unpack the files into a directory, and then run bitcoinnickel-qt.exe.

### macOS

Drag BitcoinNickel Core to your applications folder, and then run BitcoinNickel Core.

### Need Help?

* See the documentation at the [BitcoinNickel Wiki](https://en.bitcoinnickel.it/wiki/Main_Page)
for help and more information.
* Ask for help on [#bitcoinnickel](http://webchat.freenode.net?channels=bitcoinnickel) on Freenode. If you don't have an IRC client use [webchat here](http://webchat.freenode.net?channels=bitcoinnickel).
* Ask for help on the [BitcoinNickelTalk](https://bitcoinnickeltalk.org/) forums, in the [Technical Support board](https://bitcoinnickeltalk.org/index.php?board=4.0).

Building
---------------------
The following are developer notes on how to build BitcoinNickel Core on your native platform. They are not complete guides, but include notes on the necessary libraries, compile flags, etc.

- [Dependencies](doc/dependencies.md)
- [macOS Build Notes](doc/build-osx.md)
- [Unix Build Notes](doc/build-unix.md)
- [Windows Build Notes](doc/build-windows.md)
- [OpenBSD Build Notes](doc/build-openbsd.md)
- [NetBSD Build Notes](doc/build-netbsd.md)
- [Gitian Building Guide](doc/gitian-building.md)

Development
---------------------
The BitcoinNickel repo's [root README](/README.md) contains relevant information on the development process and automated testing.

- [Developer Notes](doc/developer-notes.md)
- [Release Notes](doc/release-notes.md)
- [Release Process](doc/release-process.md)
- [Source Code Documentation (External Link)](https://dev.visucore.com/bitcoinnickel/doxygen/)
- [Translation Process](doc/translation_process.md)
- [Translation Strings Policy](doc/translation_strings_policy.md)
- [Travis CI](doc/travis-ci.md)
- [Unauthenticated REST Interface](doc/REST-interface.md)
- [Shared Libraries](doc/shared-libraries.md)
- [BIPS](doc/bips.md)
- [Dnsseed Policy](doc/dnsseed-policy.md)
- [Benchmarking](doc/benchmarking.md)

### Resources
* Discuss on the [BitcoinNickelTalk](https://bitcoinnickeltalk.org/) forums, in the [Development & Technical Discussion board](https://bitcoinnickeltalk.org/index.php?board=6.0).
* Discuss project-specific development on #bitcoinnickel-core-dev on Freenode. If you don't have an IRC client use [webchat here](http://webchat.freenode.net/?channels=bitcoinnickel-core-dev).
* Discuss general BitcoinNickel development on #bitcoinnickel-dev on Freenode. If you don't have an IRC client use [webchat here](http://webchat.freenode.net/?channels=bitcoinnickel-dev).

### Miscellaneous
- [Assets Attribution](doc/assets-attribution.md)
- [Files](doc/files.md)
- [Fuzz-testing](doc/fuzzing.md)
- [Reduce Traffic](doc/reduce-traffic.md)
- [Tor Support](doc/tor.md)
- [Init Scripts (systemd/upstart/openrc)](doc/init.md)
- [ZMQ](doc/zmq.md)

License
---------------------
Distributed under the [MIT software license](/COPYING).
This product includes software developed by the OpenSSL Project for use in the [OpenSSL Toolkit](https://www.openssl.org/). This product includes
cryptographic software written by Eric Young ([eay@cryptsoft.com](mailto:eay@cryptsoft.com)), and UPnP software written by Thomas Bernard.
