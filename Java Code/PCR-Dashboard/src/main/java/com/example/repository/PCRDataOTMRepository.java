package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.model.PCRDataOTM;
import com.example.model.PCRDataOTMId;

@Repository("pcrDataOTMRepository")
public interface PCRDataOTMRepository extends JpaRepository<PCRDataOTM, PCRDataOTMId>{

}
