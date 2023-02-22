using Proyecto.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using System.Net;

namespace Proyecto.Controllers
{
    public class TorneosController : Controller
    {
        //objeto de tipo contexto
        private ProyectoContext db = new ProyectoContext();

        // GET: Torneos
        public ActionResult Index()
        {
            //recuperar la relacion entre tablas
            var torneo = db.Torneos.Include(mun => mun.Municipio);
            return View(db.Torneos.ToList());
        }

        [HttpGet]
        public ActionResult Create()
        {
            //llenar un dropDownlList con la informacion de los municipios 
            ViewBag.MunicipioId = new SelectList(db.Municipios, "MunicipioId", "Nombre");
            return View();
        }

        [HttpPost]
        public ActionResult Create(Torneo torneo)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    db.Torneos.Add(torneo); // insert into Torneo value(....)
                    db.SaveChanges(); // ejecuta la transaccion sobre la base de datos
                    return RedirectToAction("index");
                }
                catch (Exception ex)
                {

                    if (ex.InnerException != null && ex.InnerException.InnerException != null && ex.InnerException.InnerException.Message.Contains("IndexNombre"))
                    {
                        ViewBag.Error = "Error, el Torneo ya se encuentra registrado";
                        ViewBag.MunicipioId = new SelectList(db.Municipios, "MunicipioId", "Nombre", torneo.MunicipioId);
                    }
                    else
                    {
                        ViewBag.Error = ex.Message;
                        ViewBag.MunicipioId = new SelectList(db.Municipios, "MunicipioId", "Nombre", torneo.MunicipioId);
                    }
                    return View(torneo);
                }

            }
            else
            {
                ViewBag.MunicipioId = new SelectList(db.Municipios, "MunicipioId", "Nombre", torneo.MunicipioId);
                return View(torneo);
            }
        }

        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id.Equals(null))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Torneo torneo = db.Torneos.Find(id); // select o from Torneos where TorneoId = id
            if (torneo.Equals(null))
            {
                return HttpNotFound();
            }
            ViewBag.MunicipioId = new SelectList(db.Municipios, "MunicipioId", "Nombre", torneo.MunicipioId);
            return View(torneo);

        }

        [HttpPost]
        public ActionResult Edit(Torneo torneo)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    db.Entry(torneo).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("index");
                }
                catch (Exception ex)
                {
                    if (ex.InnerException != null && ex.InnerException.InnerException != null && ex.InnerException.InnerException.Message.Contains("IndexNombre"))
                    {
                        ViewBag.Error = "Error, el Torneo ya se encuentra registrado";
                        ViewBag.MunicipioId = new SelectList(db.Municipios, "MunicipioId", "Nombre", torneo.MunicipioId);
                    }
                    else
                    {
                        ViewBag.Error = ex.Message;
                        ViewBag.MunicipioId = new SelectList(db.Municipios, "MunicipioId", "Nombre", torneo.MunicipioId);
                    }

                    return ViewBag(torneo);
                }

            }
            else
            {
                ViewBag.MunicipioId = new SelectList(db.Municipios, "MunicipioId", "Nombre", torneo.MunicipioId);
                return ViewBag(torneo);
            }

        }

        [HttpGet]

        public ActionResult Details(int? id)
        {
            if (id.Equals(null))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Torneo torneo = db.Torneos.Find(id);
            if (torneo.Equals(null))
            {
                return HttpNotFound();
            }
            ViewBag.MunicipioId = new SelectList(db.Municipios, "MunicipioId", "Nombre");
            return View(torneo);

        }

        [HttpGet]
        public ActionResult Delete(int? id)
        {
            if (id.Equals(null))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Torneo torneo = db.Torneos.Find(id);
            if (torneo.Equals(null))
            {
                return HttpNotFound();
            }
            ViewBag.MunicipioId = new SelectList(db.Municipios, "MunicipioId", "Nombre");
            return View(torneo);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            Torneo torneo = db.Torneos.Find(id);
            if (torneo.Equals(null))
            {
                return HttpNotFound();
            }
            else
            {
                db.Torneos.Remove(torneo);
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