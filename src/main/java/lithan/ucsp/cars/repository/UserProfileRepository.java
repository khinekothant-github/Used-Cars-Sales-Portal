package lithan.ucsp.cars.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import lithan.ucsp.cars.entity.UserProfile;

public interface UserProfileRepository extends JpaRepository<UserProfile, Integer> {

}