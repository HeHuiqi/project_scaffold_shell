# project_scaffold_shell

## subgraph_scaffold.sh 使用指南

用法
```
sh -c "$(curl -fsSL  https://raw.githubusercontent.com/HeHuiqi/project_scaffold_shell/main/subgraph_scaffold.sh)" -p hello
```

设置代理，推荐注意修改成自己的代理地址
```
sh -c "$(curl --proxy http://127.0.0.1:4780 https://raw.githubusercontent.com/HeHuiqi/project_scaffold_shell/main/subgraph_scaffold.sh)" -p hello --proxy http://127.0.0.1:4780
```



下载下来用法
```
sh subgraph_scaffold.sh hello
```

下载下来 设置代理
```
sh subgraph_scaffold.sh hello --proxy http://127.0.0.1:4780
```