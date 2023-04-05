// Llibreria de MySQL i Processing
import de.bezier.data.sql.*;

// Objecte de connexió a la BBDD
MySQL msql;

void conexionBBDD(){
    
    // Paràmetres de la connexió
    String user     = "admin";
    String pass     = "12345";   
    String database = "courier";
    
    // Establim la connexió
    msql = new MySQL( this, "localhost", database, user, pass );
    
    // Si la connexió s'ha establert
    if (msql.connect()){  
      println("Connectat :)");
    }
    else {
      // La connexió ha fallat!!!
      println("Connection failed!");
    }
}

void insertInfoTaulapelicula(String PeliculaNom, String año,  String Director, String Genero, int valoracion){
  String q = "INSERT INTO `pelicula`(`PeliculaNom`, `Año`, `Director_directorName`, `Genero_Genero`, `valoracion`) VALUES ('"+PeliculaNom+"','"+año+"','"+Director+"','"+Genero+"', '"+valoracion+"')";
  println(q);
  msql.query(q);
}

// Obté el número de files de la taula
int getNumRowsTaula(String nomTaula){
  msql.query( "SELECT COUNT(*) AS n FROM %s", nomTaula);
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}
  
// Obté informació de la taula Unitat
String[][] getInfoTaulapelicula(){
  
  int numRows = getNumRowsTaula("pelicula");
  
  String[][] data = new String[numRows][2];
  
  int nr=0;
  msql.query( "SELECT * FROM pelicula" );
  while (msql.next()){
      data[nr][0] = String.valueOf(msql.getInt("id"));
      data[nr][1] = msql.getString("peliculaNom");
      nr++;
  }
  return data;
}
