parser grammar comp;

options {tokenVocab= compLexer;}

start : STARTNODE AIRPORT attributes* CLOSE_TAG airport_nodes* START_END_NODE AIRPORT CLOSE_TAG;

airport_nodes : tower_node | services_node | com_node | runway_node | runwayalias_node | waypoint_node | helipad_node | taxi_nodes;

taxi_nodes : taxiwaypoint_node taxiwayparking_node taxiname_node taxiwaypath_node;

attributes : (REGION EQUAL value_string) |
			 (COUNTRY EQUAL value_string) |
			 (STATE EQUAL value_string) |
			 (CITY EQUAL value_string) |
			 (NAME EQUAL value_string) |
			 (LAT EQUAL value_lat) |
			 (LON EQUAL value_lon) |
			 (ALT EQUAL value_alt) |
			 (MAGVAR EQUAL value_magvar) |
			 (IDENT EQUAL value_string) |
			 (AIRPORT_TEST_RADIUS EQUAL value_radius) |
			 (TRAFFIC_SCALAR EQUAL value_tscalar);

value_string : ASPAS STRING ASPAS; /* Falta semantica - max 48chars */

value_lat : ASPAS (lat_decimal | lat_degree) ASPAS;
lat_decimal : ASPAS MINUS? INTLAT (DOT NUM+)? ASPAS;
lat_degree : ASPAS NUM ASPAS; /* FALTA SEMANTICA */

value_lon : ASPAS (lon_decimal | lon_degree) ASPAS;
lon_decimal : ASPAS NUM ASPAS; /* FALTA SEMANTICA */
lon_degree : ASPAS NUM ASPAS; /* FALTA SEMANTICA */

value_alt : ASPAS (NUM* (DOT NUM+)? LENGTH_UNIT?) ASPAS;
value_radius : ASPAS (NUM* (LENGTH_UNIT | NAUTICAL)?) ASPAS;

value_magvar : ASPAS MINUS? NUM* (DOT NUM+)? ASPAS; /* FALTA SEMANTICA */
value_tscalar : ASPAS NUM DOT NUM ASPAS; /* FALTA SEMANTICA */

/* TOWER NODE */
tower_node : STARTNODE TOWER tower_attributes* ENDNODE;

tower_attributes : 	(LAT EQUAL value_lat)
					(LON EQUAL value_lon)
					(ALT EQUAL value_alt);

/* SERVICES NODE */
services_node : SERVICES fuel* START_END_NODE SERVICES CLOSE_TAG;

fuel : (TYPE EQUAL typeOfFuel) | (AVAILABILITY EQUAL fuelAvail);

typeOfFuel : ASPAS FUEL_VALUES ASPAS;

fuelAvail : ASPAS FUEL_AVAILABILTY_VALUES ASPAS;


/* COM NODE */
com_node : STARTNODE COM com_attributes* ENDNODE;

com_attributes : (FREQUENCY EQUAL freq_value) |
				 (TYPE EQUAL com_types) |
				 (NAME EQUAL value_string);

freq_value : ASPAS NUM+ (DOT NUM+)? ASPAS; /* falta semantica */

com_types : ASPAS COM_TYPES_VALUES ASPAS;


/* RUNWAY NODE */
runway_node : RUNWAY runway_attributes* CLOSE_TAG runway_nodes* START_END_NODE RUNWAY CLOSE_TAG;

runway_nodes : markings_node | lights_node | offsetthreshold_node | blastpad_node | overrun_node | approachlights_node | vasi_node | ils_node | runwaystart_node;

runway_attributes: (LAT EQUAL value_lat) |
				   (LON EQUAL value_lon) |
				   (ALT EQUAL value_alt) |
				   (SURFACE EQUAL surface_types) |
				   (HEADING EQUAL heading_values) |
				   (LENGTH  EQUAL value_alt) |
				   (WIDTH EQUAL value_alt) |
				   (NUMBER EQUAL runway_number) |
				   (DESIGNATOR EQUAL designator_attr) |
				   (PRIMARY_DESIGNATOR EQUAL primary_designator) |
				   (SECONDARY_DESIGNATOR EQUAL secondary_designator) |
				   (PATTERN_ALT EQUAL value_alt) |
				   (PRIMARY_TAKEOFF EQUAL boolean_value) |
				   (PRIMARY_LANDING EQUAL boolean_value) |
				   (PRIMARY_PATTERN EQUAL pattern_value) |
				   (SECONDARY_TAKEOFF EQUAL boolean_value) |
				   (SECONDARY_LANDING EQUAL boolean_value) |
				   (SECONDARY_PATTERN EQUAL pattern_value) |
				   (PRIMARY_MARKING_BIAS EQUAL runway_markings) |
				   (SECONDARY_MARKING_BIAS EQUAL runway_markings);

