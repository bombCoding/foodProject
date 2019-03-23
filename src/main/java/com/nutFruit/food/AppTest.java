package com.nutFruit.food;


import com.nutFruit.food.domain.*;
import com.nutFruit.food.service.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = "classpath:applicationContext.xml")
public class AppTest {


    @Autowired
    private IUserService service;

    @Autowired
    private IEmployeeService employeeService;

    @Autowired
    private IPositionService positionService;
    @Autowired
    private IDepartmentService departmentService;

    @Autowired
    private IFoodInfoService iFoodInfoService;


    @Test
    public void testFoodList() {
        List<FoodInfo> foodInfos = iFoodInfoService.selectAll(1,5,1);
        for (FoodInfo foodInfo : foodInfos) {
            System.out.println("foodInfo = " + foodInfo.toString());
        }
    }

    @Test
    public void test() {
      List<User> users = service.selectAll("d",null);
        for (User user : users) {
            System.out.println("user = " + user);
        }
    }


    @Test
    public void testPage() {

        List<User> users = service.selectPageResult(1, 5);
        for (User user : users) {
            System.out.println("user = " + user);
        }
    }

    @Test
    public void testEmpList() {

        List<Employee> employees = employeeService.selectAll();
        for (Employee employee : employees) {
            System.out.println("employee = " + employee.getDeptId().getDeptname());
        }
    }

    @Test
    public void testPositionList() {
        List<Position> positions = positionService.selectAll("DBA");

        for (Position position : positions) {
            System.out.println("position = " + position);
        }
    }

    @Test
    public void deptList(){

        List<Department> list = departmentService.selectAll("技术");
        for (Department department : list) {
            System.out.println("department = " + department);
        }
    }


}
