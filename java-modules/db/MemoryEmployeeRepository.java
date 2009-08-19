
import java.util.*;

public class MemoryEmployeeRepository implements EmployeeRepository
{
    private Map contents = new HashMap();
    private int nextId = 1;

    public MemoryEmployeeRepository()
    {
    }

    synchronized public void clear()
    {
        contents = new HashMap();
        nextId = 1;
    }

    public void close()
    {
    }

    public int countEmployees()
    {
        return contents.size();
    }

    public Employee createEmployee(String name, String type)
    {
        Employee employee = new Employee(nextId(), name, type);
        saveEmployee(employee);
        return employee;
    }

    synchronized private int nextId()
    {
        return nextId++;
    }

    public void saveEmployee(Employee employee)
    {
        contents.put(new Integer(employee.getId()), employee);
    }

    public Employee loadEmployee(int id)
    {
        return (Employee) contents.get(new Integer(id));
    }

    public List findAllEmployees()
    {
        return new ArrayList(contents.values());
    }
}