surface_types : ASPAS SURFACE_TYPES_VALUES ASPAS;

heading_values : ASPAS (NUM* (DOT NUM+)?) ASPAS; /* falta semantica */

runway_number : ASPAS RUNWAY_NUMBER_VALUES ASPAS; /* falta semantica */

designator_values : ASPAS DESIGNATOR_VALUES ASPAS; /* falta semantica */

primary_designator : designator_values; /* falta semantica */

secondary_designator : designator_values; /* falta semantica */

boolean_value : ASPAS BOOLEAN_VALUES ASPAS; /* falta semantica */

pattern_value : ASPAS PATTERN_VALUES ASPAS; /* falta semantica */

runway_markings : ASPAS (NUM (LENGTH_UNIT | NAUTICAL)) ASPAS;

designator_attr : ASPAS designator_values ASPAS;

/* MARKINGS NODE */
markings_node : STARTNODE MARKINGS markings_attributes* ENDNODE;

markings_attributes : markings_attr* EQUAL ASPAS boolean_value ASPAS;

markings_attr : ALTERNATE_THRESHOLD | 
				ALTERNATE_TOUCHDOWN | 
				ALTERNATE_FIXED_DISTANCE | 
				ALTERNATE_PRECISION | 
				LEADING_ZERO_IDENT | 
				NO_THRESHOLD_END_ARROWS | 
				EDGES | 
				THRESHOLD | 
				FIXED | 
				TOUCHDOWN | 
				DASHES | 
				IDENT | 
				PRECISION | 
				EDGE_PAVEMENT | 
				SINGLE_END | 
				PRIMARY_CLOSED | 
				SECONDARY_CLOSED | 
				PRIMARY_STOL | 
				SECONDARY_STOL;

/* LIGHTS NODE */
lights_node : STARTNODE LIGHTS lights_attributes* ENDNODE;

lights_attributes : lights_center | lights_edge | lights_centerred;

lights_center : CENTER EQUAL ASPAS RUNWAY_LIGHT_VALUES ASPAS;

lights_edge : EDGE EQUAL ASPAS RUNWAY_LIGHT_VALUES ASPAS;

lights_centerred : CENTER_RED EQUAL ASPAS boolean_value ASPAS;


/* OFFSET_THRESHOLD NODE */
offsetthreshold_node : STARTNODE OFFSETTHRESHOLD offsetthreshold_attr* ENDNODE;

offsetthreshold_attr : end_attr | length_attr | width_attr | surface_attr;

end_attr : END EQUAL ASPAS END_ATTR_VALUES ASPAS;

length_attr : LENGTH EQUAL value_alt;

surface_attr: SURFACE EQUAL surface_types;

/* BLASTPAD NODE */
blastpad_node : STARTNODE BLASTPAD blastpad_attr* ENDNODE;

blastpad_attr : end_attr | length_attr | width_attr | surface_attr;

/* OVERRUN NODE */
overrun_node : STARTNODE OVERRUN overrun_attr* ENDNODE;

overrun_attr : end_attr | length_attr | width_attr | surface_attr;

/* APPROACH LIGHTS NODE */
approachlights_node : STARTNODE APPROACHLIGHTS approachlights_attr* ENDNODE;

approachlights_attr : end_attr | system_approachlights | strobes_approachlights | reil_approachlights | touchdown_approachlights | endlights_approachlights;

system_approachlights : SYSTEM EQUAL ASPAS SYSTEM_APPROACH_LIGHTS_VALUES ASPAS;

strobes_approachlights : STROBES EQUAL ASPAS NUM ASPAS; /* falta semantica */

reil_approachlights : REIL EQUAL ASPAS boolean_value ASPAS;

touchdown_approachlights : TOUCHDOWN EQUAL ASPAS boolean_value ASPAS;

