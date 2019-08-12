#!/bin/bash
#  -------------------------------------------------------
# |                   m查看当前分支源分支                    |
#  -------------------------------------------------------
# 1.输出参数必须使用${}，否则原样输出
# 2.shell里不能通过调用函数给变量赋值，需要通过"$?"打印函数值
# 3.先定义函数，再调用
# 4.变量命名不能有空格

# 颜色必须以NC结尾，应该是判断颜色识别的文本
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

currentBranchName(){
	curBranchName=$(git symbolic-ref --short -q HEAD)
	echo "当前分支是: ${GREEN}$curBranchName${NC}"
	sleep 2
	sourceBranch=$(git reflog ${curBranchName})
	# 截掉"origin/xxx"之前的字符串，只保留源分支名，也就是删除origin左边空格往左的所有字符串
	# 7c01962 release_v0.1@{0}: branch: Created from origin/release_v0.1
	echo "当前分支的源分支是: ${GREEN}${sourceBranch##* }${NC}"
}

if read -t 5 -p "输入仓库名称: " projectName
then 
	if [ $projectName == "PC" ] || [ $projectName == "pc" ]
	then
		cd /Users/alan/Documents/PermissionChecker
		currentBranchName
	elif [ $projectName == "FP" ] || [ $projectName == "fp" ]
	then
		cd /Users/alan/Documents/freeprints_android
		currentBranchName
	elif [ $projectName == "PT" ] || [ $projectName == "pt" ]
	then
		cd /Users/alan/Documents/phototils_android
		currentBranchName
	elif [ $projectName == "library" ] || [ $projectName == "Library" ]
	then
		cd /Users/alan/Documents/fp_android_common
		currentBranchName
	else
		echo "${RED}!!!!没有目标git仓库!!!!${NC}"
		exit 1
	fi
else
	echo "${RED}输入超时,退出脚本${NC}"
	exit 1
fi
