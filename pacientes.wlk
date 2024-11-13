import aparatos.*

class Paciente {
  var edad
  var nivelDeDolor
  var fortalezaMuscular

  const property rutina = []
  method cargarRutina(unaRutina) {
    rutina.clear()
    rutina.addAll(unaRutina)
  }
  method puedeHacerRutina() = rutina.all({a => self.puedeUsar(a)})
  method hacerRutina() {rutina.forEach({a => self.usarAparato(a)}) }

  method fortalezaMuscular() = fortalezaMuscular
  method nivelDeDolor() = nivelDeDolor
  method edad() = edad 

  method cumplirAnios() {edad += 1}
  method mejorarDolor(cantidad) {nivelDeDolor = 0.max(nivelDeDolor - cantidad)}
  method mejorarFortalezaMuscular(cantidad) {fortalezaMuscular += cantidad}

  method puedeUsar(aparato) = aparato.condicion(self) 

  method usarAparato(unAparato) {
    if (self.puedeUsar(unAparato)){
      unAparato.efecto(self)
    }
  }
}

class Resistente inherits Paciente{
  override method hacerRutina(){
    const cant = rutina.count({a => self.puedeUsar(a)})
    super()
    self.mejorarFortalezaMuscular(cant)
  }
}

class Caprichoso inherits Paciente {
  override method puedeHacerRutina() = self.hayAparatosRojos() && super()
  method hayAparatosRojos() = rutina.all({a => a.color() == "Rojo"})

  override method hacerRutina() {
    super()
    rutina.forEach({a => self.usarAparato(a)})
  }
}

class RapidaRucuperacion inherits Paciente {
  override method hacerRutina() {
    super()
    self.mejorarDolor(recuperacion.valor())
  }
}

object recuperacion {
  var property valor = 3 
}




















