package io;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

import org.sbml.libsbml.Compartment;
import org.sbml.libsbml.Species;

public class SBMLInformation {
	
	private String modelInfo;
	private Map<Integer, String[]> compartments;
	private Map<Integer, String[]> compounds;
	private Map<Integer, String[]> reactions;
	
	private Double[][] stoichiometric_matrix;
	private String[][] modifier_matrix;
	
	
	public String getModelInfo(){
		return modelInfo;
	}
	public void setModelInfo(String modelInfo){
		this.modelInfo = modelInfo;
	}
	
	public Map<Integer, String[]> getCompartments() {
		return compartments;
	}
	public void setCompartments(Map<Integer, String[]> compartments) {
		this.compartments = compartments;
	}

	public Map<Integer, String[]> getCompounds() {
		return compounds;
	}
	public void setCompounds(Map<Integer, String[]> compounds) {
		this.compounds = compounds;
	}

	public Map<Integer, String[]> getReactions() {
		return reactions;
	}
	public void setReactions(Map<Integer, String[]> reactions) {
		this.reactions = reactions;
	}

	public Double[][] getStoichiometric_matrix() {
		return stoichiometric_matrix;
	}
	public void setStoichiometric_matrix(Double[][] stoichiometricMatrix) {
		stoichiometric_matrix = stoichiometricMatrix;
	}

	public String[][] getModifier_matrix() {
		return modifier_matrix;
	}
	public void setModifier_matrix(String[][] modifierMatrix) {
		modifier_matrix = modifierMatrix;
	}

	/** Empty Constructor */
	public SBMLInformation(){
		this.modelInfo = null;
		this.compartments = null;
		this.compounds = null;
		this.reactions = null; 
		
		this.stoichiometric_matrix = null;
		this.modifier_matrix = null;
	}
	
	/** Constructor with full information.
	 * 
	 */
	public SBMLInformation(String compartment_file, String compound_file, String reaction_file,
							String stoichiometric_file, String modelInfo_file, String separator){
		
		System.out.println("* Reading model information");
		this.modelInfo = readModelInformation(modelInfo_file);
		SBMLInformation.printModelInformation(this.modelInfo);
		
		System.out.println("* Reading compartments");
		this.compartments = readCompartments(compartment_file, separator);
		SBMLInformation.printInformation(this.getCompartments());
		
		System.out.println("* Reading compounds");
		this.compounds = readCompounds(compound_file, separator);
		SBMLInformation.printInformation(this.getCompounds());
		
		System.out.println("* Reading reactions");
		this.reactions = readReactions(reaction_file, separator);
		SBMLInformation.printInformation(this.getReactions());
		
		// Get the dimensions of the matrix via number of compounds and reactions
		System.out.println("* Reading stoichiometric matrix");
		Integer c_size = compounds.size();
		Integer r_size = reactions.size();
		this.stoichiometric_matrix = readStoichiometricMatrix(c_size, r_size, stoichiometric_file, null);
		SBMLInformation.printStoichiometricMatrix(this.getStoichiometric_matrix());
	}
	
	/** General function for reading information.
	 * Used for compartments, compounds and reactions.
	 */
	public static Map<Integer, String[]> readInformation(String file, String separator){
		if (separator == null)
			separator = "\t";
		Map<Integer, String[]> map = new HashMap<Integer, String[]>();
		Integer counter = 0;
	    try{
	    	    // Open the file that is the first 
	    	    // command line parameter
	    	    FileInputStream fstream = new FileInputStream(file);
	    	    // Get the object of DataInputStream
	    	    DataInputStream in = new DataInputStream(fstream);
	    	    BufferedReader br = new BufferedReader(new InputStreamReader(in));
	    	    String line;
	    	    String[] content;
	    	    //Read File Line By Line
	    	    while ((line = br.readLine()) != null)   {
	    	      // no comments
	    	      if (line.charAt(0) == '%' || line.charAt(0) == '#'){
	    	    	  continue;
	    	      }
	    	      // no empty lines
	    	      if (line.length() == 0){
	    	    	  continue;
	    	      }
	    	      // Print the content on the console
	    	      //System.out.println (line);
	    	      content = line.split(separator);
	    	      map.put(counter, content);
	    	      counter++;
	    	    }
	    	    //Close the input stream
	    	    in.close();
	    	}catch (Exception e){//Catch exception if any
	    	      System.err.println("Error: " + e.getMessage());
	    }
		// close file
		return map;
	}
	/** Function for reading the model information (annotated to model in SBML export).
	 * Reads all the information in the modelInformation file and returns as String
	 */
	public static String readModelInformation(String filePath){
		 String info = "";
		 try{
		        StringBuffer fileData = new StringBuffer(1000);
		        BufferedReader reader = new BufferedReader(
		                new FileReader(filePath));
		        char[] buf = new char[1024];
		        int numRead=0;
		        while((numRead=reader.read(buf)) != -1){
		            String readData = String.valueOf(buf, 0, numRead);
		            fileData.append(readData);
		            buf = new char[1024];
		        }
		        reader.close();
		        info = fileData.toString();
		    }
		 	catch (Exception e){//Catch exception if any
		 		System.err.println("Error: " + e.getMessage());
		 	}
		 return info;
	}
	
