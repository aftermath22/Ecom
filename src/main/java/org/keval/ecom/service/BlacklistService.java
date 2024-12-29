package org.keval.ecom.service;

import org.keval.ecom.model.Blacklist;
import org.keval.ecom.repo.BlacklistRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlacklistService {
    @Autowired
    private BlacklistRepo repo;
    public List<Blacklist> getAllBlacks(){
        return repo.findAll();
    }
    public Blacklist getBlackById(String em){
        return repo.findById(em).orElse(null);
    }
    public Blacklist addBlack(Blacklist black){
        return repo.save(black);
    }
    public Blacklist updateBlack(Blacklist black){
        return repo.save(black);
    }
    public void deleteBlack(String em){
        repo.deleteById(em);
    }
}
