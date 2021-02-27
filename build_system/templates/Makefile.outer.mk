# Outer Makefile (MousePaw Media Build System)
# Version: 3.2.0

######################
# USAGE INSTRUCTIONS
# This is for managing a two-part repository structure
# (library and executable). If you only build an executable, use
# Makefile.inner.mk instead.
#
# 1. Place in top-level directory. Expects for library and executable
#    source to reside in separate second-level directories.
# 2. Customize the values below to suit your purposes.
# 3. Rename this file to 'Makefile'
# 4. Delete these instructions in your final file.
######################

# CHANGE: Library name
LIB_PROJECT = Sandbox

# CHANGE: Executable name
EXE_PROJECT = Sandbox Tester

# CHANGE: Project base filenames
LIB_NAME = sandbox
EXE_NAME = $(LIB_NAME)-tester

# CHANGE: Target/alias name for executable (optional)
EXE_NICKNAME = tester

# CHANGE: Uncomment for header-only libraries.
#HEADER_ONLY = 1

# CHANGE: Library source directory
LIB_SRC = $(LIB_NAME)-source
# CHANGE: Executable source directory
EXE_SRC = $(EXE_NAME)

# CHANGE: Ready directory name
READY_DIR = $(LIB_NAME)

# Includes outer makefile logic. (Change if necessary to point to outer.mk)
include build_system/outer.mk
