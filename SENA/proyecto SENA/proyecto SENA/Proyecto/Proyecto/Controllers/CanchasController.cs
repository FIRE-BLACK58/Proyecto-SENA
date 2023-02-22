using Proyecto.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace Proyecto.Controllers
{
    public class CanchasController : Controller
    {
        //objeto de tipo contexto
        private ProyectoContext db = new ProyectoContext();

        // GET: Canchas
        public ActionResult Index()
        {
            return View(db.Canchas.ToList());
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Cancha cancha)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    db.Canchas.Add(cancha);
                    db.SaveChanges(); // ejecuta la transaccion sobre la base de datos
                    return RedirectToAction("index");
                }
                catch (Exception ex)
                {

                    if (ex.InnerException != null && ex.InnerException.InnerException != null && ex.InnerException.InnerException.Message.Contains("IndexIdentificacion"))
                    {
                        ViewBag.Error = "Error, la Cancha ya se encuentra registrada";
                    }
                    else
                    {
                        ViewBag.Error = ex.Message;
                    }
                    return View(cancha);
                }

            }
            else
            {
                return View(cancha);
            }
        }

        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id.Equals(null))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cancha cancha = db.Canchas.Find(id);
            if (cancha.Equals(null))
            {
                return HttpNotFound();
            }

            return View(cancha);

        }

        [HttpPost]
        public ActionResult Edit(Cancha cancha)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    db.Entry(cancha).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("index");
                }
                catch (Exception ex)
                {
                    if (ex.InnerException != null && ex.InnerException.InnerException != null && ex.InnerException.InnerException.Message.Contains("IndexIdentificacion"))
                    {
                        ViewBag.Error = "Error, la cancha ya se encuentra registrada";
                    }
                    else
                    {
                        ViewBag.Error = ex.Message;
                    }

                    return ViewBag(cancha);
                }

            }
            else
            {
                return ViewBag(cancha);
            }

        }

        [HttpGet]

        public ActionResult Details(int? id)
        {
            if (id.Equals(null))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cancha cancha = db.Canchas.Find(id);
            if (cancha.Equals(null))
            {
                return HttpNotFound();
            }

            return View(cancha);

        }

        [HttpGet]
        public ActionResult Delete(int? id)
        {
            if (id.Equals(null))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cancha cancha = db.Canchas.Find(id);
            if (cancha.Equals(null))
            {
                return HttpNotFound();
            }

            return View(cancha);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            Cancha cancha = db.Canchas.Find(id);
            if (cancha.Equals(null))
            {
                return HttpNotFound();
            }
            else
            {
                db.Canchas.Remove(cancha);
                db.SaveChanges();
            }
            return RedirectToAction("Index");

        }
        //metodo para cerrar la conexion con la base de datos

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}