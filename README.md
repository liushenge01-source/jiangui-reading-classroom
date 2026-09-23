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
2. 教师二维码直接打开作品列表，无需登录或口令。
3. 项目 URL 和 Supabase publishable key 已配置在 `index.html` 中。publishable key 可以放在网页里；绝不能填写 `service_role`/secret key。
4. 学生可以匿名提交；教师页面对持有链接的人开放读取。作品会持续保留，直到老师使用教师页的“清空课堂作品”功能手动清除。清空操作需要输入刘老师的课堂清理码。不要在作品中填写真实姓名或隐私信息。

教师作品列表按提交先后编号为“学生 1、学生 2……”；每位提交者单独显示一张作品卡。学生姓名为可选昵称；建议课堂中使用昵称或匿名。学生提交的预测、依据和绘本会存入该 Supabase 项目。学生绘本会根据预测和线索扩展为约 200 字的故事。课堂作品保存在 Supabase，老师可在教师页手动清空。重新配置数据库时，请使用 `database-setup.sql` 并在新项目中设置新的清理码摘要。
