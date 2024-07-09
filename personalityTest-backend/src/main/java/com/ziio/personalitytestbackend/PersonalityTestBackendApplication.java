package com.ziio.personalitytestbackend;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.ziio.personalitytestbackend.demos.mapper")
public class PersonalityTestBackendApplication {

    public static void main(String[] args) {
        SpringApplication.run(PersonalityTestBackendApplication.class, args);
    }

}
