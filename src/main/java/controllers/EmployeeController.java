package controllers;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.implementations.EmployeeDAOImpl;
import services.implementations.EmployeeServiceImpl;
import services.interfaces.EmployeeService;

@WebServlet("/employees")
public class EmployeeController extends HttpServlet {

    private EmployeeService employeeService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        this.employeeService = new EmployeeServiceImpl(new EmployeeDAOImpl());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null || action.equals("list")) {
            listEmployees(request, response);
        } else if (action.equals("delete")) {
            deleteEmployee(request, response);
        }else if (action.equals("edit")) {
            System.out.println("edit");
            showUpdateForm(request, response);
        }else if (action.equals("create")) {
            showAddForm(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("add")) {
            addEmployee(request, response);
        } else if (action.equals("update")) {
            updateEmployee(request, response);
        }
    }

    private void listEmployees(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        String position = request.getParameter("position");
        String department = request.getParameter("department");

        List<Employee> employees;

        // Si des critères de recherche sont présents, appeler la méthode de recherche
        if ((search != null && !search.isEmpty()) || (position != null && !position.isEmpty()) || (department != null && !department.isEmpty())) {
            employees = employeeService.searchEmployees(search, position, department);
        } else {
            // Sinon, lister tous les employés
            employees = employeeService.getAllEmployees();
        }

        request.setAttribute("employees", employees);
        request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
    }


    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeService.removeEmployee(id);
        response.sendRedirect(request.getContextPath() + "/employees?action=list");
    }


    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Optional<Employee> optionalEmployee = employeeService.findById(id);

        if (optionalEmployee.isPresent()) {
            Employee employee = optionalEmployee.get();
            request.setAttribute("employee", employee);
            request.getRequestDispatcher("/WEB-INF/views/updateEmployee.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Employee not found.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    private void addEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        int id = 1;

        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String position = request.getParameter("position");
        String department = request.getParameter("department");

        System.out.println("Adding employee: " + name + ", " + email + ", " + phone + ", " + position + ", " + department);

        employeeService.addEmployee(new Employee(id, name, email, phone, position, department));
        response.sendRedirect(request.getContextPath() + "/employees?action=list");
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String position = request.getParameter("position");
        String department = request.getParameter("department");

        System.out.println("Updating employee: " + id + ", " + name + ", " + email + ", " + phone + ", " + position + ", " + department);

        employeeService.updateEmployee(new Employee(id, name, email, phone, position, department));
        response.sendRedirect(request.getContextPath() + "/employees?action=list");
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/addEmployee.jsp").forward(request, response);
    }



}

