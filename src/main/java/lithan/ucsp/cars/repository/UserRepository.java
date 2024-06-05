package lithan.ucsp.cars.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import lithan.ucsp.cars.entity.UserAccount;

public interface UserRepository extends JpaRepository<UserAccount, Integer> {

  public UserAccount findByUsername(String username);

}