using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace StudentCRUD.Models
{
    public class Student
    {
        public string StudentID { get; set; }
        [Required(ErrorMessage = "Name is required")]
        public string Name { get; set; }
        [DataType(DataType.Date, ErrorMessage = "Date only")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> DOB { get; set; }
        public DateTime Created_On { get; set; }
    }
}