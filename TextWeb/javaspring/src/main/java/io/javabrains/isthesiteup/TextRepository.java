
 package io.javabrains.isthesiteup;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface TextRepository extends MongoRepository<Texts,String> {

    
}