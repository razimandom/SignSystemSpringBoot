package com.example.SpringMySQL.controllers;

import com.example.SpringMySQL.models.DocModel;
import com.example.SpringMySQL.models.DocModelRepo;
import com.example.SpringMySQL.models.KeyModelRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

@Controller
public class MainController {

    @Autowired
    DocModelRepo docRepo;

    @Autowired
    KeyModelRepo keyRepo;

    @RequestMapping("/")
    public ModelAndView doHome(){
        ModelAndView mv = new ModelAndView( "index");
        mv.addObject("lists", docRepo.findAll());
        return mv;
    }

    @RequestMapping("/genkey/")
    public ModelAndView doGenKey(){
        ModelAndView mv = new ModelAndView( "genkey/index");
        mv.addObject("lists", keyRepo.findAll());
        return mv;
    }

    @RequestMapping("/signdoc/")
    public ModelAndView doSignDoc(){
        ModelAndView mv = new ModelAndView( "signdoc/index");

        return mv;
    }

    @RequestMapping( value = "/save", method = RequestMethod.POST)
    public ModelAndView doSave(
            @RequestParam("id") String id,
            @RequestParam("req_name") String reqName,
            @RequestParam("sign_email") String signEmail,
            @RequestParam("doc_type") String docType,
            @RequestParam("doc_deadline") String docDeadline
    ) throws NoSuchAlgorithmException {


        ModelAndView mv = new ModelAndView("redirect:/");
        DocModel docs;

        if(!id.isEmpty()){
            docs = (DocModel)docRepo.findOne(Integer.parseInt(id));
        }else{
            docs = new DocModel();
        }

        // Fetch current date and time

        ZoneId zoneIdMYS = ZoneId.of("Asia/Kuala_Lumpur");
        LocalDateTime localDateTime = LocalDateTime.now(zoneIdMYS);
        DateTimeFormatter formatterTimeStamp = DateTimeFormatter.ofPattern("ddMMyyyy-HHmmss-A-N");
        DateTimeFormatter formatterDate = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String currentTimeStamp = localDateTime.format(formatterTimeStamp);
        String currentDate = localDateTime.format(formatterDate);

        // Generate MD5 using timestamp

        String docIdTimestamp = currentTimeStamp;
        MessageDigest docIdTimestampMD5 = MessageDigest.getInstance("MD5");
        docIdTimestampMD5.update(docIdTimestamp.getBytes(), 0, docIdTimestamp.length());
        String docIdMD5String = new BigInteger(1, docIdTimestampMD5.digest()).toString(16);

        // Add data to DB

        docs.setReq_name(reqName);
        docs.setSign_email(signEmail);
        docs.setDoc_type(docType);
        docs.setDoc_deadline(docDeadline);
        docs.setReq_time_created(currentTimeStamp);
        docs.setReq_date_created(currentDate);
        docs.setDoc_md5(docIdMD5String);
        docs.setDoc_status("Pending");
        docRepo.save(docs);
        return mv;
    }

    @RequestMapping( value = "/view/{id}", method = RequestMethod.GET)
    public ModelAndView doView(@PathVariable("id") int id){
        ModelAndView mv = new ModelAndView("view");
        mv.addObject("lists", docRepo.findOne(id));
        return mv;
    }

    @RequestMapping( value = "/delete/{id}", method = RequestMethod.GET)
    public ModelAndView doDelete(@PathVariable("id") int id){
        ModelAndView mv = new ModelAndView("redirect:/");
        docRepo.delete(id);
        return mv;
    }

    @RequestMapping( value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView doEdit(@PathVariable("id") int id){
        ModelAndView mv = new ModelAndView("edit");
        mv.addObject("lists", docRepo.findOne(id));
        return mv;
    }


}
