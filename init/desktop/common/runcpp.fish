#!/usr/bin/env fish

# 檢查是否提供 C++ 檔案
if test (count $argv) -ne 1
    echo "使用方式: $argv[0] <C++ 檔案>"
    exit 1
end

set SOURCE_FILE $argv[1]

# 確保檔案存在
if not test -f $SOURCE_FILE
    echo "錯誤: 檔案 $SOURCE_FILE 不存在"
    exit 1
end

# 判斷作業系統
set OS (uname)
if test "$OS" = "Darwin"
    # macOS: 使用 mktemp 建立暫存檔
    set EXECUTABLE (mktemp -t tmp_cpp_exec)
else
    # Linux: 使用 /dev/shm 來存放執行檔
    set EXECUTABLE "/dev/shm/tmp_cpp_exec"
end

# 使用 clang++ 編譯並執行 (記憶體內編譯，無硬碟存取)
clang++ -x c++ $SOURCE_FILE -o $EXECUTABLE -pipe -std=c++20 && $EXECUTABLE

# 清除記憶體中的執行檔 (確保不留垃圾)
rm -f $EXECUTABLE
