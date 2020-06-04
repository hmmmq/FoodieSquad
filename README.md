# FoodieSquad
 online ordering meal system
# 新增修改
## 1. 数据库
### 数据库未部署到服务器上，db.properties是本地数据库连接，请部署到localhost数据库上

### 1.1 修改order表字段属性
删除属性cart_id
新增order_code属性存放取餐码
### 1.2 新增history_item表外键
外键关联order表的order_id,以免在history_item表中插入order表没有的order_id
删除顺序先删除history_item表内容再删除order表内容。否则报错。
## 2. dao-service
### 2.1 删减order的dao-service方法和属性
## 3.web

### 3.1 修改controller里关于生成insert( new order )的方法

# 测试报告
已测试，能正常运行


