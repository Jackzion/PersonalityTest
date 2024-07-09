use my_db;
CREATE TABLE Questions (
                           id VARCHAR(255) PRIMARY KEY COMMENT '主键',
                           name VARCHAR(255) NOT NULL COMMENT '题干',
                           optionA VARCHAR(255) NOT NULL COMMENT '选项 A',
                           optionB VARCHAR(255) NOT NULL COMMENT '选项 B',
                           sequenceNumber INT NOT NULL COMMENT '题目序号',
                           valA VARCHAR(255) NOT NULL COMMENT '选项 A 所对应的意义',
                           valB VARCHAR(255) NOT NULL COMMENT '选项 B 所对应的意义'
) COMMENT '性格测试题目表';

CREATE TABLE Results (
                         id VARCHAR(255) PRIMARY KEY COMMENT '主键',
                         ansCode VARCHAR(255) NOT NULL COMMENT '性格测试结果字符串',
                         ansDisc TEXT NOT NULL COMMENT '性格测试结果描述',
                         ansName VARCHAR(255) NOT NULL COMMENT '性格测试结果名称',
                         sequenceNumber INT NOT NULL COMMENT '序号'
) COMMENT '性格测试结果对照表';

