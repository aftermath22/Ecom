package org.keval.ecom.service;

import org.keval.ecom.model.Items;
import org.keval.ecom.repo.ItemRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemService {
    @Autowired
    private ItemRepo repo;

    public List<Items> getAllItems(){
        return repo.findAll();
    }
    public Items getItemById(Long id){
        return repo.findById(id).orElse(null);
    }
    public Items addOrUpdateItem(Items item){
        return repo.save(item);
    }
    public void deleteItem(Long id){
        repo.deleteById(id);
    }



}
