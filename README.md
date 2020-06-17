# FoodieSquad
 online ordering meal system
 
 ## dao
 1.增加5个表，修改user字段，user密码加密，修改usermapper.xml，新增rolemapper,permissionmapper.xml
 2.pojo新增permission,role,修改user属性
 3.完善外键设置
 ### sql
 说明：表数据插入了一个用户user，一个管理员，两个骑手，一个商家10101
 ## service
 1.修改userservice(大改)
 2.pom.xml增加springsecurity
 ## web
 1.配置springsecurity.xml
 2.新增com.niit.security包，里面新增6个java文件
 3.修改login controller以及percenal center controller方法
 4.修改jsp页面跳转路径
 5.pom.xml增加springsecurity
 ### 功能
 1.未登录前跨域请求将自动拦截，跳转到学号登录，登录成功后进入主页。
 2.多角色权限登录，骑手管理员可登录用户端，商家身份登录则被拦截。
 3.学号能实现rememberme,勾选后1h之内关闭浏览器再次点开链接直接进入主页。
 4.用户登录以后将不能访问学号登录或手机号登录页面（403），直接从index页面进入主页。

