此层为dao层，
在/FoodieSquad-dao/src/main/resources/com/niit/mapper下装的是各个表对应mapper的xml文件。
在/FoodieSquad-dao/src/main/java/com/niit/mapper 包中装的是各个类的表的操作方法接口。
在使用了spring,mybatis框架支持后mybatis通过对应的mapper.xml实现自动实现mapper.java中的接口，实现对数据库的增删改查。
在/FoodieSquad-dao/src/main/java/com/niit/util里放置工具类。
com.niit.test内则进行了mapper对象的所有方法测试。
在pom.xml里配置改层对pojo层的依赖。
一个实体类对应一个mapper对象。