package lithan.ucsp.cars.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import lithan.ucsp.cars.entity.ProfilePicture;

public interface ProfilePictureRepository extends JpaRepository<ProfilePicture, Integer> {

}