package lithan.ucsp.cars.service;

import java.util.List;

import lithan.ucsp.cars.entity.Car;
import lithan.ucsp.cars.entity.CarBidding;
import lithan.ucsp.cars.entity.UserAccount;
import lithan.ucsp.cars.entity.UserProfile;

public interface AdminService {

  void editUser(UserProfile profile);

  void markAsAdmin(int idUser);

  UserProfile getProfileById(int idCar);

  List<UserAccount> listUser();

  List<UserAccount> listAdmin();

  List<Car> listCar();

  List<CarBidding> listCarBid();

  void approveCarBid(int idBid);

  void denyCarBid(int idBid);

  void deleteCar(int id);
}