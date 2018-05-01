package com.shopping.service;

import com.shopping.bean.Drug;

import java.util.List;

/**
 * Created by Administrator on 2018/05/01.
 */
public interface DrugService {
    /**
     * 新品搜索
     * @return
     */
    public List<Drug> searchByNew();


    /**
     * 类型搜索
     * @return
     */
    public List<Drug> searchByType(String solrkey, String solrvalue);
}
