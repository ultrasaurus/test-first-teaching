
import java.util.*;

public interface EmployeeRepository {
    public void clear();
    public int countEmployees();
    public Employee createEmployee(String name, String type);
    public void saveEmployee(Employee employee);
    public Employee loadEmployee(int id);
    public List findAllEmployees();
    public void close();
}