endlights_approachlights : END_LIGHTS EQUAL ASPAS boolean_value ASPAS;

/* VASI NODE */
vasi_node : STARTNODE VASI vasi_attr* ENDNODE;

vasi_attr : end_attr | type_vasi | side_vasi | biasX | biasZ | spacing_vasi | pitch_vasi;

type_vasi : TYPE EQUAL ASPAS TYPE_VASI_VALUES ASPAS;

side_vasi : SIDE EQUAL ASPAS PATTERN_VALUES ASPAS;

spacing_vasi : SPACING EQUAL ASPAS NUM ASPAS;

pitch_vasi : PITCH EQUAL ASPAS NUM ASPAS; /* falta semantica */

/* ILS NODE */
ils_node : ILS ils_attr* CLOSE_TAG ils_nodes* START_END_NODE ILS CLOSE_TAG;

ils_nodes : glideslope_node | dme_node | visualmodel_node;

ils_attr : lat_attr | lon_attr | alt_attr | heading_attr | freq_attr | end_attr | range_ils | magvar_attr | ident_ils | width_attr | name_ils | backcourse_ils;

lat_attr : LAT EQUAL value_lat;

lon_attr : LON EQUAL value_lon;

alt_attr : ALT EQUAL value_alt;

heading_attr : HEADING EQUAL ASPAS NUM DOT NUM ASPAS; /* falta semantica */

freq_attr : FREQUENCY EQUAL ASPAS NUM DOT NUM ASPAS; /* falta semantica */

range_ils : RANGE EQUAL ASPAS NUM NAUTICAL? ASPAS; /* falta semantica */

magvar_attr : MAGVAR EQUAL ASPAS NUM DOT NUM ASPAS; /* falta semantica*/

ident_ils : IDENT EQUAL ASPAS STRING ASPAS; /*falta semantica */

width_attr : WIDTH EQUAL ASPAS NUM DOT NUM ASPAS; /*falta semantica */

name_ils : NAME EQUAL ASPAS STRING ASPAS; /*falta semantica */

backcourse_ils : BACK_COURSE EQUAL ASPAS boolean_value ASPAS;

/* RUNWAYSTART_NODE */
runwaystart_node : STARTNODE RUNWAYSTART_NODE runwaystart_attr* end_runwaynode? ENDNODE;

runwaystart_attr : type_runwaystart | lat_attr | lon_attr | alt_attr | heading_attr ;

type_runwaystart : TYPE EQUAL ASPAS RUNWAY_START_VALUE ASPAS;

end_runwaynode : END EQUAL ASPAS END_ATTR_VALUES ASPAS ; 

/* GLIDESLOPE NODE */
glideslope_node : STARTNODE GLIDESLOPE glideslope_attr* ENDNODE;

glideslope_attr : lat_attr | lon_attr | alt_attr | pitch_vasi | range_ils;

/* DME NODE */
dme_node : STARTNODE DME dme_attr* ENDNODE;

dme_attr : lat_attr | lon_attr | alt_attr | range_ils;

/* VISUAL_MODEL NODE */
visualmodel_node : VISUALMODEL visualmodel_attr* CLOSE_TAG biasxyz_node START_END_NODE VISUALMODEL CLOSE_TAG;

visualmodel_attr : heading_attr | imagecomplexity_visualmodel | name_visualmodel | instanceid_visualmodel;

imagecomplexity_visualmodel : IMAGE_COMPLEXITY EQUAL ASPAS IMAGE_COMPLEXITY_VISUALMODEL_VALUES ASPAS;

name_visualmodel : NAME EQUAL ASPAS name_visualmodel_values ASPAS;
name_visualmodel_values : STRING MINUS STRING MINUS STRING MINUS STRING MINUS STRING;

instanceid_visualmodel : INSTANCE_ID EQUAL ASPAS instanceid_visualmodel_values ASPAS;
instanceid_visualmodel_values : STRING MINUS STRING MINUS STRING MINUS STRING MINUS STRING;

/* BIAS_XYZ NODE */
biasxyz_node : STARTNODE BIASXYZ bias_attr* ENDNODE;

bias_attr : biasX | biasY | biasZ;

biasX : BIAS_X EQUAL ASPAS NUM+ (DOT NUM+)? ASPAS;

