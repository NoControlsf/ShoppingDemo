package com.shopping.dao;

import com.shopping.bean.Jsgs;
import com.shopping.service.MyService;
import com.shopping.util.SolrjTest;
import org.apache.commons.lang.StringUtils;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by NoControl on 2018/4/23.
 */
@Repository
public class MyDao implements MyService {
    @Override
    public List<Jsgs> searchByKey(String solrKey, String solrValue) {
        SolrjTest solrtest = new SolrjTest();
        try {
            solrtest.setUp();
            String keywords = solrValue;
            int page = 1;
            int rows = 10;

            SolrQuery solrQuery = new SolrQuery(); // 构造搜索条件
            solrQuery.setQuery(solrKey + ":*" + keywords + "*"); // 搜索关键词
            // 设置分页
            solrQuery.setStart((Math.max(page, 1) - 1) * rows);
            solrQuery.setRows(rows);
            QueryResponse queryResponse = solrtest.getHttpSolrClient().query(solrQuery);
            List<Jsgs> jsgss = queryResponse.getBeans(Jsgs.class);
            return jsgss;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Jsgs> searchHighLight(String solrKey, String solrValue) {
        SolrjTest solrtest = new SolrjTest();
        try {
            solrtest.setUp();
            String keywords = solrValue;
            int page = 1;
            int rows = 10;

            SolrQuery solrQuery = new SolrQuery(); // 构造搜索条件
            solrQuery.setQuery(solrKey + ":*" + keywords + "*"); // 搜索关键词
            // 设置分页
            solrQuery.setStart((Math.max(page, 1) - 1) * rows);
            solrQuery.setRows(rows);
            QueryResponse queryResponse = solrtest.getHttpSolrClient().query(solrQuery);
            List<Jsgs> jsgss = queryResponse.getBeans(Jsgs.class);

            for(Jsgs jsgs:jsgss){
                if(keywords != null){
                        if(!StringUtils.isEmpty(jsgs.getTaxpayer_name()))
                            jsgs.setTaxpayer_name(jsgs.getTaxpayer_name().replace(keywords,"<font color='red'>"+keywords+"</font>"));
                }
            }



            return jsgss;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Jsgs searchEntInfo(String solrKey, String solrValue) {
        SolrjTest solrtest = new SolrjTest();
        try {
            solrtest.setUp();
            String keywords = solrValue;

            SolrQuery solrQuery = new SolrQuery(); // 构造搜索条件
            solrQuery.setQuery(solrKey + ":*" + keywords + "*"); // 搜索关键词
            QueryResponse queryResponse = solrtest.getHttpSolrClient().query(solrQuery);
            List<Jsgs> jsgss = queryResponse.getBeans(Jsgs.class);
            return jsgss.get(0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
