package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.model.PCRDataWhole;
import com.example.model.PCRDataWholeId;

@Repository("pcrDataWholeRepository")
public interface PCRDataWholeRepository extends JpaRepository<PCRDataWhole, PCRDataWholeId>{

}
