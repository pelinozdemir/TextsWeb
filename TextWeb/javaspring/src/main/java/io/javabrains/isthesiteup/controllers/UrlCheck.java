package io.javabrains.isthesiteup.controllers;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import org.springframework.http.MediaType;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.RestController;


import io.javabrains.isthesiteup.TextServer;
import io.javabrains.isthesiteup.Texts;
import io.javabrains.isthesiteup.TextsMethod;





//import ch.qos.logback.classic.util.ClassicEnvUtil;
@Configuration
@RestController
public class UrlCheck {

    @Autowired 
    private TextServer server;
    TextsMethod newTexts=new TextsMethod();
    List<String> textslist=new ArrayList<String>();

  
  //metinleri mongoya kaydetmek icin  
     @RequestMapping(value="/save",method = RequestMethod.POST,consumes = {MediaType.APPLICATION_FORM_URLENCODED_VALUE})  
    public void getText(
    @RequestParam  Map<String, String> body) {
        server.delete(null);
        textslist.removeAll(textslist);
        try {
            
          var data =   body.values();
        
          System.out.println(data);
          body.forEach((t, u) ->{
            String name="Metin"+t.toString();
            Texts text = new Texts( name, u);
           // textslist.add(u.toString());
            try {
              server.insert(text);
            } catch (Exception e) {
               System.out.println(e);
            }finally{
              
              

            }
          } );
         // newTexts.createNewText(textslist,textslist.size());
         
        } catch (SecurityException e) {
            // TODO Auto-generated catch block
            System.out.println(e);
        }
      
    
        
    }
    //yeni texti olusturan method
    @RequestMapping(value="/newtext",method = RequestMethod.POST,consumes = {MediaType.APPLICATION_FORM_URLENCODED_VALUE})  
    public String getNewText(
    @RequestParam  Map<String, String> body) {
       // server.delete(null);
        textslist.removeAll(textslist);
        try {
            
        //  var data =   body.values();
        
         // System.out.println(data);
          body.forEach((t, u) ->{
      
            textslist.add(u.toString());
          
          } );
     
         
        } catch (SecurityException e) {
            // TODO Auto-generated catch block
            System.out.println(e);
        }
      
      String result=newTexts.createNewText(textslist,textslist.size());
      String name="Result";
      Texts text = new Texts( name, result);
   
      try {
        server.insert(text);
      } catch (Exception e) {
         System.out.println(e);
      }
        return result;
    }
  
               

            
    
}
