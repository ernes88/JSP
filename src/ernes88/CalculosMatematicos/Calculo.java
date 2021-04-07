package ernes88.CalculosMatematicos;

public class Calculo {

	private static int resultado;
	public static int suma(int x,int y){
		resultado=x+y;
		return resultado;
	}

	public static int resta(int x,int y){
		resultado=x-y;
		return resultado;
	}

	public static int multiplica(int x,int y){
		resultado=x*y;
		return resultado;
	}
}
