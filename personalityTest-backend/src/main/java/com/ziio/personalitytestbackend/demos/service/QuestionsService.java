package com.ziio.personalitytestbackend.demos.service;

import com.ziio.personalitytestbackend.demos.model.AnsReturn;
import com.ziio.personalitytestbackend.demos.model.Questions;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author Ziio
* @description 针对表【questions(性格测试题目表)】的数据库操作Service
* @createDate 2024-07-09 10:38:41
*/
public interface QuestionsService extends IService<Questions> {

    /**
     * 计算指标
     * @param string "EISTJFNPEISTJFNPEISTJFNPEISTJFNPEISTJFNPE"
     * @return
     */
    AnsReturn calculateAns(String string);
}
