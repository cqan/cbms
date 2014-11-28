package com.cqan;


import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

/**
 * Created by huiwu on 2014/9/20.
 */
@MappedSuperclass  
public class IdLongEntity {

	private Long id;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO) 
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
