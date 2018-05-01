package com.shopping.util;

import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.impl.XMLResponseParser;
import org.junit.Before;

/**
 * Created by Administrator on 2018/05/01.
 */
public class SolrLink {
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
        String url = "http://localhost:8983/solr/drug/";
        HttpSolrClient httpSolrClient = new HttpSolrClient(url);
        httpSolrClient.setParser(new XMLResponseParser()); // 设置响应解析器
        httpSolrClient.setConnectionTimeout(500); // 建立连接的最长时间
        this.httpSolrClient = httpSolrClient;
    }
}
