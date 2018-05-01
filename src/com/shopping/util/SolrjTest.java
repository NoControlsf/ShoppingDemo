package com.shopping.util;

import com.shopping.bean.Jsgs;
import com.shopping.bean.Notice;

import org.apache.commons.lang.StringUtils;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.impl.XMLResponseParser;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;
//测试类
/**
 * Created by NoControl on 2018/4/20.
 */
public class SolrjTest {
    private HttpSolrClient httpSolrClient;

    public HttpSolrClient getHttpSolrClient() {
        return httpSolrClient;
    }

    public void setHttpSolrClient(HttpSolrClient httpSolrClient) {
        this.httpSolrClient = httpSolrClient;
    }

    @Before
    public void setUp() throws Exception {
        // 在url中指定core名称：notice
        //String url = "http://localhost:8983/solr/core0/";
        String url = "http://localhost:8983/solr/mynode/";
        HttpSolrClient httpSolrClient = new HttpSolrClient(url);
        httpSolrClient.setParser(new XMLResponseParser()); // 设置响应解析器
        httpSolrClient.setConnectionTimeout(500); // 建立连接的最长时间
        this.httpSolrClient = httpSolrClient;
    }

    //测试添加
    @Test
    public void testAdd() throws IOException, SolrServerException {
        Notice notice = new Notice();
        String desc = "该应用场景为AdMaster DMP缓存存储需求，DMP需要管理非常多的第三方id数据，其中包括各媒体cookie与自身cookie（以下统称admckid）的mapping关系，还包括了admckid的人口标签、移动端id（主要是idfa和imei）的人口标签，以及一些黑名单id、ip等数据。";
        notice.setId(UUID.randomUUID().toString());
        notice.setTitle("Redis百亿级Key存储方案");
        notice.setSubject("该应用场景为AdMaster DMP缓存存储需求");
        notice.setDescription(desc);
        this.httpSolrClient.addBean(notice);
        this.httpSolrClient.commit();
    }

    //测试查询
    @Test
    public void testQuery() throws SolrServerException, IOException{
        String keywords = "南京";
        int page = 1;
        int rows = 10;

        SolrQuery solrQuery = new SolrQuery(); // 构造搜索条件
        solrQuery.setQuery("taxpayer_name:*" + keywords + "*"); // 搜索关键词
        // 设置分页
        solrQuery.setStart((Math.max(page, 1) - 1) * rows);
        solrQuery.setRows(rows);

        QueryResponse queryResponse = this.httpSolrClient.query(solrQuery);
        List<Jsgs> jsgss = queryResponse.getBeans(Jsgs.class);
        for (Jsgs jsgs : jsgss) {
            System.out.println(jsgs.toString());
        }
    }

    //高亮
    @Test
    public void testHighlighting() throws SolrServerException, IOException{
        String keywords = "无锡";
        int page = 1;
        int rows = 10;

        SolrQuery solrQuery = new SolrQuery(); // 构造搜索条件
        solrQuery.setQuery("city:" + keywords); // 搜索关键词
        // 设置分页
        solrQuery.setStart((Math.max(page, 1) - 1) * rows);
        solrQuery.setRows(rows);

        // 是否需要高亮
        boolean isHighlighting = !StringUtils.equals("*", keywords) && StringUtils.isNotEmpty(keywords);
        if (isHighlighting) {
            // 设置高亮
            solrQuery.setHighlight(true); // 开启高亮组件
            solrQuery.addHighlightField("taxpayer_name");// 高亮字段
            solrQuery.addHighlightField("registered_address");
            solrQuery.setHighlightSimplePre("<span style='color:red;'>");// 标记，高亮关键字前缀
            solrQuery.setHighlightSimplePost("</span>");// 后缀
        }

        QueryResponse queryResponse = this.httpSolrClient.query(solrQuery);
        List<Jsgs> jsgss = queryResponse.getBeans(Jsgs.class);

        if (isHighlighting) {
            // 将高亮的标题数据写回到数据对象中
            Map<String, Map<String, List<String>>> map = queryResponse.getHighlighting();
            for (Map.Entry<String, Map<String, List<String>>> highlighting : map.entrySet()) {
                for (Jsgs jsgs : jsgss) {
                    if (!highlighting.getKey().equals(jsgs.getId().toString())) {
                        continue;
                    }
                    if(highlighting.getValue().get("taxpayer_name") != null){
                        jsgs.setTaxpayer_name(StringUtils.join(highlighting.getValue().get("taxpayer_name"), ""));
                    }
                    if(highlighting.getValue().get("registered_address") != null){
                        jsgs.setRegistered_address(StringUtils.join(highlighting.getValue().get("registered_address"),""));
                    }
                    break;
                }
            }
        }

        for (Jsgs jsgs : jsgss) {
            System.out.println(jsgs.toString());
        }
    }

    //删除
    @Test
    public void testDelete() throws SolrServerException, IOException{
        String id = "30a6d598-9762-455a-94f7-21fa011640d1";
        this.httpSolrClient.deleteById(id);
        this.httpSolrClient.commit();
    }


}
