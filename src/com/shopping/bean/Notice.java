package com.shopping.bean;

import org.apache.solr.client.solrj.beans.Field;

/**
 * Created by NoControl on 2018/4/20.
 */
public class Notice {
    @Field("id")
    private String id;
    @Field
    private String title;
    @Field
    private String subject;
    @Field
    private String description;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
