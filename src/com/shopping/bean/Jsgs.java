package com.shopping.bean;

import org.apache.solr.client.solrj.beans.Field;

/**
 * Created by NoControl on 2018/4/20.
 */
public class Jsgs {
    @Field("id")
    private String id; //纳税人识别号
    @Field
    private String taxpayer_name; //纳税人名称
    @Field
    private String organization_code;//组织机构代码
    @Field
    private String registered_address;//注册地址
    @Field
    private String legal_representative;//法定代表人或者负责人姓名、性别、证件名称及号码
    @Field
    private String financial_officer;//负有直接责任的财务负责人姓名、性别、证件名称及号码
    @Field
    private String agency;//负有直接责任的中介机构信息及其从业人员信息
    @Field
    private String case_nature;//案件性质
    @Field
    private String illegal_facts;//主要违法事实
    @Field
    private String punishment_situation;//相关法律依据及税务处理处罚情况
    @Field
    private String bt_time;//公布日期
    @Field
    private String province;//所属省份
    @Field
    private String city;//所属城市
    @Field
    private String company_link;//链接

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTaxpayer_name() {
        return taxpayer_name;
    }

    public void setTaxpayer_name(String taxpayer_name) {
        this.taxpayer_name = taxpayer_name;
    }

    public String getOrganization_code() {
        return organization_code;
    }

    public void setOrganization_code(String organization_code) {
        this.organization_code = organization_code;
    }

    public String getRegistered_address() {
        return registered_address;
    }

    public void setRegistered_address(String registered_address) {
        this.registered_address = registered_address;
    }

    public String getLegal_representative() {
        return legal_representative;
    }

    public void setLegal_representative(String legal_representative) {
        this.legal_representative = legal_representative;
    }

    public String getFinancial_officer() {
        return financial_officer;
    }

    public void setFinancial_officer(String financial_officer) {
        this.financial_officer = financial_officer;
    }

    public String getAgency() {
        return agency;
    }

    public void setAgency(String agency) {
        this.agency = agency;
    }

    public String getCase_nature() {
        return case_nature;
    }

    public void setCase_nature(String case_nature) {
        this.case_nature = case_nature;
    }

    public String getIllegal_facts() {
        return illegal_facts;
    }

    public void setIllegal_facts(String illegal_facts) {
        this.illegal_facts = illegal_facts;
    }

    public String getPunishment_situation() {
        return punishment_situation;
    }

    public void setPunishment_situation(String punishment_situation) {
        this.punishment_situation = punishment_situation;
    }

    public String getBt_time() {
        return bt_time;
    }

    public void setBt_time(String bt_time) {
        this.bt_time = bt_time;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCompany_link() {
        return company_link;
    }

    public void setCompany_link(String company_link) {
        this.company_link = company_link;
    }

    @Override
    public String toString() {
        return "Jsgs{" +
                "id='" + id + '\'' +
                ", taxpayer_name='" + taxpayer_name + '\'' +
                ", organization_code='" + organization_code + '\'' +
                ", registered_address='" + registered_address + '\'' +
                ", legal_representative='" + legal_representative + '\'' +
                ", financial_officer='" + financial_officer + '\'' +
                ", agency='" + agency + '\'' +
                ", case_nature='" + case_nature + '\'' +
                ", illegal_facts='" + illegal_facts + '\'' +
                ", punishment_situation='" + punishment_situation + '\'' +
                ", bt_time='" + bt_time + '\'' +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", company_link='" + company_link + '\'' +
                '}';
    }
}
