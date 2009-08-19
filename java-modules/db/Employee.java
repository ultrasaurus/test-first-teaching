//todo: redo as stock

public class Employee {
    private int id;
    private String name;
    private String type;

    public Employee(int id, String name, String type) {
        this.id = id;
        this.name = name;
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Employee)) return false;

        final Employee employee = (Employee) o;

        if (id != employee.id) return false;
        if (name != null ? !name.equals(employee.name) : employee.name != null) return false;
        if (type != null ? !type.equals(employee.type) : employee.type != null) return false;

        return true;
    }

    public int hashCode() {
        int result;
        result = id;
        result = 29 * result + (name != null ? name.hashCode() : 0);
        result = 29 * result + (type != null ? type.hashCode() : 0);
        return result;
    }

    public String toString() {
        return "Employee[id=" + id + ",name=" + name + ",type=" + type + "]";
    }

}
