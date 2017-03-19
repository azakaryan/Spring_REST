package app.model.repository;

import app.model.Customer;
import app.model.Order;
import org.springframework.data.repository.CrudRepository;

public interface OrderRepository extends CrudRepository<Order, Long> {

    Order findByCustomer(Customer customer);
}
