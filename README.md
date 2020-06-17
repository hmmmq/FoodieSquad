# FoodieSquad
 online ordering meal system
 
 ## dao
 1.插入表值user表插入新用户newuser，不可删！user_role表以及role、role_permission表都插入值。

 ### sql
 说明：表数据插入了一个新用户newuser,一个用户hmq，一个管理员2，两个快递员，一个（商家）10101，密码均加密，可以用。
 密码：hmq:1234   管理员2:123   两个快递员:1234    商家:123
 
 ## web
 1.修改com.niit.security包下myAuthenticationSuccessHandler.java   myAuthenticationSuccessHandler2.java
 2.修改spring-security.xml配置

 ### 功能
 1.实现商户手机号或学号登录直接拦截，修复进入首页bug.

