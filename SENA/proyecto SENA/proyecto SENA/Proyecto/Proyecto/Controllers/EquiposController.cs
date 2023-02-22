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
    public class EquiposController : Controller
    {
        private ProyectoContext db = new ProyectoContext();
        // GET: Equipos
        public ActionResult Index()
        {
            var equipo = db.Equipos.Include(p => p.Patrocinador).Include(p => p.Entrenador);
            return View(db.Equipos.ToList());
        }


        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.PatrocinadorId = new SelectList(db.Patrocinadors, "PatrocinadorId", "Nombre");
            ViewBag.EntrenadorId = new SelectList(db.Entrenadors, "EntrenadorId", "FullName");            
            return View();
        }

        [HttpPost]
        public ActionResult Create(Equipo equipo)
        {
            if (ModelState.IsValid)
            {
                bool existe = ValidarEntrenador(equipo);                
                if (!existe)
                {
                    try
                    {
                        db.Equipos.Add(equipo); // insert into Equipo value(....)
                        db.SaveChanges(); // ejecuta la transaccion sobre la base de datos
                        return RedirectToAction("index");
                    }
                    catch (Exception ex)
                    {

                        if (ex.InnerException != null && ex.InnerException.InnerException != null && ex.InnerException.InnerException.Message.Contains("IndexNombre"))
                        {
                            ViewBag.Error = "Error, el Equipo ya se encuentra registrado";
                        }
                        else
                        {
                            ViewBag.Error = ex.Message;
                        }
                        return View(equipo);
                    }
                }
                else
                {
                    ViewBag.Error = "El entrenador y/o el Deportista ya tiene equipo";
                    ViewBag.PatrocinadorId = new SelectList(db.Patrocinadors, "PatrocinadorId", "Nombre", equipo.PatrocinadorId);
                    ViewBag.EntrenadorId = new SelectList(db.Entrenadors, "EntrenadorId", "FullName", equipo.EntrenadorId);                    
                    return View(equipo);
                }
                

            }
            else
            {
                ViewBag.PatrocinadorId = new SelectList(db.Patrocinadors, "PatrocinadorId", "Nombre", equipo.PatrocinadorId);
                ViewBag.EntrenadorId = new SelectList(db.Entrenadors, "EntrenadorId", "FullName", equipo.EntrenadorId);             

                return View(equipo);
            }
        }

        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id.Equals(null))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Equipo equipo = db.Equipos.Find(id);
            if (equipo.Equals(null))
            {
                return HttpNotFound();
            }
            ViewBag.PatrocinadorId = new SelectList(db.Patrocinadors, "PatrocinadorId", "Nombre");
            ViewBag.EntrenadorId = new SelectList(db.Entrenadors, "EntrenadorId", "FullName");            
            return View(equipo);

        }
        [HttpPost]
        public ActionResult Edit(Equipo equipo)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    db.Entry(equipo).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("index");
                }
                catch (Exception ex)
                {
                    if (ex.InnerException != null && ex.InnerException.InnerException != null && ex.InnerException.InnerException.Message.Contains("IndexNombre"))
                    {
                        ViewBag.Error = "Error, el Equipo ya se encuentra registrado";
                    }
                    else
                    {
                        ViewBag.Error = ex.Message;
                    }

                    return ViewBag(equipo);
                }

            }
            else
            {
                ViewBag.PatrocinadorId = new SelectList(db.Patrocinadors, "PatrocinadorId", "Nombre", equipo.PatrocinadorId);
                ViewBag.EntrenadorId = new SelectList(db.Entrenadors, "EntrenadorId", "FullName", equipo.EntrenadorId);                
                return ViewBag(equipo);
            }

        }

        [HttpGet]

        public ActionResult Details(int? id)
        {
            if (id.Equals(null))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Equipo equipo = db.Equipos.Find(id);
            if (equipo.Equals(null))
            {
                return HttpNotFound();
            }

            ViewBag.PatrocinadorId = new SelectList(db.Patrocinadors, "PatrocinadorId", "Nombre");
            ViewBag.EntrenadorId = new SelectList(db.Entrenadors, "EntrenadorId", "FullName");            
            return View(equipo);

        }

        [HttpGet]
        public ActionResult Delete(int? id)
        {
            if (id.Equals(null))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Equipo equipo = db.Equipos.Find(id);
            if (equipo.Equals(null))
            {
                return HttpNotFound();
            }
            ViewBag.PatrocinadorId = new SelectList(db.Patrocinadors, "PatrocinadorId", "Nombre");           
            ViewBag.EntrenadorId = new SelectList(db.Entrenadors, "EntrenadorId", "FullName");            
            return View(equipo);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            Equipo equipo = db.Equipos.Find(id);
            if (equipo.Equals(null))
            {
                return HttpNotFound();
            }
            else
            {
                try
                {
                    db.Equipos.Remove(equipo);
                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                    if (ex.InnerException != null && ex.InnerException.InnerException != null && ex.InnerException.InnerException.Message.Contains("REFERENCE"))
                    {
                        ViewBag.Error = "No se permite borrar, el Equipo contiene Deportistas";
                    }
                    else
                    {
                        ViewBag.Error = ex.Message;
                    }
                    
                    return View(equipo);

                }

            }
            return RedirectToAction("Index");

        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        public bool ValidarEntrenador (Equipo equipo)
        {
            bool existe = false;
            Equipo eq = db.Equipos.Where(e => e.EntrenadorId == equipo.EntrenadorId).FirstOrDefault();
            if(eq != null)
            {
                existe = true;
            }
            return existe;
        }
        
    }
}