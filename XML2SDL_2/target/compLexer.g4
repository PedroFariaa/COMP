lexer grammar compLexer;

/* NODE NAMES TOKENS */
AIRPORT : 'Airport';
TOWER : 'Tower';
SERVICES : 'Services';
COM : 'Com';
RUNWAY : 'Runway';
MARKINGS : 'Markings';
LIGHTS : 'Lights';
OFFSETTHRESHOLD : 'OffsetThreshold';
BLASTPAD : 'BlastPad';
OVERRUN : 'Overrun';
APPROACHLIGHTS : 'ApproachLights';
ILS : 'Ils';
GLIDESLOPE : 'GlideSlope';
DME : 'Dme';
VISUALMODEL : 'VisualModel';
BIASXYZ : 'BiasXYZ';
RUNWAYALIAS : 'RunwayAlias';
VERTEX : 'Vertex';
WAYPOINT : 'Waypoint';
ROUTE : 'Route';
PREVIOUS : 'Previous';
NEXT : 'Next';
TAXIWAYPOINT : 'TaxiwayPoint';
TAXIWAYPARKING : 'TaxiwayParking';
TAXINAME : 'TaxiName';
TAXIWAYPATH : 'TAxiwayPath';
VASI : 'Vasi';
HELIPAD : 'Helipad';
RUNWAYSTART_NODE : 'RunwayStart';

/* ATTRIBUTES TOKENS */
REGION : 'region';
COUNTRY : 'country';
STATE : 'state';
CITY : 'city';
NAME : 'name';
LAT : 'lat';
LON : 'lon';
ALT : 'alt';
MAGVAR : 'magvar';
IDENT : 'ident';
AIRPORT_TEST_RADIUS : 'airportTestRadius';
TRAFFIC_SCALAR : 'trafficScalar';
TYPE : 'type';
AVAILABILITY : 'availability';
FREQUENCY : 'frequency';
SURFACE : 'surface';
HEADING : 'heading';
LENGTH : 'length';
WIDTH : 'width';
NUMBER : 'number';
DESIGNATOR : 'designator';
PRIMARY_DESIGNATOR : 'primaryDesignator';
SECONDARY_DESIGNATOR : 'secondaryDesignator';
PATTERN_ALT : 'patternAltitude';
PRIMARY_TAKEOFF : 'primaryTakeoff';
PRIMARY_LANDING : 'primaryLanding';
PRIMARY_PATTERN : 'primaryPattern';
SECONDARY_TAKEOFF : 'secondaryTakeoff';
SECONDARY_LANDING : 'secondaryLanding';
SECONDARY_PATTERN : 'secondaryPattern';
PRIMARY_MARKING_BIAS : 'primaryMarkingBias';
SECONDARY_MARKING_BIAS : 'secondaryMarkingBias';
ALTERNATE_THRESHOLD : 'alternateThreshold';
ALTERNATE_TOUCHDOWN : 'alternateTouchdown';
ALTERNATE_FIXED_DISTANCE : 'alternateFixedDistance';
ALTERNATE_PRECISION : 'alternatePrecision';
LEADING_ZERO_IDENT : 'leadingZeroIdent';
NO_THRESHOLD_END_ARROWS : 'noThreshHoldEndArrows';
EDGES : 'edges';
THRESHOLD : 'threshold';
FIXED : 'fixed';
FIXED_DISTANCE : 'fixedDistance';
TOUCHDOWN : 'touchdown';
DASHES : 'dashes';
PRECISION : 'precision';
EDGE_PAVEMENT : 'edgePavement';
SINGLE_END : 'singleEnd';
PRIMARY_CLOSED : 'primaryClosed';
SECONDARY_CLOSED : 'secondaryClosed';
PRIMARY_STOL : 'primaryStol';
SECONDARY_STOL : 'secondaryStol';
CENTER : 'center';
EDGE : 'edge';
CENTER_RED : 'centerRed';
END : 'end';
SYSTEM : 'system';
STROBES : 'strobes';
REIL : 'reil';
END_LIGHTS : 'endLights';
SIDE : 'side';
BIAS_X : 'biasX';
BIAS_Z : 'biasZ';
BIAS_Y : 'biasY';
SPACING : 'spacing';
PITCH : 'pitch';
RANGE : 'range';
BACK_COURSE : 'backCourse';
IMAGE_COMPLEXITY : 'imageComplexity';
INSTANCE_ID : 'instanceId';
WAYPOINT_TYPE : 'waypointType';
WAYPOINT_REGION : 'waypointRegion';
WAYPOINT_IDENT : 'waypointIdent';
ROUTE_TYPE : 'routeType';
ALTITUDE_MINIMUM : 'altitudeMinimum';
CLOSED : 'closed';
TRANSPARENT : 'transparent';
RED : 'red';
GREEN : 'green';
BLUE : 'blue';
INDEX : 'index';
ORIENTATION : 'orientation';
RADIUS : 'radius';
AIRLINE_CODES : 'airlineCodes';
PUSHBACK : 'pushBack';
TEE_OFFSET_1 : 'teeOffset1';
TEE_OFFSET_2 : 'teeOffset2';
TEE_OFFSET_3 : 'teeOffset3';
TEE_OFFSET_4 : 'teeOffset4';
START : 'start';
WEIGHT_LIMIT : 'weightLimit';
CENTER_LINE : 'centerLine';
CENTER_LINE_LIGHTED : 'centerLinelighted';
LEFT_EDGE : 'leftEdge';
LEFT_EDGE_LIGHED : 'leftEdgeLighted';
RIGHT_EDGE : 'rightEdge';
RIGHT_EDGE_LIGHTED : 'rightEdgeLighted';
DRAW_SURFACE : 'drawSurface';
DRAW_DETAIL : 'drawDetail';


