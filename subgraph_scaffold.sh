

project_name=$1
if [ "${project_name}" == "" ]; then
    echo "input a project name"
    exit
fi
echo ${project_name}
# rm -rf  ${project_name}

proxy=$3
set_proxy="-fsSL"
if [ "$2" == "--proxy"  ] && [ "${proxy}" != "" ];then
    set_proxy="--proxy ${proxy}"
fi
# echo ${set_proxy}


# 初始化项目
mkdir ${project_name}
cd ${project_name}

# 添加git管理
git init
echo "node_modules
.env
coverage
coverage.json
typechain

#Hardhat files
cache
artifacts

node_modules
.env
coverage
coverage.json
typechain

#Hardhat files
cache
artifacts
# Subgraph
./subgraph/generated
./subgraph/build
# Matchstick
./subgraph/tests/.*" > .gitignore

# 初始化node项目
npm init -y

curl ${set_proxy} https://raw.githubusercontent.com/HeHuiqi/subgraph_use/main/add_scripts.js > add_scripts.js
node add_scripts.js

# rm -rf add_scripts.js

curl ${set_proxy} https://raw.githubusercontent.com/HeHuiqi/subgraph_use/main/hardhat.config.js > hardhat.config.js


mkdir contracts
curl ${set_proxy}  https://raw.githubusercontent.com/HeHuiqi/subgraph_use/main/contracts/HqToken.sol > contracts/HqToken.sol

mkdir scripts
curl ${set_proxy}  https://raw.githubusercontent.com/HeHuiqi/subgraph_use/main/scripts/hqtoken-script.js > scripts/hqtoken-script.js


mkdir test
curl ${set_proxy} https://raw.githubusercontent.com/HeHuiqi/subgraph_use/main/test/hqtoken-test.js > test/hqtoken-test.js


mkdir docker
mkdir docker/data
curl ${set_proxy}  https://raw.githubusercontent.com/HeHuiqi/subgraph_use/main/docker/docker-compose.yml >  docker/docker-compose.yml


# 运行步骤
start_step="
# 启动eth节点
npm run start

# 启动graph节点
npm  run graph-local-node-start

# 清除和停止
npm run remove-local-subgraph-node
npm run graph-local-node-stop

# 部署
npm run deploy
npm run graph-local-codegen && npm run graph-local-build
npm run create-local-subgraph-node && npm run deploy-local-subgraph-node

"
echo "# 执行命令步骤\n <pre>${start_step}</pre>" > README.md


echo "请输入下面的命令，安装项目依赖"

echo "\033[35m cd ${project_name} && npm install \033[0m"



# 安装依赖

# npm install


