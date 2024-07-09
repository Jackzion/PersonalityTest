package com.ziio.personalitytestbackend.demos.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

/**
 * 性格测试结果对照表
 * @TableName results
 */
@TableName(value ="results")
@Data
public class Results implements Serializable {
    /**
     * 主键
     */
    @TableId
    private String id;

    /**
     * 性格测试结果字符串
     */
    private String ansCode;

    /**
     * 性格测试结果描述
     */
    private String ansDisc;

    /**
     * 性格测试结果名称
     */
    private String ansName;

    /**
     * 序号
     */
    private Integer sequenceNumber;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}