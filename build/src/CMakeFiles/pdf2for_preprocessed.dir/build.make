# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.0

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/gerhard/DocuMatrix/pdf2for/build

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/gerhard/DocuMatrix/pdf2for/build

# Utility rule file for pdf2for_preprocessed.

# Include the progress variables for this target.
include src/CMakeFiles/pdf2for_preprocessed.dir/progress.make

src/CMakeFiles/pdf2for_preprocessed: src/pdf2for.vala

src/pdf2for.vala:
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gerhard/DocuMatrix/pdf2for/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating pdf2for.vala"
	cd /home/gerhard/DocuMatrix/pdf2for/build/src && perl /home/gerhard/DocuMatrix/pdf2for/build/src/ ../log/messages.mdb pdf2for

pdf2for_preprocessed: src/CMakeFiles/pdf2for_preprocessed
pdf2for_preprocessed: src/pdf2for.vala
pdf2for_preprocessed: src/CMakeFiles/pdf2for_preprocessed.dir/build.make
.PHONY : pdf2for_preprocessed

# Rule to build all files generated by this target.
src/CMakeFiles/pdf2for_preprocessed.dir/build: pdf2for_preprocessed
.PHONY : src/CMakeFiles/pdf2for_preprocessed.dir/build

src/CMakeFiles/pdf2for_preprocessed.dir/clean:
	cd /home/gerhard/DocuMatrix/pdf2for/build/src && $(CMAKE_COMMAND) -P CMakeFiles/pdf2for_preprocessed.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/pdf2for_preprocessed.dir/clean

src/CMakeFiles/pdf2for_preprocessed.dir/depend:
	cd /home/gerhard/DocuMatrix/pdf2for/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gerhard/DocuMatrix/pdf2for/build /home/gerhard/DocuMatrix/pdf2for/build/src /home/gerhard/DocuMatrix/pdf2for/build /home/gerhard/DocuMatrix/pdf2for/build/src /home/gerhard/DocuMatrix/pdf2for/build/src/CMakeFiles/pdf2for_preprocessed.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/pdf2for_preprocessed.dir/depend