	/** Function for generating HTML notes */
	public String getCompartmentsHTML(){
		String [] content;
		String id;
		String name;
		String dimension;
		String constant;
		String sbo;
		String go;
		String html = "<p xmlns=\"http://www.w3.org/1999/xhtml\">";
		html += "<h2>Compartments</h2>";
		html += "<table border=\"1\">";
		html += "<tr><td><b>Id</b></td> <td><b>Name</b></td> <td><b>Dimension</b></td> <td><b>Constant</b></td> <td><b>SBO</b></td> <td><b>GO</b></td> </tr>";
		if (compartments != null){
			for (Integer key : compartments.keySet()){
				content = compartments.get(key);
				id = content[1];
				name = content[2];
				dimension = content[3];
				constant = content[5];
				sbo = content[6] + " " + content[7];
				go = content[8] + " " + content[9];
				html += "<tr><td>"+ id +"</td> <td>"+ name +"</td> <td>"+ dimension +"</td> <td>"+ 
									constant +"</td> <td>"+ sbo +"</td> <td>"+ go +"</td> </tr>";
			}
		}
		html += "</table>";
		html += "</p>";
		return html;
	}
	
	/** Function for generating HTML notes */
	public String getCompoundsHTML(){
		String [] content;
		String id;
		String name;
		String compartment;
		String constant;
		String init;
		String kegg;
		String chebi;
		String uniprot;
		String sbo;
		String html = "<p xmlns=\"http://www.w3.org/1999/xhtml\">";
		html += "<h2>Species</h2>";
		html += "<table border=\"1\">";
		html += "<tr><td><b>Id</b></td> <td><b>Name</b></td> <td><b>Compartment</b></td> <td><b>Constant</b></td> <td><b>Init [mM]</b></td> <td><b>KEGG</b></td> <td><b>CHEBI</b></td> <td><b>UNIPROT</b></td> <td><b>SBO</b></td></tr>";
		if (compartments != null){
			for (Integer key : compounds.keySet()){
				content = compounds.get(key);
				id = content[1];
				name = content[2];
				compartment = content[3];
				constant = content[4];
				init = content [5];
				kegg = content[6];
				chebi = content[7];
				uniprot = content[8];
				sbo = content[9] + " " + content[10];
				html += "<tr><td>"+ id +"</td> <td>"+ name +"</td> <td>"+ compartment +"</td> <td>"+ 
									constant +"</td> <td>"+ init +"</td> <td>"+ kegg +"</td>" +
									"<td>"+ chebi +"</td> <td>"+ uniprot +"</td><td>"+ sbo +"</td> </tr>";
			}
		}
		html += "</table>";
		html += "</p>";
		return html;		
	}
	
	/** Function for generating HTML notes */
	public String getReactionsHTML(){
		String [] content;
		String id;
		String name;
		String compartment;
		String irreversible;
		String stoichiometry;
		String vmax;
		String ec;
		String kegg;
		String uniprot;
		String sbo;
		
		String html = "<p xmlns=\"http://www.w3.org/1999/xhtml\">";
		html += "<h2>Reactions</h2>";
		html += "<table border=\"1\">";
		html += "<tr><td><b>Id</b></td> <td><b>Name</b></td> <td><b>Compartment</b></td> <td><b>Irreversible</b></td>" +
				"<td><b>Vmax [µmol/kg/min]</b></td> <td><b>EC</b></td> <td><b>KEGG</b></td> <td><b>UNIPROT</b></td> <td><b>SBO</b></td></tr>";
		if (reactions != null){
			for (Integer key : reactions.keySet()){
				content = reactions.get(key);
				id = content[1];
				name = content[2];
				compartment = content[3];
				irreversible = content[4];
				//stoichiometry = content [5];
				vmax = content[6];
				ec = content[8];
				kegg = content[9];
				uniprot = content[10];
				sbo = content[11] + " " + content[12];

				html += "<tr><td>"+ id +"</td> <td>"+ name +"</td> <td>"+ compartment +"</td> <td>"+ 
									irreversible +"</td> <td>"+ vmax +"</td>" +
									"<td>"+ ec +"</td> <td>"+ kegg +"</td><td>"+ uniprot +"</td><td>"+ sbo +"</td> </tr>";
			}
		}
		html += "</table>";
		html += "</p>";
		System.out.println(html);
		return html;	
	}
	
	
	/** Function for printing the information. */
	public static void printModelInformation(String info){
		System.out.println(info);
	}
	
