package com.shopping.control;

import com.shopping.bean.Jsgs;
import com.shopping.service.MyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "/EntSearchEngine")
public class MyController {

    @Resource
    MyService myService;

    //下拉列表
    @RequestMapping(value = "/EnterpriseInfo", method = RequestMethod.POST)
    @ResponseBody
    public List<Jsgs> SearchByKeyword(HttpServletRequest request){
        String solrkey = request.getParameter("solrkey");
        String solrvalue = request.getParameter("solrvalue");
        List<Jsgs> result = myService.searchByKey(solrkey, solrvalue);
        return result;
    }

    //查询列表
    @RequestMapping(value = "/getEntList", method = RequestMethod.POST)
    @ResponseBody
    public List<Jsgs> SearchList(HttpServletRequest request){
        String solrkey = request.getParameter("solrkey");
        String solrvalue = request.getParameter("solrvalue");
        if(solrvalue != "") {
            List<Jsgs> result = myService.searchHighLight(solrkey, solrvalue);
            return result;
        }else {
            return null;
        }
    }

    //详细信息
    @RequestMapping(value = "/getEntInfo", method = RequestMethod.POST)
    @ResponseBody
    public Jsgs getEntInfo(HttpServletRequest request){
        String solrkey = request.getParameter("solrkey");
        String solrvalue = request.getParameter("solrvalue");
        Jsgs result = myService.searchEntInfo(solrkey, solrvalue);
        return result;
    }

}
