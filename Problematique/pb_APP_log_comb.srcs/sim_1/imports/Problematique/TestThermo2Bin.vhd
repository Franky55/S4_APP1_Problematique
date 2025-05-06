----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/07/2019 08:34:20 PM
-- Design Name: 
-- Module Name: testBench - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;

--> L'entity du test bench est vide et elle doit le demeurer
--> L'entity peut porter le nom que vous voulez mais il est de bonne pratique 
--> d'utiliser le nom du module à tester avec un suffixe par exemple.

ENTITY Thermo2Bin_tb IS          --> Remarquez que l'ENTITY est vide et doit le demeurer pour un test bench !!!  
END Thermo2Bin_tb;


ARCHITECTURE behavioral OF Thermo2Bin_tb IS 

--> Remplacer ce COMPONENT par celui de votre COMPONENT à tester 
    -- Note: vous pouvez copier la partie PORT ( .. ) de l'entity de votre code VHDL 
    -- et l'insérer dans la déclaration COMPONENT.
--> Si vous voulez comparer 2 modules VHDL, vous pouvez déclarer 2 COMPONENTS 
    -- distincts avec leurs PORT MAP respectif. 

   COMPONENT Thermo2Bin
   Port ( ADCth : in STD_LOGIC_VECTOR (11 downto 0);
           ADCbin : out STD_LOGIC_VECTOR (3 downto 0);
           erreur : out STD_LOGIC);
   END COMPONENT;
   
--> Générez des signaux internes au test bench avec des noms associés et les même types que dans le port
    -- Note: les noms peuvent être identiques, dans l'exemple on a ajouté un suffixe pour
    -- identifier clairement le signal qui appartient au test bench

   SIGNAL ADCth_sim    : STD_LOGIC_VECTOR (11 downto 0);
   SIGNAL ADCbin_sim         : STD_LOGIC_VECTOR (3 downto 0);
   SIGNAL erreur_sim         : STD_LOGIC;

--> S'il y a plusieurs bits en entrée pour lesquels il faut définir des valeurs de test, 
    -- par exemple a, b, c dans l'exemple présent, on recommande de créer un vecteur de test,
    -- ce qui facilitera l'écriture du test et la lisibilité du code,
    -- notamment en faisant apparaître clairement une structure de table de vérité

   SIGNAL vect_test : STD_LOGIC_VECTOR (11 downto 0);  -- Création d'un signal interne (3 bits)
   
--> Déclarez la constante PERIOD qui est utilisée pour la simulation

   CONSTANT PERIOD    : time := 20 ns;                  --  *** à ajouter avant le premier BEGIN

--> Il faut faire un port map entre vos signaux internes et le component à tester
--> NOTE: Si vous voulez comparer 2 modules VHDL, vous devez génréer 2 port maps 


BEGIN
  -- Par le "port-map" suivant, cela revient à connecter le composant aux signaux internes du tests bench
  -- UUT Unit Under Test: ce nom est habituel mais non imposé.
  -- Si on simule deux composantes, on pourrait avoir UUT1, UUT2 par exemple
  
  UUT: Thermo2Bin PORT MAP(
      ADCth => ADCth_sim, 
      ADCbin => ADCbin_sim, 
      erreur => erreur_sim
   );

 --> on assigne les signaux du vecteur de test vers les signaux connectés au port map. 
ADCth_sim <= vect_test;
 
-- *** Test Bench - User Defined Section ***
-- l'intérêt de cette structure de test bench est que l'on recopie la table de vérité.

   tb : PROCESS
   BEGIN
         
       --> Cette partie est un exemple pour simuler le thermométrique
         wait for PERIOD; vect_test <="000000000000"; --> Code normal
         wait for PERIOD; vect_test <="000000000001";
         wait for PERIOD; vect_test <="000000000011";
         wait for PERIOD; vect_test <="000000000111";
         wait for PERIOD; vect_test <="000000001111";
         wait for PERIOD; vect_test <="000000011111";
         wait for PERIOD; vect_test <="000000111111";
         wait for PERIOD; vect_test <="000001111111";
         wait for PERIOD; vect_test <="000011111111";
         wait for PERIOD; vect_test <="000111111111";
         wait for PERIOD; vect_test <="001111111111";
         wait for PERIOD; vect_test <="011111111111";
         wait for PERIOD; vect_test <="111111111111";
         --wait for PERIOD; vect_test <="000000000010";  --> Code avec erreur
         wait for PERIOD; vect_test <="010000000010";  --> Code avec erreur
         wait for PERIOD; vect_test <="000000000010";  --> Code avec erreur
         wait for PERIOD; vect_test <="000000000010";  --> Code avec erreur
         wait for PERIOD; vect_test <="000000000100";
         wait for PERIOD; vect_test <="000000000110";
         wait for PERIOD; vect_test <="000000101111";
         
         wait for PERIOD; vect_test <="111111110000";
         wait for PERIOD; vect_test <="111111100001";
         wait for PERIOD; vect_test <="111111000011";
         wait for PERIOD; vect_test <="111110000111";
         wait for PERIOD; vect_test <="111100001111";
         wait for PERIOD; vect_test <="111000011111";
         wait for PERIOD; vect_test <="110000111111";
         wait for PERIOD; vect_test <="100001111111";
         
         wait for PERIOD; vect_test <="111111111000";
         wait for PERIOD; vect_test <="111111110001";
         wait for PERIOD; vect_test <="111111100011";
         wait for PERIOD; vect_test <="111111000111";
         wait for PERIOD; vect_test <="111110001111";
         wait for PERIOD; vect_test <="111100011111";
         wait for PERIOD; vect_test <="111000111111";
         wait for PERIOD; vect_test <="110001111111";
         wait for PERIOD; vect_test <="100011111111";
         
         wait for PERIOD; vect_test <="111111111100";
         wait for PERIOD; vect_test <="111111111001";
         wait for PERIOD; vect_test <="111111110011";
         wait for PERIOD; vect_test <="111111100111";
         wait for PERIOD; vect_test <="111111001111";
         wait for PERIOD; vect_test <="111110011111";
         wait for PERIOD; vect_test <="111100111111";
         wait for PERIOD; vect_test <="111001111111";
         wait for PERIOD; vect_test <="110011111111";
         wait for PERIOD; vect_test <="100111111111";
         
         wait for PERIOD; vect_test <="111111111110";
         wait for PERIOD; vect_test <="111111111101";
         wait for PERIOD; vect_test <="111111111011";
         wait for PERIOD; vect_test <="111111110111";
         wait for PERIOD; vect_test <="111111101111";
         wait for PERIOD; vect_test <="111111011111";
         wait for PERIOD; vect_test <="111110111111";
         wait for PERIOD; vect_test <="111101111111";
         wait for PERIOD; vect_test <="111011111111";
         wait for PERIOD; vect_test <="110111111111";
         wait for PERIOD; vect_test <="101111111111";
                  
         WAIT; -- will wait forever
   END PROCESS;
END;


