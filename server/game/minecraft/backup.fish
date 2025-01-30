#!/usr/bin/env fish

# 確保使用者提供了世界名稱參數
if test (count $argv) -lt 1
    echo "❌ 錯誤: 請提供 Minecraft 世界名稱"
    echo "📌 用法: ./backup_mc.fish <世界名稱>"
    exit 1
end

# 取得第一個參數作為世界名稱
set world_name $argv[1]

# 檢查目錄是否存在
if not test -d $world_name
    echo "❌ 錯誤: 目錄 '$world_name' 不存在"
    exit 1
end

# 產生時間戳記
set timestamp (date "+%Y-%m-%d_%H-%M-%S")

# 執行 tar+zstd 壓縮備份
echo "🔄 開始備份 $world_name..."
tar -cf - $world_name | zstd -19 --threads=8 -o $world_name-$timestamp.tar.zst

# 顯示結果
if test $status -eq 0
    echo "✅ 備份完成: $world_name-$timestamp.tar.zst"
else
    echo "❌ 備份失敗"
    exit 1
end
