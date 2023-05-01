package io.javabrains.isthesiteup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TextServer 
{
  @Autowired
  private TextRepository repo;

  public Texts insert(Texts a)
  {
    
    return repo.save(a);
  }
  public void delete(Texts a)
  {
    
   repo.deleteAll();
  }
  
} 
