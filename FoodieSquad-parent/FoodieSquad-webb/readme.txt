此层为web层，
1./FoodieSquad-web/src/main/resources中配置了Spring,SpringMvc,Mybatis等配置文件。
2.在/FoodieSquad-web/src/main/java中配置了controller和exception
2.1 controller包负责请求的处理和跳转，当用户请求一个url链接时，dispatcher-servlet可以自动识别并转发请求到对应的controller，在controller内再进行数据的处理和分析，实现数据的交互。
2.2 exception包则负责处理错误页面的跳转。但系统产生错误时，会寻找exception包中的类，根据错误的状态码进行查找，方法再返回给服务器一个打印的错误信息，并按照web.xml中指定的错误页面进行跳转。
3./FoodieSquad-web/src/main/webapp/css中为各个页面的css文件，用于规定页面样式。
4./FoodieSquad-web/src/main/webapp/image中为各个页面的图片静态资源，用于加载页面图片
5./FoodieSquad-web/src/main/webapp/js中为页面的js文件，用于加载动作与传值。
6./FoodieSquad-web/src/main/webapp/view中为jsp文件，均为网页视图，功能是呈现给用户视图界面，与后台进行传值交互。
7./FoodieSquad-web/src/main/webapp/WEB-INF中为web.xml文件，放置web.xml。

