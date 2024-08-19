using StudentCRUD.Models;
using StudentCRUD.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StudentCRUD.Controllers
{
    public class StudentController : Controller
    {
        private readonly StudentRepository _repo = new StudentRepository();

        // GET: Student
        public ActionResult Index()
        {
            var students = _repo.GetAllStudent();
            if(students == null || students.Count == 0)
            {
                TempData["InfoMessage"] = "Currently Students Details are Not in Database.";
            }
            return View(students);
        }

        // GET: Student/Details/5
        public ActionResult Details(string id)
        {
            var student = _repo.GetStudentById(id);
            return View(student);
        }

        public ActionResult Create()
        {
            return View();
        }

        // POST: Student/Create

        [HttpPost]
        public ActionResult Create(Student student)
        {
            bool isInserted = false;
            try
            {
                if (ModelState.IsValid)
                {
                    student.StudentID = GenerateStudentId();
                    student.Created_On = DateTime.Now;
                    isInserted = _repo.InsertStudent(student);
                    if (isInserted)
                    {
                        TempData["SuccessMessage"] = "Student details saved successfully!";
                    }
                    else
                    {
                        TempData["ErrorMessage"] = "Student is Alreday Available/Unable to save the student details.";
                    }
                    return RedirectToAction("Index");
                }
                else
                {
                    TempData["ErrorMessage"] = "Invalid data. Please correct the errors and try again.";
                    return View(student); // Return the view with the current student data
                }
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = $"An error occurred: {ex.Message}";
                return View(student); // Return the view with the current student data in case of an exception
            }
        }


        //[HttpPost]
        //public ActionResult Create(Student student)
        //{
        //    try
        //    {
        //        if(ModelState.IsValid)
        //        {
        //            student.StudentID = GenerateStudentId();
        //            student.Created_On = DateTime.Now;
        //            _repo.InsertStudent(student); 
        //        }
        //        return RedirectToAction("Index");
        //    }
        //    catch(Exception ex)
        //    {
        //        return View("Error",ex.Message);
        //    }
        //}

        private string GenerateStudentId()
        {
            return Guid.NewGuid().ToString();
        }

        // GET: Student/Edit/5
        [HttpGet]
        public ActionResult Edit(string id)
        {
            var std = _repo.GetStudentById(id);
            if(std==null)
            {
                return HttpNotFound();
            }
            return View(std);
        }


        // POST: Student/Edit/5

        [HttpPost]
        public ActionResult Update(Student student)
        {
            try
            {
                if(ModelState.IsValid)
                {
                    _repo.UpdateStatement(student);
                    TempData["UpdateMessage"] = true;


                }
                return RedirectToAction("Index");


            }
            catch(Exception ex)
            {
                return View("Error", new HandleErrorInfo(ex, "Student", "Update"));
            }
        }


        // GET: /Student/Delete/5
        //public ActionResult Delete(string id)
        //{
        //    var student = _repo.GetStudentById(id);
        //    if (student == null)
        //    {
        //        TempData["InfoMessage"] = "Invalid data. Please correct the errors and try again.";
        //        return RedirectToAction("Index");
        //    }
        //    return View(student);
        //}

        // POST: /Student/DeleteConfirmed
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            try
            {
                bool isDeleted = _repo.DeleteStudent(id);
                if (isDeleted)
                {
                    return Json(new { success = true });
                }
                else
                {
                    return Json(new { success = false, message = "Student not found or could not be deleted." });
                }
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

    }
}
