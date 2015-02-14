

INSERT INTO PolicyBranchClassTypes (Type) VALUES("BRANCHCLASS_SOCIAL_POLICY");
INSERT INTO PolicyBranchClassTypes (Type) VALUES("BRANCHCLASS_IDEOLOGY");

UPDATE PolicyBranchClassTypes SET Description	= "TXT_KEY_BRANCHCLASS_SOCIAL_POLICY"	WHERE Type = "BRANCHCLASS_SOCIAL_POLICY";
UPDATE PolicyBranchClassTypes SET Description	= "TXT_KEY_BRANCHCLASS_IDEOLOGY"		WHERE Type = "BRANCHCLASS_IDEOLOGY";
UPDATE PolicyBranchClassTypes SET Style			= "SOCIAL_POLICY"						WHERE Type = "BRANCHCLASS_SOCIAL_POLICY";
UPDATE PolicyBranchClassTypes SET Style			= "IDEOLOGY"							WHERE Type = "BRANCHCLASS_IDEOLOGY";

UPDATE PolicyBranchTypes SET PolicyBranchClass = "BRANCHCLASS_SOCIAL_POLICY"	WHERE PurchaseByLevel = 0;
UPDATE PolicyBranchTypes SET PolicyBranchClass = "BRANCHCLASS_IDEOLOGY"			WHERE PurchaseByLevel = 1;

UPDATE PolicyBranchTypes SET PolicyBranchImage = "Assets/UI/Art/Icons/SocialPoliciesTradition.dds"		WHERE Type = "POLICY_BRANCH_TRADITION";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "Assets/UI/Art/Icons/SocialPoliciesLiberty.dds"		WHERE Type = "POLICY_BRANCH_LIBERTY";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesHonor.dds"								WHERE Type = "POLICY_BRANCH_HONOR";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesPiety.dds"								WHERE Type = "POLICY_BRANCH_PIETY";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesPatronage.dds"							WHERE Type = "POLICY_BRANCH_PATRONAGE";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesRationalism.dds"						WHERE Type = "POLICY_BRANCH_RATIONALISM";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "PolicyBranch_Exploration.dds"							WHERE Type = "POLICY_BRANCH_EXPLORATION";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesCommerce.dds"							WHERE Type = "POLICY_BRANCH_COMMERCE";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "PolicyBranch_Aesthetics.dds"							WHERE Type = "POLICY_BRANCH_AESTHETICS";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesAutocracy.dds"							WHERE Type = "POLICY_BRANCH_AUTOCRACY";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesFreedom.dds"							WHERE Type = "POLICY_BRANCH_FREEDOM";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesOrder.dds"								WHERE Type = "POLICY_BRANCH_ORDER";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesFascism.dds"							WHERE Type = "POLICY_BRANCH_FASCISM";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesCorporate.dds"							WHERE Type = "POLICY_BRANCH_CORPORATE";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesTechnocracy.dds"						WHERE Type = "POLICY_BRANCH_TECHNOCRACY";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesEcotopia.dds"							WHERE Type = "POLICY_BRANCH_ECOTOPIA";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesVirtualDemocracy.dds"					WHERE Type = "POLICY_BRANCH_VIRTUALDEMOCRACY";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesPacifism.dds"							WHERE Type = "POLICY_BRANCH_PACIFISM";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesImperialism.dds"						WHERE Type = "POLICY_BRANCH_IMPERIALISM";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesPopulism.dds"							WHERE Type = "POLICY_BRANCH_POPULISM";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesCapitalism.dds"							WHERE Type = "POLICY_BRANCH_CAPITALISMX";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesLiberalism.dds"							WHERE Type = "POLICY_BRANCH_LIBERALISM";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesConservatism.dds"						WHERE Type = "POLICY_BRANCH_CONSERVATISM";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesNationalism.dds"						WHERE Type = "POLICY_BRANCH_NATIONALISMX";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesSocialism.dds"							WHERE Type = "POLICY_BRANCH_SOCIALISM";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesAnarchism.dds"							WHERE Type = "POLICY_BRANCH_ANARCHISM";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesEnviromentalism.dds"					WHERE Type = "POLICY_BRANCH_ENVIRONMENTALISM";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesAristocracy.dds"						WHERE Type = "POLICY_BRANCH_ARISTOCRACY";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesPlutocracy.dds"							WHERE Type = "POLICY_BRANCH_PLUTOCRACY";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesPluralism.dds"							WHERE Type = "POLICY_BRANCH_PLURALISM";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesFeudalism.dds"							WHERE Type = "POLICY_BRANCH_FEUDALISM";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesParliamentary.dds"						WHERE Type = "POLICY_BRANCH_PARLIAMENTARY";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesConstitutional.dds"						WHERE Type = "POLICY_BRANCH_CONSTITUTIONAL";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesFederalism.dds"							WHERE Type = "POLICY_BRANCH_FEDERALISM";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesElectoral.dds"							WHERE Type = "POLICY_BRANCH_ELECTORAL";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesTotalitarianism.dds"					WHERE Type = "POLICY_BRANCH_TOTALITARIANISM";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesTheocracy.dds"							WHERE Type = "POLICY_BRANCH_THEOCRACYX";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesRepublic.dds"							WHERE Type = "POLICY_BRANCH_REPUBLICX";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "SocialPoliciesMonarchy.dds"							WHERE Type = "POLICY_BRANCH_MONARCHYX";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "Polynesia_PolicyBranch_Ceremony.dds"				    WHERE Type = "POLICY_BRANCH_SURVIVAL";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "PolicyBranch_NorthAfrica.dds"					        WHERE Type = "POLICY_BRANCH_NOMADIC";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "Polynesia_PolicyBranch_TheArts.dds"					WHERE Type = "POLICY_BRANCH_HUMANITY";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "Slavery.dds."					                        WHERE Type = "POLICY_BRANCH_SLAVERY";
UPDATE PolicyBranchTypes SET PolicyBranchImage = "Polynesia_PolicyBranch_Honor.dds"						WHERE Type = "POLICY_BRANCH_WARFARE";

