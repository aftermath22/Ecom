package org.keval.ecom.repo;

import org.keval.ecom.model.Blacklist;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BlacklistRepo extends JpaRepository<Blacklist, String> {
}