	/** Function for printing the information. */
	public static void printInformation(Map<Integer, String[]> map){
		for (Integer key : map.keySet()){
			System.out.print(key + " : ");
			for (String content : map.get(key)){
				System.out.print(content + "\t\t");
			}
			System.out.print("\n");
		}	
	}
	
	/** General function for reading matrix.
	 *  Needed for reading the stoichiometric matrix and the modifier matrix.
	 */
	public static  Double[][] readStoichiometricMatrix(Integer c_size, Integer r_size, String file, String separator){
		if (separator == null)
			separator = "\t";
		Double[][] m = new Double[c_size][r_size];
		System.out.println(c_size);
		System.out.println(r_size);
		
		Integer counter = 0;
	    try{
	    	    // Open the file that is the first 
	    	    // command line parameter
	    	    FileInputStream fstream = new FileInputStream(file);
	    	    // Get the object of DataInputStream
	    	    DataInputStream in = new DataInputStream(fstream);
	    	    BufferedReader br = new BufferedReader(new InputStreamReader(in));
	    	    String line;
	    	    String[] content;
	    	    //Read File Line By Line
	    	    while ((line = br.readLine()) != null)   {
	    	      System.out.println(line);
	    	      // no empty lines
	    	      if (line.length() == 0){
		    	    	  continue;
		    	  }
	    	      // no comments
	    	      if (line.charAt(0) == '%' || line.charAt(0) == '#'){
	    	    	  continue;
	    	      }
	    	      // Print the content on the console
	    	      //System.out.println (line);
	    	      content = line.split(separator);
	    	      // description in last element
	    	      for (int i=0; i<r_size; ++i){
	    	    	  m[counter][i] = Double.parseDouble(content[i]);
	    	      }
	    	      counter++;
	    	    }
	    	    //Close the input stream
	    	    in.close();
	    	    }catch (IOException e){//Catch exception if any
	    	      System.err.println("Error: " + e.getMessage());
	    	    }
		// close file
		return m;
	}
	
	/** Function for printing the matrix. */
	public static void printStoichiometricMatrix(Double[][] m){
		Integer c_size = m.length;
		Integer r_size = m[0].length;
		System.out.println(c_size);
		System.out.println(r_size);
		
		Double value;
		for (int i=0; i<c_size; ++i){
			for (int k=0; k<r_size; ++k){
				value = m[i][k];
				if (value != 0.0)
					System.out.print(value + "\t");
				else
					System.out.print("." + "\t");
			}
			System.out.println();
		}	
	}
	
	
	
	/** Read compartments.
	 * Read compartments.
	 * Information is read into an array.
	 * TODO */
	public static Map<Integer, String[]> readCompartments(String file, String separator){
		return readInformation(file, separator);
	}
	
	/** Read compounds.
	 * Read compounds information into HashMap
	 * TODO */
	public static Map<Integer, String[]> readCompounds(String file, String separator){
		return readInformation(file, separator);
	}
	
	/** Read reactions.
	 * Read reactions into HashMap
	 * TODO */
	public static Map<Integer, String[]> readReactions(String file, String separator){
		return readInformation(file, separator);
	}
	
	
	public static void main(String[] args){
		/** Read the example files into SBMLInformation format.
		 * 
		 */	
		// current directory
		//System.out.println(System.getProperty("user.dir"));
		//String folder = "./example/glycolysis_model/";
		String folder = "./example/120304_glycolysis_annotated/";
		String separator = "\t";
		String modelinfo_file = folder + "modelinfo.dat";
		String compartment_file = folder + "compartments.dat";
		String compound_file = folder + "compounds.dat";
		String reaction_file = folder + "reactions.dat";
		String stoichiometric_matrix_file = folder + "stoichiometry.dat";
		
		SBMLInformation info = new SBMLInformation(compartment_file, compound_file, reaction_file,
													stoichiometric_matrix_file, modelinfo_file, separator);
		// Print the information from the files
		System.out.println("\n*** Compartments ***");
		SBMLInformation.printInformation(info.getCompartments());
		System.out.println("\n*** Compounds ***");
		SBMLInformation.printInformation(info.getCompounds());
		System.out.println("\n*** Reactions ***");
		SBMLInformation.printInformation(info.getReactions());
		System.out.println("\n*** Stoichiometric Matrix ***");
		SBMLInformation.printStoichiometricMatrix(info.getStoichiometric_matrix());
	}
}
