package io;
/**
 * Uses text file information to create the suitable SBML.
 * 
 * author : Matthias Koenig
 * date : 04.01.2010
 */

import java.io.IOException;
import java.util.Map;

import org.sbml.libsbml.Compartment;
import org.sbml.libsbml.ListOfCompartments;
import org.sbml.libsbml.ListOfSpecies;
import org.sbml.libsbml.Model;
import org.sbml.libsbml.Reaction;
import org.sbml.libsbml.SBMLDocument;
import org.sbml.libsbml.Species;
import org.sbml.libsbml.SpeciesReference;
import org.sbml.libsbml.Unit;
import org.sbml.libsbml.UnitDefinition;
import org.sbml.libsbml.libsbml;
import org.sbml.libsbml.libsbmlConstants;


/**
 * SBMLMatlabExporter 
 * based on given compound, compartment, reaction, and stoichiometric matrix. 
 */

public class SBMLMatlabExport {
	
	
	/** Write the stoichiometric Matrix to SBML.
	 * All necessary information stored in the SBMLInformation Class.
	 * @throws IOException 
	 * 
	 * */
	public static void write(SBMLInformation info, String out_file) throws IOException{
		// 		
		Map<Integer, String[]> compartment_map = info.getCompartments();
		Map<Integer, String[]> compounds_map = info.getCompounds();
		Map<Integer, String[]> reactions_map = info.getReactions();
		
		// Use libSBML for the file export.
		boolean sbml_copasi = true;
		long level = 2;
		long version = 4;
		SBMLDocument doc = new SBMLDocument(level, version);
		
		
		// Model Information
		Model model = doc.createModel();
		model.setName("Koenig2012_Human_Hepatic_Glucose_Metabolism");
		model.setId("Koenig2012_HPGM_v1.0");
		// General model information
		//model.setNotes(info.getModelInfo());
		//model.setNotes(info.getCompartmentsHTML());
		model.setNotes(info.getModelInfo() + info.getCompartmentsHTML() + info.getCompoundsHTML() + info.getReactionsHTML());
		
		
		// Create units
		// mM
		UnitDefinition ud = model.createUnitDefinition();
		ud.setId("mM");
		ud.setName("mM");
		Unit u = ud.createUnit();
		u.setKind(libsbmlConstants.UNIT_KIND_MOLE);
		u.setExponent(1);
		u.setScale(-3);
		u = ud.createUnit();
		u.setKind(libsbmlConstants.UNIT_KIND_LITRE);
		u.setExponent(-1);
		model.addUnitDefinition(ud);
		
/*		// µmol/kg/s
		ud = model.createUnitDefinition();
		ud.setId("flux");
		ud.setName("µmol/kg/s");
		u = ud.createUnit();
		u.setKind(libsbmlConstants.UNIT_KIND_MOLE);
		u.setExponent(1);
		u.setScale(-6);
		u = ud.createUnit();
		u.setKind(libsbmlConstants.UNIT_KIND_KILOGRAM);
		u.setExponent(-1);
		u = ud.createUnit();
		u.setKind(libsbmlConstants.UNIT_KIND_SECOND);
		u.setExponent(-1);
		model.addUnitDefinition(ud);*/
		
		
		// Temp variables
		String [] content;
		String id;
		String name;
		String comp_name;
		Integer dimension;
		Boolean constant;
		Double size;
		String annotation;
		
		// µmol/kg/min
		
/*		ud = model.createUnitDefinition();
		ud.setId("mM");
		ud.setName("mM");
		Unit u = ud.createUnit();
		u.setKind(libsbmlConstants.UNIT_KIND_MOLE);
		u.setExponent(1);
		u.setScale(-3);
		u = ud.createUnit();
		u.setKind(libsbmlConstants.UNIT_KIND_LITER);
		u.setExponent(-1);*/
				
		// Create compartments
		for (Integer key : compartment_map.keySet()){
			content = compartment_map.get(key);
			id = content[1];
			name = content[2];
			dimension = Integer.parseInt(content[3]);
			size = Double.parseDouble(content[4]);

			Compartment compartment = model.createCompartment();
			
			compartment.setId(id);
			if (sbml_copasi){
				compartment.setName(id);
			}
			else{
				compartment.setName(name);
			}
			compartment.setSize(size);
			compartment.setSpatialDimensions(dimension);
			compartment.setSBOTerm(content[6]);
			if (content[5].equals("Y")){
				compartment.setConstant(true);
			}
			else {
				compartment.setConstant(false);
			}
			
			// append annotation
			annotation = content[6] + " " + content[7] + "\t";
			annotation = annotation + content[8] + " " + content[9];
			compartment.appendAnnotation(annotation);
			
			compartment.setSBOTerm(content[6]);
			
			model.addCompartment(compartment);	
		}		

		// Create the species
		Map<Integer, String[]> compounds = info.getCompounds();
		for (Integer key : compounds.keySet()){
			// get info
			content = compounds.get(key);
			System.out.println();
			
			
			id = content[1];		// short name
			name = content[2];		// full name
			comp_name = content[3];
			// create species
			Species s = model.createSpecies();
			s.setId(id);
			if (sbml_copasi){
				s.setName(id);
			}
			else{
				s.setName(name);
			}
			s.setCompartment(comp_name);
			if (content[4].equals("Y") && !(sbml_copasi)){
				s.setConstant(true);
			}
			s.setInitialConcentration(Double.parseDouble(content[5]));
			s.setSubstanceUnits("mM");
			s.setSBOTerm(content[9]);
			// append annotation
			annotation = content[6] + "\t";
			annotation = annotation + content[7] + "\t";
			annotation = annotation + content[8] + "\t";
			annotation = annotation + content[9] + " " + content[10] + "\t";
			s.appendAnnotation(annotation);
			
			model.addSpecies(s);
		}
		
		// Information necessary to create the reactions
		ListOfSpecies slist = model.getListOfSpecies();
		String[] r_content;

		Integer c_size = compounds_map.size();
		Integer r_size = reactions_map.size();
		
		Double[][] N = info.getStoichiometric_matrix();
		double stoichiometry;
		
		// Create the reactions
		for (int r=0; r<r_size; ++r){
			
			r_content = reactions_map.get(r);
			id = r_content[1];			// short name
			name = r_content[2] + " " + r_content[3];		// reaction equation
			
			Reaction reaction = model.createReaction();
			reaction.setId(id);
			if (sbml_copasi){
				reaction.setName(id);
			}
			else{
				reaction.setName(name);
			}
			if (r_content[4].equals("Y")){
				reaction.setReversible(false);
			}
			reaction.setSBOTerm(r_content[11]);
			
			// Use information in the stoichiometric
			// matrix to create reactants and products
			for (int c=0; c<c_size; ++c){
				stoichiometry = N[c][r];
				// participant in reaction
				if (stoichiometry != 0.0){
					id = compounds_map.get(c)[1];
					Species s = slist.get(id);
					SpeciesReference sr = new SpeciesReference(level, version);
					sr.setSpecies(s.getId());
					// reactant
					if (stoichiometry < 0){
						sr.setStoichiometry( - 1.0 * stoichiometry);
						reaction.addReactant(sr);
					}
					// product
					if (stoichiometry > 0){
						sr.setStoichiometry( 1.0 * stoichiometry);
						reaction.addProduct(sr);					
					}	
				}
			}
			model.addReaction(reaction);
		}
		
		// Test for errors
	    if (doc.getNumErrors() > 0)
	    {
	      doc.printErrors();
	      throw new IOException("SBML errors in SBML L" + level + "V" + version);
	    }
		
		// Write the model to file
		libsbml.writeSBML(doc, out_file);
	}

