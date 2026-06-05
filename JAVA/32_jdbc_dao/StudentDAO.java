import java.sql.*;

public class StudentDAO {
    private Connection conn;
    StudentDAO(Connection conn) { this.conn = conn; }

    void insert(int id, String name, int age) throws SQLException {
        String sql = "INSERT INTO students(id, name, age) VALUES (?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setInt(3, age);
            ps.executeUpdate();
        }
    }

    void updateName(int id, String newName) throws SQLException {
        String sql = "UPDATE students SET name = ? WHERE id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, newName);
            ps.setInt(2, id);
            ps.executeUpdate();
        }
    }

    public static void main(String[] args) throws SQLException {
        Connection conn = DriverManager.getConnection("jdbc:sqlite:students.db");
        StudentDAO dao = new StudentDAO(conn);
        dao.insert(201, "David", 22);
        dao.updateName(201, "Dave");
        conn.close();
    }
}
