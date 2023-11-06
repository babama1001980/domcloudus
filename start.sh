#!/bin/bash

# 安装 Node.js 依赖
npm install

# 启动 Node.js 应用
nohup node app.js > /dev/null 2>&1 &

# 这里可以添加其他自定义的脚本命令

# 保持脚本可执行
chmod +x start.sh
