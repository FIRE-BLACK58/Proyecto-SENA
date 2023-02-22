using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Proyecto.Models
{
    public class Entrenador
    {
        [Key]
        public int EntrenadorId { get; set; }
        [Required(ErrorMessage = "El campo {0} es obligatorio")]
        [StringLength(20, MinimumLength = 4, ErrorMessage = "El campo {0} debe tener entre {2} y {1} caracteres")]
        [Index("IndexIdentificacion", IsUnique = true)]
        public string Identificacion { get; set; }

        [Required(ErrorMessage = "El campo {0} es obligatorio")]
        [StringLength(20, MinimumLength = 1, ErrorMessage = "El campo {0} debe tener entre {2} y {1} caracteres")]
        public string Nombres { get; set; }

        [Required(ErrorMessage = "El campo {0} es obligatorio")]
        [StringLength(40, MinimumLength = 1, ErrorMessage = "El campo {0} debe tener entre {2} y {1} caracteres")]

        public string Apellidos { get; set; }
        //Propiedad de solo lectura
        public string FullName { get { return (this.Nombres + " " + this.Apellidos); } }

        [Required(ErrorMessage = "El campo {0} es obligatorio")]
        [StringLength(15, MinimumLength = 1, ErrorMessage = "El campo {0} debe tener entre {2} y {1} caracteres")]
        public string Genero { get; set; }
        //Relacion con equipo
        public virtual ICollection<Equipo> Equipos { get; set; }
        
    }
}