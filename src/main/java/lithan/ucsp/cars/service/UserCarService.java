package lithan.ucsp.cars.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lithan.ucsp.cars.entity.Car;
import lithan.ucsp.cars.entity.CarBidding;
import lithan.ucsp.cars.entity.TestDrive;
import lithan.ucsp.cars.entity.UserAccount;

public interface UserCarService {

  List<Car> listUserCar();

  void postCar(MultipartFile file, Car car) throws Exception;

  void editCar(Car car);

  void activateCarPost(int id);

  void deactivateCarPost(int id);

  List<CarBidding> listCarBid();

  Car getCarById(int id);

  void postCarBidding(CarBidding carBidding);

  int highestBidding(int idCar);

  void saveTestDrive(String date, UserAccount user, Car car);

  List<TestDrive> listTestDrive();

  void saveUploadPicture(MultipartFile file, Car car) throws Exception;
}