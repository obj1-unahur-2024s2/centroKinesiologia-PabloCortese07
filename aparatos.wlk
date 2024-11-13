
class Aparato{
  var color = "Blanco"
  method cambiarDeColor(nuevoColor) {color = nuevoColor}
  method color() = color
  method condicion(paciente) 
  method efecto(paciente) {}
}

class Magneto inherits Aparato {
  override method efecto(paciente) {
    paciente.mejorarDolor(paciente.nivelDeDolor() * 0.1)
  }

  override method condicion(paciente) = true
}

class Bicicleta inherits Aparato {
  override method efecto(paciente) {
    paciente.mejorarDolor(4)
    paciente.mejorarFortalezaMuscular(3)
  }

  override method condicion(paciente) = paciente.edad() > 8
}

class Minitramp inherits Aparato{
  override method efecto(paciente) {
    paciente.mejorarFortalezaMuscular(paciente.edad() * 0.1)
  }

  override method condicion(paciente) = paciente.nivelDeDolor() < 20
}