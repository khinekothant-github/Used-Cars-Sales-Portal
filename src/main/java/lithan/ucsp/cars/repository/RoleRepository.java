package lithan.ucsp.cars.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import lithan.ucsp.cars.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Integer> {

  public Role findByRole(String role);
}