/* ATTRIBUTE'S VALUES */
LENGTH_UNIT : 'M'|'F';
NAUTICAL : 'N';
FUEL_VALUES : '73' | 
			  '87' | 
			  '100' | 
			  '130' | 
			  '145' | 
			  'MOGAS' | 
			  'JET' | 
			  'JETA' | 
			  'JETA1' | 
			  'JETAP' | 
			  'JETB' | 
			  'JET4' | 
			  'JET5' | 
			  'UNKNOWN';
FUEL_AVAILABILTY_VALUES : 'YES' | 
						  'NO' | 
						  'UNKNOWN' | 
						  'PRIOR_REQUEST';
COM_TYPES_VALUES : 'APPROACH' | 
				   'ASOS' | 
				   'AWOS' | 
				   'CENTER' | 
				   'CLEARANCE' | 
				   'CLEARANCE_PRE_TAXI' | 
				   'CTAF' | 
				   'DEPARTURE' | 
				   'FSS' | 
				   'GROUND' | 
				   'MULTICOM' | 
				   'REMOTE_CLEARANCE_DELIVERY' | 
				   'TOWER' | 
				   'UNICOM';

SURFACE_TYPES_VALUES : 'ASPHALT' | 
					   'BITUMINOUS' | 
					   'BRICK' | 
					   'CLAY' | 
					   'CLEMENT' | 
					   'CONCRETE' | 
					   'CORAL' | 
					   'DIRT' | 
					   'GRASS' | 
					   'GRAVEL' | 
					   'ICE' | 
					   'MACADAM' | 
					   'OIL_TREATED, PLANKS' | 
					   'SAND' | 
					   'SHALE' | 
					   'SNOW' | 
					   'STEEL_MATS' | 
					   'TARMAC' | 
					   'UNKNOWN' | 
					   'WATER';

RUNWAY_NUMBER_VALUES : NUM | 
					   NUM | 
					   'EAST' | 
					   'NORTH' | 
					   'NORTHEAST' | 
					   'NORTHWEST' | 
					   'SOUTH' | 
					   'SOUTHEAST' | 
					   'SOUTHWEST' | 
					   'WEST';

DESIGNATOR_VALUES : 'NONE' | 
					'C' | 
					'CENTER' | 
					'L' | 
					'LEFT' | 
					'R' | 
					'RIGHT' | 
					'W' | 
					'WATER' | 
					'A' | 
					'B';

BOOLEAN_VALUES : ('TRUE' | 'YES') | ('FALSE' | 'NO');

PATTERN_VALUES : 'LEFT' | 'RIGHT';

RUNWAY_LIGHT_VALUES : 'NONE' | 'LOW' | 'MEDIUM' | 'HIGH';

END_ATTR_VALUES : 'PRIMARY' | 'SECONDARY';

