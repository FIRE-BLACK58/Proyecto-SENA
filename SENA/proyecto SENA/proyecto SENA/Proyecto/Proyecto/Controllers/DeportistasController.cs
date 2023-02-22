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
    public class DeportistasController : Controller
    {
        //objeto de tipo contexto
        private ProyectoContext db = new ProyectoContext();
        // GET: Deportistas
        public ActionResult Index()
        {
            return View(db.Deportistas.ToList());
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Deportista deportista)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    db.Deportistas.Add(deportista); // insert into Deportista value(....)
                    db.SaveChanges(); // ejecuta la transaccion sobre la base de datos
                    return RedirectToAction("index");
                }
                catch (Exception ex)
                {

                    if (ex.InnerException != null && ex.InnerException.InnerException != null && ex.InnerException.InnerException.Message.Contains("IndexIdentificacion"))
                    {
                        ViewBag.Error = "Error, el Deportista ya se encuentra registrado";
                    }
                    else
                    {
                        ViewBag.Error = ex.Message;
                    }
                    return View(deportista);
                }

            }
            else
            {
                return View(deportista);
            }
        }

        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id.Equals(null))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Deportista deportista = db.Deportistas.Find(id);
            if (deportista.Equals(null))
            {
                return HttpNotFound();
            }

            return View(deportista);

        }

        [HttpPost]
        public ActionResult Edit(Deportista deportista)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    db.Entry(deportista).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("index");
                }
                catch (Exception ex)
                {
                    if (ex.InnerException != null && ex.InnerException.InnerException != null && ex.InnerException.InnerException.Message.Contains("IndexIdentificacion"))
                    {
                        ViewBag.Error = "Error, el Deportista ya se encuentra registrado";
                    }
                    else
                    {
                        ViewBag.Error = ex.Message;
                    }

                    return ViewBag(deportista);
                }

            }
            else
            {
                return ViewBag(deportista);
            }

        }

        [HttpGet]

        public ActionResult Details(int? id)
        {
            if (id.Equals(null))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Deportista deportista = db.Deportistas.Find(id);
            if (deportista.Equals(null))
            {
                return HttpNotFound();
            }

            return View(deportista);

        }

        [HttpGet]
        public ActionResult Delete(int? id)
        {
            if (id.Equals(null))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Deportista deportista = db.Deportistas.Find(id);
            if (deportista.Equals(null))
            {
                return HttpNotFound();
            }

            return View(deportista);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            Deportista deportista = db.Deportistas.Find(id);
            if (deportista.Equals(null))
            {
                return HttpNotFound();
            }
            else
            {
                db.Deportistas.Remove(deportista);
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