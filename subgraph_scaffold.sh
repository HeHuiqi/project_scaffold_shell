project_name=$1
if [ "${project_name}" == "" ]; then
    echo "input a project name"
    exit
fi
echo ${project_name}
rm -rf  ${project_name}

proxy=$3
if [ "$2" == "--proxy"  ] && [ "${proxy}" != "" ];then
    set_proxy="--proxy ${proxy}"
fi
echo ${set_proxy}
# 初始化项目

mkdir ${project_name}
cd ${project_name}
npm init -y
curl ${set_proxy} https://raw.githubusercontent.com/HeHuiqi/subgraph_use/main/add_scripts.js > add_scripts.js
node add_scripts.js

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
