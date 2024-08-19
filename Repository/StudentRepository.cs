using NPOI.SS.Formula.Functions;
using StudentCRUD.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace StudentCRUD.Repository
{
    public class StudentRepository
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["StudentDB"].ToString();

        //INSERT
        public bool InsertStudent(Student student)
        {
            int id = 0;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_InsertStudent", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StudentID", student.StudentID);
                cmd.Parameters.AddWithValue("@Name", student.Name);
                cmd.Parameters.AddWithValue("@DOB", student.DOB);
                cmd.Parameters.AddWithValue("@Created_On", student.Created_On);
                conn.Open();
                id = cmd.ExecuteNonQuery();
                conn.Close();
            }
            if (id > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        //public void InsertStudent(Student student)
        //{
        //    using (SqlConnection conn = new SqlConnection(connectionString))
        //    {
        //        SqlCommand cmd = new SqlCommand("sp_InsertStudent", conn);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("@Name", student.Name);
        //        cmd.Parameters.AddWithValue("@DOB", student.DOB);
        //        conn.Open();
        //        cmd.ExecuteNonQuery();
        //        conn.Close();

        //    }
        //}

        //GET_BY_ID

        public Student GetStudentById(string StudentId)
        {
            Student student = null;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_GetStudentById";
                cmd.Parameters.AddWithValue("@StudentID", StudentId);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    student = new Student
                    {
                        StudentID = reader["StudentID"].ToString(),
                        Name = reader["Name"].ToString(),
                        DOB = Convert.ToDateTime(reader["DOB"]),
                        Created_On = Convert.ToDateTime(reader["Created_On"])
                    };
                }
                conn.Close();
            }
            return student;
        }



        //public Student GetStudentById(string StudentId)
        //{
        //    Student student = null;
        //    using (SqlConnection conn = new SqlConnection(connectionString))
        //    {
        //        SqlCommand cmd = new SqlCommand("sp_GetStudentById", conn);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("@StudentID", StudentId);
        //        conn.Open();
        //        SqlDataReader reader = cmd.ExecuteReader();
        //        if (reader.Read())
        //        {
        //            student = new Student
        //            {
        //                StudentID = reader["StudentID"].ToString(),
        //                Name = reader["Name"].ToString(),
        //                DOB = Convert.ToDateTime(reader["DOB"]),
        //                Created_On = Convert.ToDateTime(reader["Created_On"])
        //            };
        //        }
        //    }

        //    return student;
        //}




        //UPDATE

        public bool UpdateStatement(Student student)
        {
            int i = 0;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_UpdateStudent", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StudentID", student.StudentID);
                cmd.Parameters.AddWithValue("@Name", student.Name);
                cmd.Parameters.AddWithValue("@DOB", student.DOB);
               
                conn.Open();
                i= cmd.ExecuteNonQuery();
                conn.Close();
            }
            if(i>0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //DELETE

        public bool DeleteStudent(string studentID)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_DeleteStudent", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@StudentID", studentID);

                    conn.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    conn.Close();

                    return rowsAffected > 0; // Return true if at least one row was affected
                }
            }
        }


        //GET ALL STUDENT

        public List<Student> GetAllStudent()
        {
            List<Student> studentList = new List<Student>();
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_GetAllStudents", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while(reader.Read())
                {
                    Student student = new Student
                    {
                        StudentID = reader["StudentID"].ToString(),
                        Name = reader["Name"].ToString(),
                        DOB = Convert.ToDateTime(reader["DOB"]),
                        Created_On = Convert.ToDateTime(reader["Created_On"])
                    };
                    studentList.Add(student);
                }
            }
            return studentList;

        }





    }
}