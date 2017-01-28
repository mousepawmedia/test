none: help

help:
	@echo "=== Sandbox ==="
	@echo "Select a build target:"
	@echo "  make debug"
	@echo "  make release"
	@echo
	@echo "  make clean"
	@echo "  make cleandebug"
	@echo "  make cleanrelease"
	@echo
	@echo "Clang Sanitizers (requires Debug build and Clang.)"
	@echo "  SAN=address     Use AddressSanitizer"
	@echo "  SAN=leak        Use LeakSanitizer w/o AddressSanitizer (Linux only)"
	@echo "  SAN=memory      Use MemorySanitizer"
	@echo "  SAN=thread      Use ThreadSanitizer"
	@echo "  SAN=undefined   Use UndefiniedBehaviorSanitizer"
	@echo
	@echo "Optional Architecture"
	@echo "  ARCH=32         Make x86 build (-m32)"
	@echo "  ARCH=64         Make x64 build (-m64)"
	@echo
	@echo "Use Configuration File"
	@echo "  CONFIG=foo      Uses the configuration file 'foo.config'"
	@echo "                  in the root of this repository."
	@echo "  When unspecified, default.config will be used."
	@echo
	@echo "For other build options, see the 'make' command in 'sandbox/'"

clean:
	$(MAKE) clean -C sandbox-source

cleandebug:
	$(MAKE) cleandebug -C sandbox-source

cleanrelease:
	$(MAKE) cleanrelease -C sandbox-source

debug:
	$(MAKE) debug ARCH=$(ARCH) SAN=$(SAN) CONFIG=$(CONFIG) -C sandbox-source
	@rm -f sandbox_debug
	@ln -s sandbox-source/bin/Debug/sandbox sandbox_debug
	@echo "-------------"
	@echo "<<<<<<< FINISHED >>>>>>>"
	@echo "Sandbox is in 'sandbox/bin/Debug'."
	@echo "The link './sandbox_debug' has been created for convenience."
	@echo "-------------"

release:
	$(MAKE) release ARCH=$(ARCH) CONFIG=$(CONFIG) -C sandbox-source
	@rm -f sandbox
	@ln -s sandbox-source/bin/Release/sandbox sandbox
	@echo "-------------"
	@echo "<<<<<<< FINISHED >>>>>>>"
	@echo "Sandbox is in 'sandbox/bin/Release'."
	@echo "The link './sandbox' has been created for convenience."
	@echo "-------------"

.PHONY: clean cleandebug cleanrelease help
