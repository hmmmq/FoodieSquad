# FoodieSquad
 online ordering meal system
 # 修改点：
 ## 1.付珂：
 ### 1.1 修改了web-pom.xml 、web-spring-mvc.xml 文件 引入ajax支持
 ### 1.2 新增adminTest.jsp、新增adminController方法
 ## 2.陈中：
 ### 2.1 修改dao-service ，增加userService.selectByPwdAndId方法
 ### 2.2 修改web-loginByIdAndPwd.jsp，新增loginController方法，支持学号登录；
 ## 3.黄美祺：
 ### 3.1 修改mysql-service,修改order表，新增字段属性Integer OrderStatus, 0表示订单未完成，1表示订单完成。
 ### 3.2 修改web-chooseCanteenPage.jsp,新增web-CanteenController方法实现ajax异步查询；
 ### 3.3 新增web-CanteenTest.jsp,新增web-CanteenController方法，实现点击搜索返回三大实体（餐厅，窗口，菜）表单并显示至页面；
