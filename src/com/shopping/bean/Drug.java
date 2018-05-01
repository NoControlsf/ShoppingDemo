package com.shopping.bean;

import org.apache.solr.client.solrj.beans.Field;

/**
 * Created by Administrator on 2018/05/01.
 */
public class Drug {
    @Field("id")
    private String id;
    @Field("drug_item_code")
    private String drug_item_code;
    @Field("drug_type_name")
    private String drug_type_name;
    @Field("drug_productcompany")
    private String drug_productcompany;
    @Field("catch_date")
    private String catch_date;
    @Field("drug_item_name")
    private String drug_item_name;
    @Field("drug_item_imgname")
    private String drug_item_imgname;
    @Field("drug_type_code")
    private String drug_type_code;
    @Field("drug_size")
    private String drug_size;

    private String drug_path;

    public String getDrug_path() {
        return drug_path;
    }

    public void setDrug_path(String drug_path) {
        this.drug_path = drug_path;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDrug_item_code() {
        return drug_item_code;
    }

    public void setDrug_item_code(String drug_item_code) {
        this.drug_item_code = drug_item_code;
    }

    public String getDrug_type_name() {
        return drug_type_name;
    }

    public void setDrug_type_name(String drug_type_name) {
        this.drug_type_name = drug_type_name;
    }

    public String getDrug_productcompany() {
        return drug_productcompany;
    }

    public void setDrug_productcompany(String drug_productcompany) {
        this.drug_productcompany = drug_productcompany;
    }

    public String getCatch_date() {
        return catch_date;
    }

    public void setCatch_date(String catch_date) {
        this.catch_date = catch_date;
    }

    public String getDrug_item_name() {
        return drug_item_name;
    }

    public void setDrug_item_name(String drug_item_name) {
        this.drug_item_name = drug_item_name;
    }

    public String getDrug_item_imgname() {
        return drug_item_imgname;
    }

    public void setDrug_item_imgname(String drug_item_imgname) {
        this.drug_item_imgname = drug_item_imgname;
    }

    public String getDrug_type_code() {
        return drug_type_code;
    }

    public void setDrug_type_code(String drug_type_code) {
        this.drug_type_code = drug_type_code;
    }

    public String getDrug_size() {
        return drug_size;
    }

    public void setDrug_size(String drug_size) {
        this.drug_size = drug_size;
    }

    @Override
    public String toString() {
        return "Drug{" +
                "id='" + id + '\'' +
                ", drug_item_code='" + drug_item_code + '\'' +
                ", drug_type_name='" + drug_type_name + '\'' +
                ", drug_productcompany='" + drug_productcompany + '\'' +
                ", catch_date='" + catch_date + '\'' +
                ", drug_item_name='" + drug_item_name + '\'' +
                ", drug_item_imgname='" + drug_item_imgname + '\'' +
                ", drug_type_code='" + drug_type_code + '\'' +
                ", drug_size='" + drug_size + '\'' +
                '}';
    }
}