biasY : BIAS_Y EQUAL ASPAS NUM+ (DOT NUM+)? ASPAS;

biasZ : BIAS_Z EQUAL ASPAS NUM+ (DOT NUM+)? ASPAS;


/* RUNWAYALIAS NODE */
runwayalias_node : STARTNODE RUNWAYALIAS runwayalias_attr* ENDNODE;

runwayalias_attr : number_attr | designator_attr;

number_attr : NUMBER EQUAL ASPAS runway_number ASPAS;

/* VERTEX NODE */
vertex_node : STARTNODE VERTEX vertex_attr* ENDNODE;

vertex_attr : biasX | biasZ | lon_attr | lat_attr;


/* WAYPOINT NODE */
waypoint_node : WAYPOINT waypoint_attr CLOSE_TAG route_node* START_END_NODE WAYPOINT CLOSE_TAG;

waypoint_attr : lat_attr | lon_attr | waypointtype_waypoint | magvar_attr | waypointregion_waypoint | waypointident_waypoint;

waypointtype_waypoint : WAYPOINT_TYPE EQUAL ASPAS WAYPOINT_TYPE_VALUES ASPAS;

waypointregion_waypoint : WAYPOINT_REGION EQUAL ASPAS STRING ASPAS; /* falta semantica */

waypointident_waypoint : WAYPOINT_IDENT EQUAL ASPAS STRING ASPAS; /* faltas semantica */

/* ROUTE NODE */
route_node : ROUTE route_attr* CLOSE_TAG route_nodes* START_END_NODE ROUTE CLOSE_TAG;

route_nodes : previous_node | next_node;

route_attr : routetype | name_route;

routetype : ROUTE_TYPE EQUAL ASPAS ROUTE_TYPE_VALUES ASPAS;

name_route : NAME EQUAL ASPAS STRING ASPAS; /* falta semantica */

/* PREVIOUS NODE */
previous_node : STARTNODE PREVIOUS previous_attr* ENDNODE;

previous_attr : waypointtype_waypoint | waypointregion_waypoint | waypointident_waypoint | altitudeMinimum_attr;

altitudeMinimum_attr : ALTITUDE_MINIMUM EQUAL ASPAS NUM+ (DOT NUM+)? ASPAS; /* falta semantica */

/* NEXT NODE */
next_node : STARTNODE NEXT next_attr* ENDNODE;

next_attr : waypointtype_waypoint | waypointregion_waypoint | waypointident_waypoint | altitudeMinimum_attr;


/* HELIPAD NODE*/
helipad_node : STARTNODE HELIPAD helipad_attr* ENDNODE;

helipad_attr : lat_attr | lon_attr | alt_attr | surface_attr | heading_attr | length_helipad | width_helipad | type_helipad | closed_helipad | transparent_helipad | red_helipad | green_helipad | blue_helipad ;

length_helipad : LENGTH EQUAL NUM+ (DOT NUM+)? LENGTH_UNIT? ;

width_helipad : WIDTH EQUAL NUM+ (DOT NUM+)? LENGTH_UNIT? ;

type_helipad : TYPE EQUAL ASPAS HELIPAD_TYPE_VALUES ASPAS;

closed_helipad : CLOSED EQUAL ASPAS boolean_value ASPAS;

transparent_helipad : TRANSPARENT EQUAL ASPAS boolean_value ASPAS;

red_helipad : RED EQUAL ASPAS NUM+ ASPAS; /*FALTA SEMANTICA*/

green_helipad : GREEN EQUAL ASPAS NUM+ ASPAS; /*FALTA SEMANTICA*/

blue_helipad : BLUE EQUAL ASPAS NUM+ ASPAS; /*FALTA SEMANTICA*/


/* TAXiWAY_POINT NODE */
taxiwaypoint_node : STARTNODE TAXIWAYPOINT taxiwaypoint_attr* ENDNODE;

taxiwaypoint_attr: index_taxiway | type_taxiway | orientation_taxiway | lat_attr | lon_attr | biasX | biasZ;

index_taxiway : INDEX EQUAL ASPAS NUM ASPAS; /* falta semantica */

type_taxiway : TYPE ASPAS TAXIWAY_TYPE_VALUES ASPAS;

orientation_taxiway : ORIENTATION EQUAL ASPAS TAXIWAY_ORIENTATION_VALUES ASPAS;

