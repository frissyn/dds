export TARGET_FILE = app.cr
export TARGET_OUTPUT = ./bin/app
export SOURCE_FILES = $(shell find . -name '*.cr')

.PHONY: run
run: $(TARGET_OUTPUT)
	$(TARGET_OUTPUT)

$(TARGET_OUTPUT): $(SOURCE_FILES)
	crystal build --no-debug --progress $(TARGET_FILE) -o $(TARGET_OUTPUT)
