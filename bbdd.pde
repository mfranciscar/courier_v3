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

void insertInfoTaulapelicula(String PeliculaNom, String año,  String portada, String Director, String Genero, int valoracion, String estado){
  String q = "INSERT INTO `pelicula`(`PeliculaNom`, `Año`, `Portada_portadaName`, `Director_directorName`, `Genero_Genero`, `valoracion`, `estado`) VALUES ('"+PeliculaNom+"','"+año+"','"+portada+"','"+Director+"','"+Genero+"', '"+valoracion+"', '"+estado+"')";
  println(q);
  msql.query(q);
}

int getNumRowsQuery(String q) {
  msql.query( q);
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}

// Obté el número de files de la taula
int getNumRowsTaula(String nomTaula){
  msql.query("SELECT COUNT(*) AS n FROM %s", nomTaula);
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}
  
// Obté informació de la taula Unitat
String[][] getInfoTaulaPeliculaVistas(){
  
  int numRows = getNumRowsTaula("pelicula");
  
  String[][] data = new String[numRows][5];
  
    int nr=0;
    msql.query("SELECT `PeliculaNom`, `Director_directorName`, `Año`, `Genero_Genero`, `valoracion` FROM `pelicula`");
    while (msql.next()){
        data[nr][0] = msql.getString("PeliculaNom");
        data[nr][1] = msql.getString("Director_directorName");
        data[nr][2] = String.valueOf(msql.getInt("Año"));
        data[nr][3] = msql.getString("Genero_Genero");
        data[nr][4] = String.valueOf(msql.getInt("valoracion"));
        nr++;

  }
  return data;
}

String[][] getInfoTablaPeliculaBuscar(String buscar) {

  String q2 = "SELECT COUNT(*) AS n FROM pelicula WHERE PeliculaNom LIKE '%"+buscar+"%'";
  int numRows = getNumRowsQuery(q2);
  println("NR:"+numRows);

  if (numRows>0) {
    String[][] data = new String[numRows][5];

    String q = "SELECT `PeliculaNom`, `Director_directorName`, `Año`, `Genero_Genero`, `valoracion`  FROM pelicula WHERE PeliculaNom LIKE '%"+buscar+"%'";
    int nr=0;
    msql.query(q);
    while (msql.next()) {
      data[nr][0] = msql.getString("PeliculaNom");
      data[nr][1] = msql.getString("Director_directorName");
      data[nr][2] = String.valueOf(msql.getInt("Año"));
      data[nr][3] = msql.getString("Genero_Genero");
      data[nr][4] = String.valueOf(msql.getInt("valoracion"));
      nr++;
    }
    return data;
  } else {
    String[][] array = new String[5][5];

    // Rellenar el array con strings vacíos
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 5; j++) {
        array[i][j] = "";
      }
    }

    return array;
  }
}
