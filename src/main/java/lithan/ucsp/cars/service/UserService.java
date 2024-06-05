package lithan.ucsp.cars.service;

import org.springframework.web.multipart.MultipartFile;

import lithan.ucsp.cars.entity.UserAccount;
import lithan.ucsp.cars.entity.UserProfile;

public interface UserService {

  void saveUser(UserAccount user, UserProfile profile);

  UserAccount findByUsername(String username);

  UserAccount getUserLogin();

  void saveImage(MultipartFile file, UserProfile profile) throws Exception;

  void editUserProfile(UserProfile profile);

  UserProfile getProfile(int idProfile);
}