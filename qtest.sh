echo "\033[32m Remote Hello! \033[0m"
# \033表示开启一个属性设置 [46;35m 46表示背景色 35 表示字体颜色,[4m表示下划线，[0m表示结束属性设置
echo "\033[46;35m \033[4m Remote Hello! \033[0m"

project_name=Hello
echo "\033[32m cd ${project_name} && npm install \033[0m"


sh -c "$(curl --proxy http://127.0.0.1:4780 https://raw.githubusercontent.com/HeHuiqi/project_scaffold_shell/main/subgraph_scaffold.sh)" -p hello --proxy http://127.0.0.1:4780