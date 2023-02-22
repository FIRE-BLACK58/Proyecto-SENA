using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Proyecto.Models
{
    public class Cancha
    {
        [Key]
        public int CanchaId { get; set; }

        [Required(ErrorMessage = "El campo {0} es obligatorio")]
        [StringLength(20, MinimumLength = 4, ErrorMessage = "El campo {0} debe tener entre {2} y {1} caracteres")]
        public string Nombre { get; set; }

        [Required(ErrorMessage = "El campo {0} es obligatorio")]
        [StringLength(40, MinimumLength = 6, ErrorMessage = "El campo {0} debe tener entre {2} y {1} caracteres")]
        public string Direccion { get; set; }

        [Required(ErrorMessage = "El campo {0} es obligatorio")]
        [StringLength(15, MinimumLength = 8, ErrorMessage = "El campo {0} debe tener entre {2} y {1} caracteres")]
        [DataType(DataType.PhoneNumber)]
        public string Telefono { get; set; }

        [Required(ErrorMessage = "El campo {0} es obligatorio")]
        [StringLength(15, MinimumLength = 2, ErrorMessage = "El campo {0} debe tener entre {2} y {1} caracteres")]        
        public string CantidadEspectadores { get; set; }

        [Required(ErrorMessage = "El campo {0} es obligatorio")]
        [StringLength(20, MinimumLength = 2, ErrorMessage = "El campo {0} debe tener entre {2} y {1} caracteres")]        
        public string Medidas { get; set; }

        //Relacion con equipo
        //[Required(ErrorMessage = "El campo {0} es obligatorio")]
        //public int EquipoId { get; set; }
        //public virtual Equipo Equipo { get; set; }

    }
}