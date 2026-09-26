# 犟龟预测阅读课堂

公开课堂页面：

- 教师入口：https://liushenge01-source.github.io/jiangui-reading-classroom/?teacher=1&v=20260926m
- 学生创作：https://liushenge01-source.github.io/jiangui-reading-classroom/?student=1&v=20260926m

教师二维码：`teacher-qr.png`；学生二维码：`student-qr.png`。

## 学生创作流程

学生依次选择陶陶将去的地点和遇见的人物，再用自己的话创作“得到的消息”和“陶陶的回应”，最后生成绘本并提交给刘老师。页面按原话排版，不自动扩写故事。支持设备键盘语音听写；iPad 上点击输入框后，使用系统键盘的麦克风，听写文字可继续修改。

## 多平板作品汇总（Supabase）

GitHub Pages 是静态网站，不能自行接收和保存不同设备的提交。在线汇总需要一个 Supabase 项目：

1. 创建 Supabase 项目，并在项目 SQL Editor 执行 `database-setup.sql`。
2. 教师二维码打开作品列表，无需登录或口令。
3. 项目 URL 和 Supabase publishable key 已配置在 `index.html` 中。publishable key 可以放在网页里；绝不能填写 `service_role`/secret key。
4. 学生可以匿名提交；教师页面对持有链接的人开放读取。作品会持续保留，直到老师使用教师页的“清空课堂作品”功能手动清除。清空操作需要输入刘老师的课堂清理码。不要在作品中填写真实姓名或隐私信息。

教师作品列表按提交先后编号为“学生 1、学生 2……”；每位提交者单独显示一张作品卡。学生姓名为可选昵称；建议课堂中使用昵称或匿名。
