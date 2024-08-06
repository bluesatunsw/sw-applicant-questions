# Bluesat software interviews makefile template
# Matt Rossouw 2024

CXX = clang++
CXXFLAGS = -std=c++17 -Wall -Wextra -Ofast

BUILD_DIR = build
SRC_DIR = src

# Specify the source files
SRC = $(SRC_DIR)/(insert file names here)
# Specify the header files
INCLUDE = $(SRC_DIR)/(insert file names here)
# Create the object files list
OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRC))

OUT = aes

all: $(BUILD_DIR)/$(OUT)

$(BUILD_DIR)/$(OUT): $(OBJS)
	$(CXX) -o $@ $(OBJS)

# Pattern rule for object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp $(INCLUDE)
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean
.DEFAULT: all