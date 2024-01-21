package com.example.demo.entiy;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 作为返回给前端的数据
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Res {
    private int state;
    private String msg;
    private Object object;
}
