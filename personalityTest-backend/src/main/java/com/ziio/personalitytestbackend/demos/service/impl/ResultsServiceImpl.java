package com.ziio.personalitytestbackend.demos.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ziio.personalitytestbackend.demos.model.Results;
import com.ziio.personalitytestbackend.demos.service.ResultsService;
import com.ziio.personalitytestbackend.demos.mapper.ResultsMapper;
import org.springframework.stereotype.Service;

/**
* @author Ziio
* @description 针对表【results(性格测试结果对照表)】的数据库操作Service实现
* @createDate 2024-07-09 11:15:19
*/
@Service
public class ResultsServiceImpl extends ServiceImpl<ResultsMapper, Results>
    implements ResultsService{

}




