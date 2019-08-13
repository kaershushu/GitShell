# Git Shell:简化Git操作的Shell脚本集合
## [查询源分支](https://github.com/kaershushu/GitShell/blob/master/s.sh)

* 脚本自定义设置

  > 1.设置本地仓库路径。

  > 2.设置本地仓库别名。

* 脚本使用步骤(Mac平台)

  > 1.拷贝脚本文件到`Home目录(~/Home)`下。

  > 2.在`~/.zshrc`里(我使用的是on my zsh)设置执行脚本别名，我设置的是```alias src="sh ~/s.sh"```

  > 3.打开`Terminal`直接输入设置的别名`src`即可
  
  
## [推送同名远端分支](https://github.com/kaershushu/GitShell/blob/master/pre-push)

* 脚本功能

  > 当本地分支和远端分支名字不一致的时候，`Push`的时候提示失败。

* 脚本自定义设置
  
  > 只需自定义`仓库名`和`仓库地址`即可。
  
* 脚本使用

  > 因为是`hook`文件，所以需要放到项目的`.git`文件夹下的`hook`文件夹。Done，剩下的交给脚本来做!

