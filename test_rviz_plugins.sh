echo "=== RViz2 插件测试 ==="

# 检查基本环境
echo "1. 检查 ROS2 环境"
echo "ROS_DISTRO: $ROS_DISTRO"
echo "RMW_IMPLEMENTATION: $RMW_IMPLEMENTATION"

# 检查插件文件
echo -e "\n2. 检查插件文件"
find /opt/ros/foxy -name "*plugin*description*" -o -name "*plugins.xml" 2>/dev/null | while read file; do
    if grep -q "Time" "$file" 2>/dev/null; then
        echo "找到 Time 插件声明: $file"
        grep -A2 -B2 "Time" "$file"
    fi
done

# 检查库文件
echo -e "\n3. 检查插件库"
find /opt/ros/foxy -name "*.so" | xargs -I {} sh -c 'ldd {} 2>/dev/null | grep -q "not found" && echo "缺失依赖: {}"' | head -5

echo -e "\n4. 尝试启动 RViz2（5秒超时）"
timeout 5s ros2 run rviz2 rviz2 || echo "RViz2 启动失败"

EOF