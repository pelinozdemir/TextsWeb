package io.javabrains.isthesiteup;


import java.util.Arrays;
import java.util.List;



public class TextsMethod {
  
    public String createnewTextwithChar(List<String> texts,int textsnumber){
        List<String> first = Arrays.asList(texts.get(0).split(" "));
        char[] second = Arrays.asList(texts.get(1).split(" ")).get(0).toCharArray();
        int cmp=0;
  String addtext=" ";
         for (int z=texts.get(0).split(" ").length-1; z>=0;z--) {
            for (int k = 0; k < first.get(z).toCharArray().length; k++) {
                for (int i=0; i<second.length;i++) {
             
                    
                    if( first.get(z).toCharArray()[k]==second[i]){
                      
                        
                        cmp++;
                        if(k<first.get(z).toCharArray().length-1){
                            k++;
                           
                        }
                    if(cmp>=3){
                       
                        if(z<texts.get(0).split(" ").length-1){
                            for (int j = 0; j <z; j++) {
                             

                       addtext+=" "+first.get(j) ;
                       
                            }
                            texts.set(0, addtext+" "+texts.get(1));
                            
                        }else{
                            texts.set(0, (texts.get(0).replaceAll( first.get(z), "") +texts.get(1)));
                           
                        }
                       // System.out.println(texts.get(0). replaceAll( Arrays.asList(texts.get(0).split(" ")).get(z), "") +texts.get(1));
                       texts.remove(1);
                       if(texts.size()==1){
                        return texts.get(0);
                       }else if(texts.size()>1){
                        return createNewText(texts, textsnumber);
                       }
                    }
                   
                    }
                    else{
                        cmp=0;
                        
                    }
       
            }
    
            }
        }
         
        return "verilen metinler birlestirilebilir degil";



    }
    public String createNewText(List<String> texts,int textsnumber){
       
        String compare=texts.get(0);
        int firstTextlen=texts.get(0).split(" +").length;
        List<String> convertList= Arrays.asList( texts.get(0).split(" +"));
       
    
   for( int i =0;i<firstTextlen ; i++) {
    
  
    
   if(texts.get(1).trim().contains(compare.trim())){
   
    texts.set(0, (texts.get(0)+texts.get(1).replaceFirst(compare, "")).trim());
    texts.remove(1);
  
    if(texts.size()>1){
        return createNewText(texts, texts.size());
    }else if(texts.size()==1) {
        
               return texts.get(0);
        
    }
   }else if(i==(firstTextlen-1) && !texts.get(1).contains(compare)){
   return createnewTextwithChar(texts, textsnumber);
   }
   compare= compare.replaceFirst(convertList.get(i).toString(), "").trim();
  

 }

  return createnewTextwithChar(texts, textsnumber);

 
    }
    
   
}
