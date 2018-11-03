import estudiantes.*
import carreras.*

class Materia {
	var property carreraALaQuePertenece
	var property estudiantesInscriptos = []
	var property anioAlQuePertenece
	var property creditosQueOtorga
	
	method cumpleRequisito(materia){
		// TODO Nadie usa este código debería ser método abstracto.
		return true
	}
}

class MateriasCorrelativas inherits Materia{
	var property materiasCorrelativas = []
	// TODO Falta override, prestá atención a las indicaciones del ide.
	method cumpleRequisito(estudiante){
		return materiasCorrelativas.all {materiaCorrelativa => 
			// TODO Delegar en estudiante
			// TODO En lugar de any sería más fácil con contains.
			estudiante.materiasAprobadas().any {materiaAprobada => materiaAprobada == materiaCorrelativa}
		}
	}
}

class CreditosNecesarios inherits Materia{
	var property creditosQueNecesita
	method cumpleRequisito(estudiante){
		return creditosQueNecesita <= estudiante.creditosAcumulados()
	}
}

class AnioDeCursada inherits Materia{
	method cumpleRequisito(estudiante){
		return estudiante.aproboElAnioAnterior(self)
	}
}

class Nada inherits Materia{
	method cumpleRequisito(estudiante){
		return true
	}
}