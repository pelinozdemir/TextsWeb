package io.javabrains.isthesiteup;


import org.springframework.data.mongodb.core.mapping.Document;

import lombok.Data;

@Data
@Document
public class Texts {

    private String name;
    private String text;
    public Texts( String name, String text) {
        
        this.name = name;
        this.text = text;
    }
    
}
