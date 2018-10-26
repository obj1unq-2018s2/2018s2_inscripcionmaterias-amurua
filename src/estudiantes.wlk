import materias.*

class Estudiante {
	var property carrerasQueCursa = []
	var property materiasAprobadas = []
	var property creditosAcumulados = materiasAprobadas.sum{materiaAprobada => materiaAprobada.creditosQueOtorga()}
	
	method puedeCursarMateria(materia){
		return (not materiasAprobadas.any {materiaAprobada => materiaAprobada == materia}) and
			   (not materia.estudiantesInscriptos().any {estudianteInscripto => estudianteInscripto == self}) and
			   carrerasQueCursa.any {carreraQueCursa => carreraQueCursa == materia.carreraALaQuePertenece()} and
			   materia.cumpleRequisito(self)
	}
	
	method aproboElAnioAnterior(materia) {
		
		var anio = materia.anioAlQuePertenece() - 1
		var carrera = materia.carreraALaQuePertenece()
		var aprobadasAnio = materiasAprobadas.filter {materiaAprobada => materiaAprobada.anioMateria() == anio}
		return carrera.materiasDeAnio(anio) == aprobadasAnio.map {mat => mat.materia()}.asSet()
	}
}
