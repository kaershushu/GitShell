#!/bin/bash
# ---------------------
# 查看当前分支源分支      |
# ---------------------
# 1.输出参数必须使用${}，否则鸳鸯输出
# 2.shell里不能通过调用函数给变量赋值，需要通过"$?"打印函数值
# 3.先定义函数，再调用
# 4.变量命名不能有空格

currentBranchName(){
	curBranchName=$(git symbolic-ref --short -q HEAD)
	echo "当前分支名字是: $curBranchName"
	sleep 2
	git reflog ${curBranchName}
}

if read -t 5 -p "输入仓库名称: " projectName
then 
	if [ $projectName == "PC" ] || [ $projectName == "pc" ]
	then
		echo "您进入了私人仓库."
		cd /Users/lw/Documents/StudioProjects/PermissionChecker
		currentBranchName
	elif [ $projectName == "FP" ] || [ $projectName == "fp" ]
	then
		echo "您进入了FP仓库."
		cd /Users/alan/Documents/freeprints_android
		currentBranchName
	elif [ $projectName == "PT" ] || [ $projectName == "pt" ]
	then
		echo "您进入了PT仓库."
		cd /Users/alan/Documents/phototils_android
		currentBranchName
	elif [ $projectName == "library" ] || [ $projectName == "Library" ]
	then
		echo "您进入了Common Library"
		cd /Users/alan/Documents/fp_android_common
		currentBranchName
	else
		echo "!!!!没有目标git仓库!!!!"
		exit 1
	fi
else
	echo "输入超时,退出脚本."
	exit 1
fi