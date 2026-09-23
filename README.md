# 犟龟预测阅读课堂

公开课堂页面：

- 教师入口：https://liushenge01-source.github.io/jiangui-reading-classroom/?teacher=1
- 学生创作：https://liushenge01-source.github.io/jiangui-reading-classroom/?student=1

教师二维码：`teacher-qr.png`；学生二维码：`student-qr.png`。

## 语音输入

预测和理由输入框均提供语音识别。学生点击麦克风并允许浏览器使用麦克风，完成后再点“结束录音”；识别出的文字可以继续编辑。若设备浏览器不支持页面内识别，可点进文本框，使用平板系统键盘上的麦克风听写。

## 多平板作品汇总（Supabase）

GitHub Pages 是静态网站，不能自行接收和保存不同设备的提交。在线汇总需要一个 Supabase 项目：

1. 创建 Supabase 项目，并在项目 SQL Editor 执行 `database-setup.sql`。
2. 在 Supabase Authentication 里创建刘老师账号（邮箱为 `liushenge01@gmail.com`），设置一个课堂口令作为该账号密码，并关闭公开注册，只保留老师账号。教师页面只显示口令输入框，不要求老师输入邮箱。
3. 将项目 URL 和 publishable/anon key 填入 `config.js`。此键可用于浏览器；绝不能填写 `service_role` 密钥。
4. 提交并发布 `config.js` 后，学生可以匿名提交，只有登录的老师账号可以读取作品。

教师作品列表按提交先后编号为“学生 1、学生 2……”；每位提交者单独显示一张作品卡。学生姓名为可选昵称；建议课堂中使用昵称或匿名。学生提交的预测、依据和绘本会存入该 Supabase 项目。在线数据库接通前，提交按钮会提示尚未配置，不会假装提交成功。