SYSTEM_APPROACH_LIGHTS_VALUES : 'NONE' | 
								'ALSF1' | 
								'ALSF2' | 
								'CALVERT' | 
								'CALVERT2' | 
								'MALS' | 
								'MALSF' | 
								'MALSR' | 
								'ODALS' | 
								'RAIL' | 
								'SALS' | 
								'SALSF' | 
								'SSALF' | 
								'SSALR' | 
								'SSALS';

TYPE_VASI_VALUES : 'PAPI2 (2 light PAPI)' | 
				   'PAPI4 (4 light PAPI)' | 
				   'PVASI (Pulsating VASI)' | 
				   'TRICOLOR Tri Color VASI' | 
	               'TVASI colored VASI in a shared-"T" shape' | 
	               'VASI21 2 rows, 1 box/row' | 
	               'VASI22 2 rows, 2 boxes/row' | 
	               'VASI23 2 rows, 3 boxes/row' |  
                   'VASI31 3 rows, 1 box/row' | 
                   'VASI32 3 rows, 2 boxes/row' | 
                   'VASI33 3 rows, 3 boxes/row (far row has only two boxes, 8 light system)' | 
                   'BALL (presently remapped to PVASI)' | 
                   'APAP (panels)' | 
                   'PANELS (presently remapped to PAP2)';

RUNWAY_START_VALUE : 'RUNWAY';

IMAGE_COMPLEXITY_VISUALMODEL_VALUES : 'VERY_SPARSE' | 
									  'SPARSE' | 
									  'NORMAL' | 
									  'DENSE' | 
									  'VERY_DENSE';

WAYPOINT_TYPE_VALUES: 'NAMED' | 
					  'UNNAMED' | 
					  'VOR' | 
					  'NDB' | 
					  'OFF_ROUTE' | 
					  'IAF' | 
					  'FAF';

ROUTE_TYPE_VALUES : 'VICTOR' | 
					'JET' | 
					'BOTH';

HELIPAD_TYPE_VALUES : 'NONE' | 
					  'CIRCLE' |
					  'H' |
					  'MEDICAL' |
					  'SQUARE';

TAXIWAY_TYPE_VALUES : 'NORMAL' | 
					  'HOLD_SHORT' | 
					  'ILS_HOLD_SHORT' | 
					  'HOLD_SHORT_NO_DRAW' | 
					  'ILS_HOLD_SHORT_NO_DRAW';

TAXIWAY_ORIENTATION_VALUES : 'FORWARD' | 'REVERSE';

PARKING_TYPE_VALUES : 'NONE' | 
					  'DOCK_GA' | 
					  'FUEL' | 
					  'GATE_HEAVY' | 
					  'GATE_MEDIUM' | 
					  'GATE_SMALL' | 
					  'RAMP_CARGO' | 
					  'RAMP_GA' | 
					  'RAMP_GA_LARGE' | 
					  'RAMP_GA_MEDIUM' | 
					  'RAMP_GA_SMALL' | 
					  'RAMP_MIL_CARGO' | 
					  'RAMP_MIL_COMBAT' | 
					  'VEHICLE' ;

PARKING_NAME_VALUES : 'PARKING' | 
					  'DOCK' | 
					  'GATE' | 
					  'GATE_UPPER' | 
					  'NONE' | 
					  'N_PARKING' | 
					  'NE_PARKING' | 
					  'NW_PARKING' | 
					  'SE_PARKING' | 
					  'SW_PARKING' | 
					  'W_PARKING' | 
					  'E_PARKING';

TAXIWAY_PATH_VALUES : 'RUNWAY' | 
					  'PARKING' | 
					  'TAXI' | 
					  'PATH' | 
					  'CLOSED' | 
					  'VEHICLE';



/* GENERAL TOKENS */
INTLAT : [0-90] ;
NUM : [0-9]+ ;
UPPER : [A-Z];
CHAR : [A-Z] | [a-z];
STRING : ([a-z] | [A-Z])+;
ASPAS : '"' ;
CLOSE_TAG : '>';
STARTNODE : '<';
ENDNODE : '/>';
START_END_NODE : '</';
EQUAL : '=';
MINUS : '-';
DOT : '.';

WS: [ \t\n\r]+ -> skip ;


