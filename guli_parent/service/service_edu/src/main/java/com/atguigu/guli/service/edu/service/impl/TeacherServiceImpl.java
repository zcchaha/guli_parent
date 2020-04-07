package com.atguigu.guli.service.edu.service.impl;

import com.atguigu.guli.service.edu.entity.Teacher;
import com.atguigu.guli.service.edu.entity.vo.TeacherQueryVo;
import com.atguigu.guli.service.edu.mapper.TeacherMapper;
import com.atguigu.guli.service.edu.service.TeacherService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 * <p>
 * 讲师 服务实现类
 * </p>
 *
 * @author ZCC
 * @since 2020-04-01
 */
@Service
public class TeacherServiceImpl extends ServiceImpl<TeacherMapper, Teacher> implements TeacherService {

    @Override
    public Page<Teacher> selectPage(Page<Teacher> page, TeacherQueryVo teacherQueryVo) {
        QueryWrapper<Teacher> queryWrapper = new QueryWrapper<>();
        //按照sort字段排顺序
        queryWrapper.orderByAsc("sort");
        //分页查询
        if (teacherQueryVo==null){
            return baseMapper.selectPage(page,queryWrapper);
        }
        //条件查询
        String name = teacherQueryVo.getName();
        Integer level = teacherQueryVo.getLevel();
        String begin = teacherQueryVo.getJoinDateBegin();
        String end = teacherQueryVo.getJoinDateEnd();
        if (!StringUtils.isEmpty(name)){
            queryWrapper.likeRight("name",name);
        }
        if (level!=null){
            queryWrapper.eq("level",level);
        }
        if (!StringUtils.isEmpty(begin)) {
            queryWrapper.ge("join_date", begin);
        }

        if (!StringUtils.isEmpty(end)) {
            queryWrapper.le("join_date", end);
        }

        return baseMapper.selectPage(page,queryWrapper);
    }
}
