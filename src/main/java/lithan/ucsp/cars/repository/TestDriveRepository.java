package lithan.ucsp.cars.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import lithan.ucsp.cars.entity.TestDrive;

public interface TestDriveRepository extends JpaRepository<TestDrive, Integer> {

}