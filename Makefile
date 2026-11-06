CC      := gcc
CSTD    := -std=c11
WARN    := -Wall -Wextra -Wpedantic -Werror
CFLAGS  := $(CSTD) $(WARN) -Iinclude
LDFLAGS :=

BUILD_DIR := build
BIN_DIR   := bin
COV_DIR   := coverage

SRC_DIR   := src
TEST_DIR  := tests

SRCS      := $(wildcard $(SRC_DIR)/*.c)
OBJS      := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRCS))

TEST_SRCS := $(wildcard $(TEST_DIR)/*.c)
TEST_OBJS := $(patsubst $(TEST_DIR)/%.c,$(BUILD_DIR)/test_%.o,$(TEST_SRCS))

# Production sources excluding the application entry point, linked into tests.
LIB_SRCS  := $(filter-out $(SRC_DIR)/main.c,$(SRCS))
LIB_OBJS  := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(LIB_SRCS))

APP       := $(BIN_DIR)/rvc
TEST_BIN  := $(BIN_DIR)/rvc_tests

.PHONY: all test coverage clean

all: $(APP)

$(APP): $(OBJS) | $(BIN_DIR)
ifeq ($(strip $(SRCS)),)
	@echo "No sources in $(SRC_DIR)/ yet — nothing to build."
else
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(LDFLAGS)
endif

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/test_%.o: $(TEST_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -I$(SRC_DIR) -c $< -o $@

test: $(TEST_BIN)
ifeq ($(strip $(TEST_SRCS)),)
	@echo "No tests in $(TEST_DIR)/ yet — nothing to run."
else
	./$(TEST_BIN)
endif

$(TEST_BIN): $(TEST_OBJS) $(LIB_OBJS) | $(BIN_DIR)
ifneq ($(strip $(TEST_SRCS)),)
	$(CC) $(CFLAGS) $(TEST_OBJS) $(LIB_OBJS) -o $@ $(LDFLAGS)
endif

coverage: clean
	$(MAKE) test CFLAGS="$(CFLAGS) --coverage -O0 -g" LDFLAGS="$(LDFLAGS) --coverage"
	mkdir -p $(COV_DIR)
	gcov -o $(BUILD_DIR) $(LIB_SRCS) > $(COV_DIR)/gcov.log
	@mv -f *.gcov $(COV_DIR)/ 2>/dev/null || true
	@echo "Coverage written to $(COV_DIR)/"

$(BUILD_DIR) $(BIN_DIR):
	mkdir -p $@

clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR) $(COV_DIR) *.gcov
