package com.shopping.control;

import com.shopping.bean.Drug;
import com.shopping.service.DrugService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2018/05/01.
 */
@Controller
@RequestMapping(value = "/DrugSearch")
public class DrugController {
    @Resource
    DrugService drugService;

    @RequestMapping(value = "/drugbynew", method = RequestMethod.POST)
    @ResponseBody
    public List<Drug> searchbynew(){
        List<Drug> result = drugService.searchByNew();
        return result;
    }

    @RequestMapping(value = "/drugbyhot", method = RequestMethod.POST)
    @ResponseBody
    public List<Drug> searchbyhot(){
        List<Drug> result = drugService.searchByNew();
        return result;
    }

    @RequestMapping(value = "/drugbytype", method = RequestMethod.POST)
    @ResponseBody
    public List<Drug> searchbytype(HttpServletRequest request){
        String solrkey = request.getParameter("solrkey");
        String solrvalue = request.getParameter("solrvalue");
        List<Drug> result = drugService.searchByType(solrkey, solrvalue);
        return result;
    }

}
