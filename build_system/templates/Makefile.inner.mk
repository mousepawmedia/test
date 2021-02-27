# Inner Makefile (MousePaw Media Build System)
# Version: 3.2.0

######################
# USAGE INSTRUCTIONS
# This is for building within a single directory
# (library and executable). If you only build an executable, use
# Makefile.inner.mk instead.
#
# 1. Place in top-level directory. Expects for library and executable
#    source to reside in separate second-level directories.
# 2. Customize the values below to suit your purposes.
# 3. Rename this file to 'Makefile'
# 4. Delete these instructions in your final file.
######################

# CHANGE: Project name
NAME = "Sandbox (Static Library)"

# CHANGE: Set to 'lib' or 'bin'
BUILD_DIR = lib

# Includes inner makefile logic. (Change if necessary to point to inner.mk)
include ../build_system/inner.mk
