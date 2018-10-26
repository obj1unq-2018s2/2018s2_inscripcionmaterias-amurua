

class Carrera{
	
	var property materias = []
	
	method materiasDeUnAnio(anio) = materias.filter {materia => materia.anioAlQuePertenece() == anio}
	
}
