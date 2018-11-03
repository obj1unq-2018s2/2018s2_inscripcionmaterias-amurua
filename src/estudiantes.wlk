import materias.*

class Estudiante {
	var property carrerasQueCursa = []
	var property materiasAprobadas = []
	
	// TODO Tiene que ser un método y no una property, esto sólo se ejecuta en la inicialización. OJO.
	var property creditosAcumulados = materiasAprobadas.sum{materiaAprobada => materiaAprobada.creditosQueOtorga()}
	
	method puedeCursarMateria(materia){
		// TODO Dividir en subtareas y delegar en otros obejtos
		return (not materiasAprobadas.any {materiaAprobada => materiaAprobada == materia}) and // TODO => contains.
			   (not materia.estudiantesInscriptos().any {estudianteInscripto => estudianteInscripto == self}) and  // TODO delegar y contains
			   carrerasQueCursa.any {carreraQueCursa => carreraQueCursa == materia.carreraALaQuePertenece()} and // TODO contains
			   materia.cumpleRequisito(self)
	}
	
	method aproboElAnioAnterior(materia) {
		
		var anio = materia.anioAlQuePertenece() - 1
		var carrera = materia.carreraALaQuePertenece()
		var aprobadasAnio = materiasAprobadas.filter {materiaAprobada => materiaAprobada.anioMateria() == anio}
		// TODO Acá deberías devolver un booleano y estás devolviendo una colección.
		return carrera.materiasDeAnio(anio) == aprobadasAnio.map {mat => mat.materia()}.asSet()
	}
}
