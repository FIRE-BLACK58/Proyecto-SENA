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
    public class EscenariosController : Controller
    {
        //objeto de tipo contexto
        private ProyectoContext db = new ProyectoContext();

        // GET: Escenarios
        public ActionResult Index()
        {
            return View(db.Escenarios.ToList());
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Escenario escenario)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    db.Escenarios.Add(escenario); // insert into Escenarios value(....)
                    db.SaveChanges(); // ejecuta la transaccion sobre la base de datos
                    return RedirectToAction("index");
                }
                catch (Exception ex)
                {

                    if (ex.InnerException != null && ex.InnerException.InnerException != null && ex.InnerException.InnerException.Message.Contains("IndexIdentificacion"))
                    {
                        ViewBag.Error = "Error, el Escenario ya se encuentra registrado";
                    }
                    else
                    {
                        ViewBag.Error = ex.Message;
                    }
                    return View(escenario);
                }

            }
            else
            {
                return View(escenario);
            }
        }

        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id.Equals(null))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Escenario escenario = db.Escenarios.Find(id);
            if (escenario.Equals(null))
            {
                return HttpNotFound();
            }

            return View(escenario);

        }

        [HttpPost]
        public ActionResult Edit(Escenario escenario)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    db.Entry(escenario).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("index");
                }
                catch (Exception ex)
                {
                    if (ex.InnerException != null && ex.InnerException.InnerException != null && ex.InnerException.InnerException.Message.Contains("IndexIdentificacion"))
                    {
                        ViewBag.Error = "Error, el Escenario ya se encuentra registrado";
                    }
                    else
                    {
                        ViewBag.Error = ex.Message;
                    }

                    return ViewBag(escenario);
                }

            }
            else
            {
                return ViewBag(escenario);
            }

        }

        [HttpGet]

        public ActionResult Details(int? id)
        {
            if (id.Equals(null))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Escenario escenario = db.Escenarios.Find(id);
            if (escenario.Equals(null))
            {
                return HttpNotFound();
            }

            return View(escenario);

        }

        [HttpGet]
        public ActionResult Delete(int? id)
        {
            if (id.Equals(null))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Escenario escenario = db.Escenarios.Find(id);
            if (escenario.Equals(null))
            {
                return HttpNotFound();
            }

            return View(escenario);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            Escenario escenario = db.Escenarios.Find(id);
            if (escenario.Equals(null))
            {
                return HttpNotFound();
            }
            else
            {
                db.Escenarios.Remove(escenario);
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