MousePaw Media Build System
========================================

This repository exists to demonstrate the MousePaw Media Build System,
a hybrid technique which combines CMake and Makefiles to reliably standardize
and automate builds across multiple projects.

If you wish to use our build system in your own project, you will need to
copy the following files:

* build_system/build.cmake
* build_system/inner.mk
* build_system/outer.mk
* build_system/templates/ (these are templates for CMakeLists.txt and Makefile)
* sandbox-source/Makefile
* sandbox-source/CMakeLists.txt
* sandbox-tester/Makefile
* sandbox-tester/CMakeLists.txt
* Makefile
* default.config
* build.config.txt

Modify these files to your purposes. Look especially for CHANGE comments,
in CMakeLists.txt and Makefile.

The repository models a three-folder structure, with a static library in
'sandbox-source/', an executable using that library in 'sandbox-tester/',
and Sphinx documentation in 'docs/' (not present here).

Authors
----------------------------------------

* Jason C. McDonald

Dependencies
----------------------------------------

Because this repository exists both to validate our build system (and any
CI/CD pipelines using it), and as a testing ground for our developers,
it links to every single library we use at MousePaw Media.

* CPFG (provided by our libdeps repository)
* eventpp (provided by our libdeps repository)
* Eigen (provided by our libdeps repository)
* Opus (provided by our libdeps repository)
* Arctic Tern
* Goldilocks
* IOSqueak
* Nimbly
* Onestring
* SIMPLEXpress

Building
----------------------------------------

On UNIX systems, just run 'make tester_debug' or 'make tester'.

Contributions
----------------------------------------

We do NOT accept pull requests through GitHub.
If you would like to contribute code, please read our
[Contribution Guide](https://mousepawmedia.com/developers/contribution).

All contributions are licensed to us under the
[MousePaw Media Terms of Development](https://mousepawmedia.com/termsofdevelopment).

License
----------------------------------------

The MousePaw Media Build System is licensed under the BSD-3 License. (See LICENSE.md)

The project is owned and maintained by [MousePaw Media](https://mousepawmedia.com/developers).

<img src=docs/source/mousepaw_logo_circle.svg width=200vw/>
