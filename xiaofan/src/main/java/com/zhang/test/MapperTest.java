package com.zhang.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zhang.bean.Department;
import com.zhang.bean.Employee;
import com.zhang.dao.DepartmentMapper;
import com.zhang.dao.EmployeeMapper;

/*
    * 测试dao层的工作
    * 两种方法
    * 推荐使用Spring的项目使用spring的单元测试，可以自动注入我们需要的组件
    * 1.导入SpringTest
    * 2.@ContextConfiguration指定Spring配置文件的位置
    * 3.直接autowired
    */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class MapperTest {
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	EmployeeMapper employeeMapper;

	@Autowired
	SqlSession sqlSession;

	/*
	 * 测试department
	 */
	@Test
	public void testCRUD() {
		/*
		 * //1.创建springIOC容器 ApplicationContext ioc=new
		 * ClassPathXmlApplicationContext("applicationContext.xml"); //2.从容器中获取mapper
		 * DepartmentMapper bean=ioc.getBean(DepartmentMapper.class);
		 */
		System.out.println(departmentMapper);

		// 1.插入几个部门
		// departmentMapper.insertSelective(new Department(null,"开发部"));
		// departmentMapper.insertSelective(new Department(null,"测试部"));

		// 2.生成员工数据，测试员工插入
		 //employeeMapper.insertSelective(new Employee(null, "dazhuang","M",
		 //"994683607@qq.com", 1));
		// 3.批量插入多个员工: 批量，使用可以执行批量操作的sqlSession
		
		EmployeeMapper mapper=sqlSession.getMapper(EmployeeMapper.class);
		for(int i=0;i<100;i++)
		{
			String uidString=UUID.randomUUID().toString().substring(0, 5)+""+i;
			mapper.insertSelective(new Employee(null, uidString, "M", uidString+"@com", 1));
		}
		}

}
