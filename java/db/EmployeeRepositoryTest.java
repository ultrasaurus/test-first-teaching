
import java.util.*;

// todo: test that table exists?
// todo: test that table has correct fields?
// todo: add a second object/table (address?)

public class EmployeeRepositoryTest extends Test
{
    private EmployeeRepository createRepository()
    {
        return new MemoryEmployeeRepository();
    }

    public void testClear() throws Exception
    {
        EmployeeRepository repository = createRepository();
        repository.clear();
        assertEquals(0, repository.countEmployees());
        Employee alex = repository.createEmployee("Alex Chaffee", "Teacher");
        assertEquals(1, repository.countEmployees());
        repository.clear();
        assertEquals(0, repository.countEmployees());
        repository.close();
    }

    public void testCreate() throws Exception
    {
        EmployeeRepository repository = createRepository();
        repository.clear();
        Employee alex = repository.createEmployee("Alex Chaffee", "Teacher");
        assertEquals("Alex Chaffee", alex.getName());
        assertEquals("Teacher", alex.getType());
        assertTrue(alex.getId() != 0);
        Employee nick = repository.createEmployee("Nick Chaffee", "Translator");
        assertTrue(nick.getId() != 0);
        assertTrue(nick.getId() != alex.getId());
    }

    public void testSaveAndCount() throws Exception
    {
        EmployeeRepository repository = createRepository();
        repository.clear();
        Employee alex = repository.createEmployee("Alex Chaffee", "Teacher");
        repository.saveEmployee(alex);
        assertEquals(1, repository.countEmployees());
        repository.close();
    }

    public void testSaveAndLoad() throws Exception
    {
        EmployeeRepository repository = createRepository();
        repository.clear();
        Employee alex = repository.createEmployee("Alex Chaffee", "Teacher");
        repository.saveEmployee(alex);
        Employee loadedAlex = repository.loadEmployee(alex.getId());
        assertEquals(alex, loadedAlex);
        repository.close();
    }

    public void testSaveAndLoadTwoEmployees() throws Exception
    {
        EmployeeRepository repository = createRepository();
        repository.clear();
        Employee alex = repository.createEmployee("Alex Chaffee", "Teacher");
        repository.saveEmployee(alex);
        Employee nick = repository.createEmployee("Nick Chaffee", "Translator");
        repository.saveEmployee(nick);
        assertEquals(2, repository.countEmployees());
        Employee loadedNick = repository.loadEmployee(nick.getId());
        assertEquals(nick, loadedNick);
        repository.close();
    }

    public void testFindAllEmployees() throws Exception
    {
        EmployeeRepository repository = createRepository();
        repository.clear();
        Employee alex = repository.createEmployee("Alex Chaffee", "Teacher");
        repository.saveEmployee(alex);
        Employee nick = repository.createEmployee("Nick Chaffee", "Translator");
        repository.saveEmployee(nick);

        List all = repository.findAllEmployees();
        assertContains(all, alex);
        assertContains(all, nick);
        repository.close();
    }

    public void testChangeData() throws Exception
    {
        EmployeeRepository repository = createRepository();
        repository.clear();
        Employee nick = repository.createEmployee("Nick Chaffee", "Translator");
        repository.saveEmployee(nick);
        nick.setType("Sous chef");
        repository.saveEmployee(nick);
        nick = repository.loadEmployee(nick.getId());
        assertEquals("Sous chef", nick.getType());
        repository.close();
    }

}
