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
    public class ArbitrosController : Controller
    {
        //objeto de tipo contexto
        private ProyectoContext db = new ProyectoContext();
        // GET: Arbitros
        public ActionResult Index()
        {
            return View(db.Arbitros.ToList());
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Arbitro arbitro)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    db.Arbitros.Add(arbitro); // insert into Deportista value(....)
                    db.SaveChanges(); // ejecuta la transaccion sobre la base de datos
                    return RedirectToAction("index");
                }
                catch (Exception ex)
                {

                    if (ex.InnerException != null && ex.InnerException.InnerException != null && ex.InnerException.InnerException.Message.Contains("IndexIdentificacion"))
                    {
                        ViewBag.Error = "Error, el Arbitro ya se encuentra registrado";
                    }
                    else
                    {
                        ViewBag.Error = ex.Message;
                    }
                    return View(arbitro);
                }

            }
            else
            {
                return View(arbitro);
            }
        }

        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id.Equals(null))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Arbitro arbitro = db.Arbitros.Find(id);
            if (arbitro.Equals(null))
            {
                return HttpNotFound();
            }

            return View(arbitro);

        }

        [HttpPost]
        public ActionResult Edit(Arbitro arbitro)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    db.Entry(arbitro).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("index");
                }
                catch (Exception ex)
                {
                    if (ex.InnerException != null && ex.InnerException.InnerException != null && ex.InnerException.InnerException.Message.Contains("IndexIdentificacion"))
                    {
                        ViewBag.Error = "Error, el Arbitro ya se encuentra registrado";
                    }
                    else
                    {
                        ViewBag.Error = ex.Message;
                    }

                    return ViewBag(arbitro);
                }

            }
            else
            {
                return ViewBag(arbitro);
            }

        }

        [HttpGet]

        public ActionResult Details(int? id)
        {
            if (id.Equals(null))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Arbitro arbitro = db.Arbitros.Find(id);
            if (arbitro.Equals(null))
            {
                return HttpNotFound();
            }

            return View(arbitro);

        }

        [HttpGet]
        public ActionResult Delete(int? id)
        {
            if (id.Equals(null))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Arbitro arbitro = db.Arbitros.Find(id);
            if (arbitro.Equals(null))
            {
                return HttpNotFound();
            }

            return View(arbitro);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            Arbitro arbitro = db.Arbitros.Find(id);
            if (arbitro.Equals(null))
            {
                return HttpNotFound();
            }
            else
            {
                db.Arbitros.Remove(arbitro);
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