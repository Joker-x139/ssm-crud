import com.joker.crud.bean.Department;
import com.joker.crud.bean.Employee;
import com.joker.crud.dao.DepartmentMapper;
import com.joker.crud.dao.EmployeeMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Random;
import java.util.UUID;

/**
 * @author Joker
 * @date 2021/11/27-20:10
 * 1.@ContextConfiguration指定spring配置文件的位置
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Test
    public void testCRUD(){

        //1、插入部门
//        departmentMapper.insertSelective(new Department(null,"设计部"));
//        departmentMapper.insertSelective(new Department(null,"开发部"));
//        departmentMapper.insertSelective(new Department(null,"测试部"));

        //2、生成员工数据
        employeeMapper.insert(new Employee(null,"joker","M","joker@joker.com",1));
        employeeMapper.insert(new Employee(null,"rose","F","rose@joker.com",2));
        employeeMapper.insert(new Employee(null,"jerry","M","jerry@joker.com",3));

        //3、批量插入员工
        EmployeeMapper mapper = sqlSessionTemplate.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 1000; i++) {
            String uid = UUID.randomUUID().toString().substring(0,5)+"_"+i;
            int genderRandom = new Random().nextInt(10);
            int dIdRandom = new Random().nextInt(3);
            Employee employee = new Employee(null, uid, null, uid + "@joker.com", null);
            if (genderRandom%2==0){
                employee.setGender("M");
            }else {
                employee.setGender("F");
            }
            if (dIdRandom==0){
                employee.setdId(1);
            }else if(dIdRandom==1){
                employee.setdId(2);
            }else {
                employee.setdId(3);
            }
            mapper.insertSelective(employee);
        }
    }

    @Test
    public void testRandom(){
//        int random = (int)(Math.random()*100);
//        if (random%2==0){
//            System.out.println("yes");
//        }else {
//            System.out.println("no");
//        }
//        System.out.println(random);
        for (int i = 0; i <10; i++) {
            int random1 = new Random().nextInt(4);
            if (random1==1||random1==0){
                System.out.println("random :1  0");
            }else if(random1==2){
                System.out.println("random :2");
            }else {
                System.out.println("random :3");
            }
        }


    }
}
