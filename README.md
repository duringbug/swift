<!--
 * @Description: 
 * @Author: 唐健峰
 * @Date: 2023-09-07 15:57:42
 * @LastEditors: ${author}
 * @LastEditTime: 2023-09-07 17:07:21
-->
# ios系统中swift的简单使用
## 项目初始化
假设已经可以使用swift
尝试
```bash
swift --version
```
出现类似
```bash
swift-driver version: 1.62.15 Apple Swift version 5.7.2 (swiftlang-5.7.2.135.5 clang-1400.0.29.51)
Target: arm64-apple-macosx12.0
```
说明可以正常使用
**项目初始化:**
```bash
swift package init --type executable
```
<small>
在初始化包时选择了 --type executable，那么默认会创建一个包含可执行目标的项目。如果没有可执行目标，你需要在 Package.swift 文件中创建一个，并确保它包含了你的程序入口点。
</small><br/><br/>

会生成.build、Source、Tests、.gitignore、Package.swift文件

## 运行
在终端中，导航到你的包的根目录，即包含 Package.swift 文件的目录。
```bash
swift build
```
一旦构建成功，你可以使用以下命令来运行你的 Swift 可执行程序：
```bash
.build/debug/你的可执行文件名
```
**"你的可执行文件名"一般是根目录文件夹的名字**

