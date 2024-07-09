package com.ziio.personalitytestbackend.demos.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

/**
 * 性格测试题目表
 * @TableName questions
 */
@TableName(value ="questions")
@Data
public class Questions implements Serializable {
    /**
     * 主键
     */
    @TableId
    private String id;

    /**
     * 题干
     */
    private String name;

    /**
     * 选项 A
     */
    private String optionA;

    /**
     * 选项 B
     */
    private String optionB;

    /**
     * 题目序号
     */
    private Integer sequenceNumber;

    /**
     * 选项 A 所对应的意义
     */
    private String valA;

    /**
     * 选项 B 所对应的意义
     */
    private String valB;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}