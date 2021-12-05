package com.joker.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.joker.crud.bean.Employee;
import com.joker.crud.bean.Msg;
import com.joker.crud.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Joker
 * @date 2021/11/28-14:38
 */
@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;

    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        //查询之前调用pagehelp，传入页码，以及每页的大小
        PageHelper.startPage(pn,15);
        //stratPage后查询信息
        List<Employee> allEmps = employeeService.getAllEmps();
        //使用pageInfo包装查询到的信息，
        //封装了详细的分页信息，包括查询出来的信息,传入连续显示的页数
        PageInfo page = new PageInfo(allEmps,5);
        return Msg.success().add("pageInfo",page);

    }

    /**
     * 员工保存
     * @return
     */
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        if (result.hasErrors()){
            Map<String,Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError:errors){
                System.out.println("错误的字段名"+fieldError.getField());
                System.out.println("错误的信息"+fieldError.getDefaultMessage());
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.faill().add("errorFields",map);
        }else {
            employeeService.saveEmp(employee);
            return Msg.success();
        }

    }

    /**
     * 检验用户名是否存在
     * @param empName
     * @return
     */
    @RequestMapping("/checkEmpName")
    @ResponseBody
    public Msg checkEmpName(String empName){
        boolean isExsit= employeeService.checkEmpName(empName);
        if(isExsit){
            return Msg.success();
        }else {
            return Msg.faill();
        }
    }

    /**
     * 按照id查用户
     * @param id
     * @return
     */
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id){
        Employee emp = employeeService.getEmp(id);
        return Msg.success().add("emp",emp);

    }

    /**
     * 按照id修改用户
     * @param employee
     * @return
     */
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmp(Employee employee){
        System.out.println(employee);
        employeeService.updateEmp(employee);
        return Msg.success();
    }

    @RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmp(@PathVariable("ids")String ids){
        if(ids.contains("-")){
            String[] str_ids = ids.split("-");
            List<Integer> list_id = new ArrayList<>();
            for (String str_id:str_ids){
                Integer id = Integer.parseInt(str_id);
                list_id.add(id);
            }
            employeeService.deleteBatch(list_id);
        }else {
            Integer id = Integer.parseInt(ids);
            employeeService.deleteEmp(id);
        }
        return Msg.success();
    }

//    @RequestMapping("/emps")
    public String getAllEmps(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        //查询之前调用pagehelp，传入页码，以及每页的大小
        PageHelper.startPage(pn,5);
        //stratPage后查询信息
        List<Employee> allEmps = employeeService.getAllEmps();
        //使用pageInfo包装查询到的信息，
        //封装了详细的分页信息，包括查询出来的信息,传入连续显示的页数
        PageInfo<Employee> PageInfo = new PageInfo<>(allEmps,5);
        model.addAttribute("pageInfo",PageInfo);
        return "list";
    }
}
