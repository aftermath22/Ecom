package org.keval.ecom.repo;

import org.keval.ecom.model.Items;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ItemRepo extends JpaRepository<Items, Long> {

}
