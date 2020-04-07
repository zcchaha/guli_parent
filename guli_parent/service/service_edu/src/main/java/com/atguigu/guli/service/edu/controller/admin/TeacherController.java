package com.atguigu.guli.service.edu.controller.admin;


import com.atguigu.guli.common.base.result.R;
import com.atguigu.guli.service.edu.entity.Teacher;
import com.atguigu.guli.service.edu.entity.vo.TeacherQueryVo;
import com.atguigu.guli.service.edu.service.TeacherService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 讲师 前端控制器
 * </p>
 *
 * @author ZCC
 * @since 2020-04-01
 */
@Api(description="讲师管理")
@RestController
@RequestMapping("/admin/edu/teacher")
@CrossOrigin //解决跨域问题
public class TeacherController {

    @Autowired
    private TeacherService teacherService;

    @ApiOperation(value = "所有讲师列表", notes = "返回所有讲师列表")
    @GetMapping("list")
    public R listAll(){

        List<Teacher> list = teacherService.list();
        return R.ok().data("items",list);
    }

    @ApiOperation(value = "根据ID删除讲师", notes = "根据ID删除讲师")
    @DeleteMapping("remove/{id}")
    public R removeById(
            @ApiParam(name = "id", value = "讲师ID", required = true)
            @PathVariable String id){
        boolean result = teacherService.removeById(id);
        if (result){
            return R.ok().message("删除成功");
        }else {
            return R.error().message("删除失败");
        }
    }

    @ApiOperation(value = "讲师分页列表")
    @GetMapping("list/{cpage}/{limit}")
    public R listPage(
            @ApiParam(value = "当前页", required = true) @PathVariable Long cpage,
            @ApiParam(value = "每页记录数", required = true) @PathVariable Long limit,
            @ApiParam("讲师列表查询对象")TeacherQueryVo teacherQueryVo){

        Page<Teacher> page = new Page<>(cpage, limit);
        IPage<Teacher> pageModel = teacherService.selectPage(page,teacherQueryVo);
        List<Teacher> records = pageModel.getRecords();
        long total = pageModel.getTotal();
        return R.ok().data("total",total).data("rows",records);
    }
    @ApiOperation("新增讲师")
    @PostMapping("save")
    public R save(@ApiParam(value = "讲师对象",required = true)@RequestBody Teacher teacher){
        teacherService.save(teacher);
        return R.ok().message("保存成功");
    }

    @ApiOperation("更新讲师")
    @PutMapping("update")
    public R updateById(@ApiParam(value = "讲师对象",required = true)@RequestBody Teacher teacher){
        boolean result = teacherService.updateById(teacher);
        if (result){
            return R.ok().message("修改成功");
        }else {
            return R.error().message("数据不存在");
        }
    }
    @ApiOperation("根据id查询讲师")
    @GetMapping("get/{id}")
    public R getById(@ApiParam("讲师对象")@PathVariable String id){
        Teacher teacher = teacherService.getById(id);
        if (teacher !=null){
            return R.ok().data("item",teacher);
        }else {
            return R.error().message("数据不存在");
        }
    }


}

