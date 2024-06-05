package lithan.ucsp.cars.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lithan.ucsp.cars.entity.Car;
import lithan.ucsp.cars.service.CarService;
import lithan.ucsp.cars.service.UserCarService;

@Controller
@RequestMapping("/cars")
public class CarController {

  @Autowired
  private CarService carService;

  @Autowired
  private UserCarService userCarService;

  // Display the main car page
  @GetMapping("")
  public String carPage(Model model) {
    // Retrieve list of cars from the service layer
    List<Car> listCar = carService.listCar();

    // Add the list of cars to the model to be rendered in the view
    model.addAttribute("listCar", listCar);

    // Return the name of the view template to be rendered
    return "cars";
  }

  // Display details of a specific car
  @GetMapping("/{make}/{model}/{year}/{id_car}")
  public String carDetails(@PathVariable("id_car") int id, Model model) {
    // Retrieve car details by ID from the service layer
    Car car = carService.getCarById(id);

    // Retrieve the highest bidding price for the car from the service layer
    int highestBidding = userCarService.highestBidding(id);

    // Add car details and highest bidding price to the model to be rendered in the view
    model.addAttribute("car", car);
    model.addAttribute("highestBidding", highestBidding);

    // Return the name of the view template to be rendered
    return "car-details";
  }

  // Search for cars based on a keyword
  @GetMapping(value = "", params = "keyword")
  public String searchCar(@RequestParam("keyword") String keyword, Model model) {
    // Search for cars based on the provided keyword
    List<Car> searchCar = carService.searchCar(keyword);

    // Add the search results to the model to be rendered in the view
    model.addAttribute("listCar", searchCar);

    // Return the name of the view template to be rendered
    return "cars";
  }

  // Search for cars within a price range
  @GetMapping(value = "", params = { "low", "high" })
  public String searchCarByPriceRange(@RequestParam("low") int low, @RequestParam("high") int high, Model model) {
    // Search for cars within the specified price range
    List<Car> searchCar = carService.searchCarByPriceRange(low, high);

    // Add the search results to the model to be rendered in the view
    model.addAttribute("listCar", searchCar);

    // Return the name of the view template to be rendered
    return "cars";
  }

}
