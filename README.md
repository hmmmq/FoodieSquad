# FoodieSquad
 online ordering meal system
# 新增修改
## 1. 数据库
### 1.1 新增favorite_canteen、favorite_dish、favorite_window表
### 1.2 删减driver、admin表
userType :
0:普通用户
1:快递员
2:商家 商家id必须手动输入，且必须与window_id匹配！
3:管理员
### 1.3 新增comments表
-1:差评
0:一般
1:好评
### 1.4 新增canteen、window、dish字段属性
新增sort属性。
0:dish
1:window
2:canteen
### 1.5 新增user表字段属性
新增属性user_income;
用于商家收入和骑手收入。
### 1.6 删除无用的menu表
## 2. dao-service
### 2.1 封装userService.insert(user) 并做测试
请务必到service test里查看userService.insert(user)的测试，学习如何插入普通用户、快递员、商家、画管理员。
### 2.2 封装favoriteService.
封装favorite_canteen mapper 、favorite_dish mapper、favorite_window mapper
### 2.3 dao-pom.xml新增log4j插件，可输出dao层测试报告
## 3.web
### 3.1 删减关于adminservice、driverservice方法以及其操作
需要重写driver和admin模块
driver:在生成订单controller要随机分配driver；需修改
admin:在admincontroller里不能再使用adminservice;已注释掉。
### 3.2 删减关于favouriteservice的调用，由于favorite实体已经演变成三类，需重写收藏模块
### 3.3 已修改付珂要求的admincontroller增加@requestmapping("/admin")

# 测试报告
已测试，能正常运行
## 1.学号登录无法返回

