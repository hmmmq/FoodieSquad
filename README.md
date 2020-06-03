# FoodieSquad
 online ordering meal system
# 新增修改
## 1. 数据库
### 数据库未部署到服务器上，db.properties是本地数据库连接，请部署到localhost数据库上

### 1.1 删除user表字段属性
删除属性cart_id
### 1.2 新增history_item表属性
新增属性dish_count

## 2. dao-service
### 2.1 删减user的dao-service方法和属性
### 2.2 新增historyitem实体类的dishCount属性

## 3.web

### 3.1 修改controller里关于生成historyitemlist的方法
### 3.2 整合付珂骑手四个页面和controller
# 测试报告
已测试，能正常运行
## 1.学号登录无法返回
## 2.能实现订单页面查看到历史菜品数量
屏幕快照 2020-06-03 下午11.37.27.png
屏幕快照 2020-06-03 下午11.37.36.png
