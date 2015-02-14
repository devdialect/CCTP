-- GlobalWarmingOptions
-- Author: FramedArchitecture
-- DateCreated: 11/9/2012
--------------------------------------------------------------

EraThreshold		= "ERA_INDUSTRIAL"		-- Once any Civ enters this Era, Global Warming events may occur. !!This era must exist for Global Warming Mod to function!!
IndexRecalcTurn		= 5						-- Game turns between Global Warming Index recalculations; must be a positive, non-zero integer

WorldSizeVariable	= true					-- Allows more frequent Global Warming events on larger maps, less frequent on smaller maps
GameSpeedVariable	= true					-- Allows more frequent Global Warming events on faster game speeds, less frequent on slower game speeds

WarmingPopulation	= true					-- Allows world population to add to Global Warming effect
WarmingBuildings	= true					-- Allows buildings to add to Global Warming effect
WarmingTechs		= true					-- Allows the discovery of certain technologies to add to Global Warming effect
WarmingFallout		= true					-- Allows plots with Fallout to add to Global Warming effect
WarmingOil			= true					-- Allows plots with Oil Wells and Platforms to add to Global Warming effect
WarmingMines		= true					-- Allows plots with Manufactories, Mines and Quarries to add to Global Warming effect
CoolingForest		= true					-- Allows Forests and Jungles to reduce Global Warming effect
CoolingIce			= true					-- Allows Ice and Snow to reduce Global Warming effect
EcoSpecialist		= true					-- Allows Enviromental Engineer.
DestroyResource		= true					-- Allows plots affected by Global Warming to have resources destroyed.

-- If 'WarmingBuildings' is set to true, these buildings will increase Global Warming frequency and intensity. 
-- Add or remove as many buildings as desired.
WarmingBuildings = {
  "BUILDING_IRONWORKS",
  "BUILDING_FACTORY",
  "BUILDING_SPACESHIP_FACTORY",
  "BUILDING_NUCLEAR_PLANT",
  "BUILDING_MILITARY_BASE",
  "BUILDING_AUTO_PLANT",
  "BUILDING_MASS_TRANSIT",
  "BUILDING_OIL_REFINERY",
  "BUILDING_AIRCRAFT_PLANT", 
  "BUILDING_CHEMICAL_PLANT",
  "BUILDING_INDUSTRIAL_SHIPYARD",
  "BUILDING_ADVANCED_AIRCRAFT_PLANT", 
  "BUILDING_TRANSCONTINENTAL_RAILROAD",
  "BUILDING_ADVANCED_SHIPYARD",
  "BUILDING_ADVANCED_AUTO_PLANT",
  "BUILDING_MECHA_PLANT",
  "BUILDING_BINNENHAFEN", 
  "BUILDING_KOHLEKRAFTWERK",
  "BUILDING_WASTE_PLANT",
  "BUILDING_PLASTIKFABRIK",
  "BUILDING_SHIPYARDS",
  "BUILDING_AIRSHIP_HANGAR",
  "BUILDING_NEOPLANT",
  "BUILDING_NEOPLANT2",
  "BUILDING_PETROLEUM", 
  "BUILDING_COALMAN",
  "BUILDING_RADIOACTICMAN", 
  "BUILDING_OILMAN",
  "BUILDING_ALUMAN", 
  "BUILDING_TITANMAN",  
  "BUILDING_BOREHOLE",

}

-- If 'WarmingBuildings' is set to true, these buildings will decrease Global Warming frequency and intensity. 
-- Add or remove as many buildings as desired.
CoolingBuildings = {
  "BUILDING_GARDEN",
  "BUILDING_HYDRO_PLANT",
  "BUILDING_SOLAR_PLANT",
  "BUILDING_RECYCLING_CENTER",
  "BUILDING_GRID_ENERGY_STORAGE",
  "BUILDING_SOLARTOWER",
  "BUILDING_CCTPPB124",
  "BUILDING_CCTPPB125",
  "BUILDING_CCTPPB129", 
  "BUILDING_CCTPPB137", 
  "BUILDING_BIOTECH_INDUSTRIAL_PARK",
  "BUILDING_FUSION_POWER_PLANT", 
  "BUILDING_OCEAN_HABITAT_PROTOTYPE", 
  "BUILDING_BEEF_VAT", 
  "BUILDING_MOLECULAR_FABRICATION_PLANT", 
  "BUILDING_ARCOLOGY", 
  "BUILDING_GEOTHERM",
  "BUILDING_WINDTURBINEN",
  "BUILDING_OSWINDPARK", 
  "BUILDING_WIEDERAUFBEREITUNGSANLAGE", 
  "BUILDING_BIO_REFINERY", 
  "BUILDING_SYNTHETIC_PETROL_PLANT",
  "BUILDING_SKYLIFT", 
  "BUILDING_INVENTORS_HALL", 
  "BUILDING_BIOFUEL_REFINERY",
  "BUILDING_ORBITAL_POWER_TRANSMITTER",
  "BUILDING_TESLA",
  "BUILDING_BRENNZELLE",
  "BUILDING_TEMPLE_OF_GAIA",
  "BUILDING_TELEPORTER",
  "BUILDING_KATASTROPHENSCHUTZ",
  "BUILDING_WALD",
  "BUILDING_TARZAN", 
  "BUILDING_WETTER", 
  "BUILDING_BGARDEN",
}

-- If 'WarmingTechs' is set to true, these technologies will increase Global Warming frequency and intensity. 
-- Add or remove as many techs as desired.
WarmingTechnologies = {
  "TECH_ELECTRICITY",
  "TECH_COMBUSTION",
  "TECH_GLOBALIZATION",
  "TECH_OIL_COMPANIES",
  "TECH_INDUSTRIALIZATION",
  "TECH_MOTORIZED_TRANSPORTATIONS",
  "TECH_MASS_TRANSIT",
  "TECH_DEEP_DRILLING",
  "TECH_INDUSTRIAL_PROCESSES",
  "TECH_SCORCHED_EARTH",
  "TECH_INFERNAL_COMBUSTION",
  "TECH_MEGA_ENGINEERING",
  "TECH_EXTREME_ENGINEERING", 
  "TECH_SUBTERRANEAN_EXPLORATION",
}

-- If 'WarmingTechs' is set to true, these technologies will decrease Global Warming frequency and intensity. 
-- Add or remove as many techs as desired.
CoolingTechnologies = {
  "TECH_ECOLOGY",
  "TECH_NUCLEAR_FUSION",
  "TECH_TELECOM",
  "TECH_ENVIRONMENTAL_ECONOMICS",
  "TECH_ENVIRONMENT",
  "TECH_ECO_SYSTEM",
  "TECH_ECOLOGICAL_ENGINEERING",
  "TECH_BIOENGINEERING", 
  "TECH_PLANETARY_NETWORKS", 
  "TECH_GENETIC_SYNTHESIS",
  "TECH_SUPER_BATTERIES",
  "TECH_FUEL_CELLS",
  "TECH_UNDERWATER_HABITATION",
  "TECH_ARCOLOGIES",

}