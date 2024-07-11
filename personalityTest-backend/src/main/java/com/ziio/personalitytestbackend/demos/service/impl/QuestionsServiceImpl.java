package com.ziio.personalitytestbackend.demos.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.Query;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ziio.personalitytestbackend.demos.mapper.ResultsMapper;
import com.ziio.personalitytestbackend.demos.model.AnsReturn;
import com.ziio.personalitytestbackend.demos.model.Questions;
import com.ziio.personalitytestbackend.demos.model.Results;
import com.ziio.personalitytestbackend.demos.service.QuestionsService;
import com.ziio.personalitytestbackend.demos.mapper.QuestionsMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.xml.transform.Result;
import java.text.DecimalFormat;
import java.util.HashMap;

/**
* @author Ziio
* @description 针对表【questions(性格测试题目表)】的数据库操作Service实现
* @createDate 2024-07-09 10:38:41
*/
@Service
@Slf4j
public class QuestionsServiceImpl extends ServiceImpl<QuestionsMapper, Questions>
    implements QuestionsService{

    @Resource
    private QuestionsMapper questionsMapper;

    @Resource
    private ResultsMapper resultsMapper;

    @Override
    public AnsReturn calculateAns(String string) {
        StringBuffer stringBuffer = new StringBuffer(string);
        HashMap<Character, Integer> map = new HashMap<>();

        for (int i = 0; i < stringBuffer.length(); i++) {
            char a = stringBuffer.charAt(i);
            if (map.get(a) == null) {
                map.put(a, 1);
            } else {
                map.put(a, map.get(a) + 1);
            }
        }
        System.out.println(map.keySet());
        System.out.println(map.values());

        Integer e = (map.get('E') == null ? 0 : map.get('E'));
        Integer i = (map.get('I') == null ? 0 : map.get('I'));
        Integer s = (map.get('S') == null ? 0 : map.get('S'));
        Integer n = (map.get('N') == null ? 0 : map.get('N'));
        Integer t = (map.get('T') == null ? 0 : map.get('T'));
        Integer f = (map.get('F') == null ? 0 : map.get('F'));
        Integer j = (map.get('J') == null ? 0 : map.get('J'));
        Integer p = (map.get('P') == null ? 0 : map.get('P'));


        //计算比率
        DecimalFormat decimalFormat = new DecimalFormat("0.00");
        String eRate = decimalFormat.format(((double) e / stringBuffer.length()) * 100);
        String iRate = decimalFormat.format(((double) i / stringBuffer.length()) * 100);
        String sRate = decimalFormat.format(((double) s / stringBuffer.length()) * 100);
        String nRate = decimalFormat.format(((double) n / stringBuffer.length()) * 100);
        String tRate = decimalFormat.format(((double) t / stringBuffer.length()) * 100);
        String fRate = decimalFormat.format(((double) f / stringBuffer.length()) * 100);
        String jRate = decimalFormat.format(((double) j / stringBuffer.length()) * 100);
        String pRate = decimalFormat.format(((double) p / stringBuffer.length()) * 100);

        // 根据比率，二选一筛选拼接结果  , "ESTJ"
        StringBuffer res = new StringBuffer();
        res = e > i ? res.append("E") : res.append('I');
        res = s > n ? res.append('S') : res.append('N');
        res = t > f ? res.append('T') : res.append('F');
        res = j > p ? res.append('J') : res.append('P');
        res.toString();
        // 根据 res 获取性格信息
        QueryWrapper<Results> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("ansCode", res.toString());
        Results one = resultsMapper.selectOne(queryWrapper);

        AnsReturn ans = new AnsReturn(res.toString(), eRate, iRate, sRate, nRate, tRate, fRate, jRate, pRate, one.getAnsName(), one.getAnsDisc());

        return ans;
    }
}