/*TAXIWAYPARKING NODE  */
taxiwayparking_node : STARTNODE TAXIWAYPARKING taxiwayparking_attr* ENDNODE;

taxiwayparking_attr : index_taxiway | lat_attr | lon_attr | biasX | biasZ | heading_attr | radius_taxiway | type_parking | name_parking | number_parking | airlinecodes_parking | pushback_parking | teeoffset1_parking | teeoffset2_parking | teeoffset3_parking  | teeoffset4_parking;

radius_taxiway : RADIUS EQUAL ASPAS NUM+ (DOT NUM+)? ASPAS; /* semantica */

type_parking : TYPE ASPAS PARKING_TYPE_VALUES ASPAS;

name_parking : NAME EQUAL ASPAS PARKING_NAME_VALUES ASPAS;

number_parking : NUMBER EQUAL ASPAS NUM+ ASPAS; /* semantica */

airlinecodes_parking : AIRLINE_CODES EQUAL ASPAS STRING ASPAS; /* semantica */

pushback_parking : PUSHBACK EQUAL ASPAS NUM ASPAS; /* ver documentação */

teeoffset1_parking : TEE_OFFSET_1 EQUAL ASPAS NUM+ (DOT NUM+)? ; /* semantica */

teeoffset2_parking : TEE_OFFSET_2 EQUAL ASPAS NUM+ (DOT NUM+)? ; /* semantica */

teeoffset3_parking : TEE_OFFSET_3 EQUAL ASPAS NUM+ (DOT NUM+)? ; /* semantica */

teeoffset4_parking : TEE_OFFSET_4 EQUAL ASPAS NUM+ (DOT NUM+)? ; /* semantica */

/* TAXINAME NODE */
taxiname_node : STARTNODE TAXINAME taxiname_attr* ENDNODE;

taxiname_attr : index_taxiname | name_taxiname;

index_taxiname : INDEX EQUAL ASPAS NUM+ ASPAS; /* semantica */

name_taxiname : NAME EQUAL ASPAS STRING ASPAS; /* semantica */

/* TAXIWAY PATH NODE */
taxiwaypath_node : STARTNODE TAXIWAYPATH taxiwaypath_attr* ENDNODE;

taxiwaypath_attr : type_taxiwaypath | start_taxiwaypath | end_taxiwaypath | width_attr | weightlimit_taxiwaypath | surface_attr | drawsurface | drawdetail | centerline_taxiwaypath | centerlinelighted_taxiwaypath | leftedge_taxiwaypath | leftedgelighted_taxiwaypath | rightedge_taxiwaypath | rightedgelighted_taxiwaypath | runway_number | designator_attr | name_taxiwaypath;

type_taxiwaypath : TYPE ASPAS TAXIWAY_PATH_VALUES ASPAS;

start_taxiwaypath : START EQUAL ASPAS NUM+ ASPAS; /* semantica */

end_taxiwaypath : END EQUAL ASPAS NUM+ ASPAS; /* semantica */

weightlimit_taxiwaypath : WEIGHT_LIMIT EQUAL ASPAS NUM+ (DOT NUM+)? ASPAS;

centerline_taxiwaypath : CENTER_LINE EQUAL ASPAS boolean_value ASPAS; /* semantica */

centerlinelighted_taxiwaypath : CENTER_LINE_LIGHTED EQUAL ASPAS boolean_value ASPAS; /* semantica */

leftedge_taxiwaypath : LEFT_EDGE EQUAL ASPAS boolean_value ASPAS; /* semantica */

leftedgelighted_taxiwaypath : LEFT_EDGE_LIGHED EQUAL ASPAS boolean_value ASPAS; /* semantica */

rightedge_taxiwaypath : RIGHT_EDGE EQUAL ASPAS boolean_value ASPAS; /* semantica */

rightedgelighted_taxiwaypath : RIGHT_EDGE_LIGHTED EQUAL ASPAS boolean_value ASPAS; /* semantica */

name_taxiwaypath : NAME EQUAL ASPAS NUM+ ASPAS; /* semantica */

drawsurface : DRAW_SURFACE EQUAL ASPAS boolean_value ASPAS;

drawdetail : DRAW_DETAIL EQUAL ASPAS boolean_value ASPAS;