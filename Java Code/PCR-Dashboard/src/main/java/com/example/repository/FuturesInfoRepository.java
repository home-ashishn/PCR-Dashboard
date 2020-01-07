package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.model.FuturesInfo;
import com.example.model.FuturesInfoId;

@Repository("futuresInfoRepository")
public interface FuturesInfoRepository extends JpaRepository<FuturesInfo, FuturesInfoId>{

}
