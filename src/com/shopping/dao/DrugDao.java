package com.shopping.dao;

import com.shopping.bean.Drug;
import com.shopping.service.DrugService;
import com.shopping.util.SolrLink;
import org.apache.commons.lang.StringUtils;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2018/05/01.
 */
@Repository
public class DrugDao implements DrugService{
    @Override
    public List<Drug> searchByNew() {
        SolrLink solrlink = new SolrLink();
        try {
            solrlink.setUp();
            int page = 1;
            int rows = 20;

            SolrQuery solrQuery = new SolrQuery(); // 构造搜索条件
            solrQuery.setQuery("*:*");
            solrQuery.set("sort", "catch_date desc");
            // 设置分页
            solrQuery.setStart((Math.max(page, 1) - 1) * rows);
            solrQuery.setRows(rows);
            QueryResponse queryResponse = solrlink.getHttpSolrClient().query(solrQuery);
            List<Drug> drugs = queryResponse.getBeans(Drug.class);
            for(Drug drug:drugs){

                    if(!StringUtils.isEmpty(drug.getDrug_type_code()) && !StringUtils.isEmpty(drug.getDrug_item_imgname()))
                        drug.setDrug_path("img/drugimg/" + drug.getDrug_type_code() + "/" + drug.getDrug_item_imgname());

            }
            System.out.println(drugs);
            return drugs;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Drug> searchByType(String solrkey, String solrvalue) {
        SolrLink solrlink = new SolrLink();
        try {
            solrlink.setUp();
            int page = 1;
            int rows = 20;

            SolrQuery solrQuery = new SolrQuery(); // 构造搜索条件
            solrQuery.setQuery(solrkey + ":" + solrvalue); // 搜索关键词
            solrQuery.set("sort", "catch_date desc");
            // 设置分页
            solrQuery.setStart((Math.max(page, 1) - 1) * rows);
            solrQuery.setRows(rows);
            QueryResponse queryResponse = solrlink.getHttpSolrClient().query(solrQuery);
            List<Drug> drugs = queryResponse.getBeans(Drug.class);
            for(Drug drug:drugs){

                if(!StringUtils.isEmpty(drug.getDrug_type_code()) && !StringUtils.isEmpty(drug.getDrug_item_imgname()))
                    drug.setDrug_path("img/drugimg/" + drug.getDrug_type_code() + "/" + drug.getDrug_item_imgname());

            }
            System.out.println(drugs);
            return drugs;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