	 static
	  {
	    try
	    {
	      System.loadLibrary("sbmlj");
	      /* Extra check to be sure we have access to libSBML: */
	      Class.forName("org.sbml.libsbml.libsbml");
	    }
	    catch (Exception e)
	    {
	      System.err.println("Error: could not load the libSBML library");
	      System.exit(1);
	    }
	  }


	public static void main(String[] args) throws IOException{
		// Write the SBML File
		System.out.println("*** CREATE SBML ***");
		System.out.println("arguments:");
		for (int k=0; k<args.length; ++k){
			System.out.println(args[k]);
		}
		
		//String folder = "./example/glycolysis_model/";
		 String folder = "./example/120304_glycolysis_annotated/";
		//String folder = args[0];
		String separator = "\t";
		if (args.length > 1){
			separator = args[1];
		}
		String modelinfo_file = folder + "/" + "modelinfo.html";
		String compartment_file = folder + "/" + "compartments.dat";
		String compound_file = folder + "/" + "compounds.dat";
		String reaction_file = folder + "/" +  "reactions.dat";
		String stoichiometric_matrix_file = folder + "/" + "stoichiometry.dat";

		SBMLInformation info = new SBMLInformation(compartment_file, compound_file, reaction_file,
													stoichiometric_matrix_file, modelinfo_file, separator);
		// Write   
		System.out.println("*** Write SBML ***");
		String out_file = folder + "/" + "test.xml";
		SBMLMatlabExport.write(info, out_file);
	}
}
