package com.ziio.personalitytestbackend.demos.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ziio.personalitytestbackend.demos.model.AnsReturn;
import com.ziio.personalitytestbackend.demos.model.Questions;
import com.ziio.personalitytestbackend.demos.service.QuestionsService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@CrossOrigin
@RestController
@RequestMapping("/manage")
public class QuestionController {
    @Resource
    private QuestionsService questionsService;
    JSONObject jsonObject = new JSONObject();

    //查询全部
    @GetMapping("/getAll")
    public JSONObject getAll() {
        jsonObject.clear();
        jsonObject.put("status", 200);
        jsonObject.put("data", questionsService.list());
        return jsonObject;
    }

    //按照id查询
    @GetMapping("/getById/{id}")
    public JSONObject findById(@PathVariable("id") int id) {
        jsonObject.clear();
        Questions question = questionsService.getById(id);
        if (question != null) {
            jsonObject.put("status", 200);
            jsonObject.put("data", question);
        } else {
            jsonObject.put("status", 200);
            jsonObject.put("data", null);
        }
        return jsonObject;
    }

    //更新
    @PutMapping("/update")
    public JSONObject updateById(@RequestBody Questions topic) {
        jsonObject.clear();
        boolean res = questionsService.save(topic);
        if (res) {
            jsonObject.put("status", 200);
            jsonObject.put("msg", "更新成功~");
        } else {
            jsonObject.put("status", 201);
            jsonObject.put("msg", "更新失败");
        }
        return jsonObject;
    }

    //删除
    @GetMapping("/del/{id}")
    public JSONObject delById(@PathVariable("id") int id) {
        jsonObject.clear();
        boolean isDel = questionsService.removeById(id);
        if (isDel) {
            jsonObject.put("status", 200);
            jsonObject.put("msg", "删除成功~");
        } else {
            jsonObject.put("status", 201);
            jsonObject.put("msg", "删除失败~");
        }
        return jsonObject;
    }

    //分页查询 --- 这里固定
    @GetMapping("/getByPage/{page},{size}")
    public Object getByPage(@PathVariable("page") int page, @PathVariable("size") int size) {
        jsonObject.clear();
        Page<Questions> listWithCriteria = questionsService.page(new Page<Questions>(page,size));
        long size1 = listWithCriteria.getTotal();
        if (size1 > 0) {
            jsonObject.put("status", 200);
            jsonObject.put("data", listWithCriteria);
            jsonObject.put("endTag", false);
        } else {
            jsonObject.put("status", "201");
            jsonObject.put("data", null);
            jsonObject.put("endTag", true);
        }
        return jsonObject;
    }

    // 获取查询结果
    @PostMapping("/submit")
    public JSONObject calculateAns(@RequestBody JSONObject object) {
        jsonObject.clear();
        String ans = object.getString("ans");
        AnsReturn ans1 = questionsService.calculateAns(ans);
        // 封装结果
        if (ans1 != null) {
            jsonObject.put("status", 200);
            jsonObject.put("data", ans1);
        } else {
            jsonObject.put("status", 201);
            jsonObject.put("data", null);
        }
        return jsonObject;

    }
}
