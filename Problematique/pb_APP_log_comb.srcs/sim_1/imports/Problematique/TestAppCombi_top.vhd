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

ENTITY TestAppCombi_top_tb IS          --> Remarquez que l'ENTITY est vide et doit le demeurer pour un test bench !!!  
END TestAppCombi_top_tb;


ARCHITECTURE behavioral OF TestAppCombi_top_tb IS 

--> Remplacer ce COMPONENT par celui de votre COMPONENT à tester 
    -- Note: vous pouvez copier la partie PORT ( .. ) de l'entity de votre code VHDL 
    -- et l'insérer dans la déclaration COMPONENT.
--> Si vous voulez comparer 2 modules VHDL, vous pouvez déclarer 2 COMPONENTS 
    -- distincts avec leurs PORT MAP respectif. 

   COMPONENT AppCombi_top
   PORT(  i_S1        : in    std_logic; -- Bouton carte thermo 1
          i_S2        : in    std_logic; -- Bouton carte thermo 2
          i_btn       : in    std_logic_vector (3 downto 0);
          i_ADC_th    : in    std_logic_vector (11 downto 0);
          sysclk      : in    std_logic;                     -- horloge systeme
          
          o_DEL2      : out   std_logic;
          o_DEL3      : out   std_logic;
          o_SSD       : out   std_logic_vector (7 downto 0); -- vers cnnecteur pmod afficheur 7 segments
          o_pmodled   : out   std_logic_vector (7 downto 0); -- vers connecteur pmod 8 DELs
          o_led       : out   std_logic_vector (3 downto 0));
   END COMPONENT;
   
--> Générez des signaux internes au test bench avec des noms associés et les même types que dans le port
    -- Note: les noms peuvent être identiques, dans l'exemple on a ajouté un suffixe pour
    -- identifier clairement le signal qui appartient au test bench

   SIGNAL i_S1_sim      : STD_LOGIC;
   SIGNAL i_S2_sim      : STD_LOGIC;
   SIGNAL i_btn_sim     : std_logic_vector (3 downto 0);
   SIGNAL i_ADC_th_sim  : std_logic_vector (11 downto 0);
   SIGNAL sysclk_sim    : STD_LOGIC;
   SIGNAL o_DEL2_sim    : STD_LOGIC;
   SIGNAL o_DEL3_sim    : STD_LOGIC;
   SIGNAL o_SSD_sim     : std_logic_vector (7 downto 0);
   SIGNAL o_pmodled_sim : std_logic_vector (7 downto 0);
   SIGNAL o_led_sim     : std_logic_vector (3 downto 0);

--> S'il y a plusieurs bits en entrée pour lesquels il faut définir des valeurs de test, 
    -- par exemple a, b, c dans l'exemple présent, on recommande de créer un vecteur de test,
    -- ce qui facilitera l'écriture du test et la lisibilité du code,
    -- notamment en faisant apparaître clairement une structure de table de vérité

   SIGNAL vect_test : STD_LOGIC_VECTOR (17 downto 0);  -- Création d'un signal interne (3 bits)
   
--> Déclarez la constante PERIOD qui est utilisée pour la simulation

   CONSTANT PERIOD    : time := 10 ns;                  --  *** à ajouter avant le premier BEGIN

--> Il faut faire un port map entre vos signaux internes et le component à tester
--> NOTE: Si vous voulez comparer 2 modules VHDL, vous devez génréer 2 port maps 


BEGIN
  -- Par le "port-map" suivant, cela revient à connecter le composant aux signaux internes du tests bench
  -- UUT Unit Under Test: ce nom est habituel mais non imposé.
  -- Si on simule deux composantes, on pourrait avoir UUT1, UUT2 par exemple
  
  UUT: AppCombi_top PORT MAP(
          i_S1        => i_S1_sim,
          i_S2        => i_S2_sim,
          i_btn       => i_btn_sim,
          i_ADC_th    => i_ADC_th_sim,
          sysclk      => sysclk_sim,
          o_DEL2      => o_DEL2_sim,
          o_DEL3      => o_DEL3_sim,
          o_SSD       => o_SSD_sim,
          o_pmodled   => o_pmodled_sim,
          o_led       => o_led_sim
   );

 --> on assigne les signaux du vecteur de test vers les signaux connectés au port map. 
i_ADC_th_sim <= vect_test(11 downto 0); 
i_S1_sim <= vect_test(12);
i_S2_sim <= vect_test(13);
i_btn_sim <= vect_test(17 downto 14);
 
-- *** Test Bench - User Defined Section ***
-- l'intérêt de cette structure de test bench est que l'on recopie la table de vérité.

   tb : PROCESS
   BEGIN
         wait for PERIOD; vect_test <="000000000000000000"; --> Code normal
         wait for PERIOD; vect_test <="000000000000000001";
         wait for PERIOD; vect_test <="000000000000000011";
         wait for PERIOD; vect_test <="000000000000000111";
         wait for PERIOD; vect_test <="000000000000001111";
         wait for PERIOD; vect_test <="000000000000011111";
         wait for PERIOD; vect_test <="000000000000111111";
         wait for PERIOD; vect_test <="000000000001111111";
         wait for PERIOD; vect_test <="000000000011111111";
         wait for PERIOD; vect_test <="000000000111111111";
         wait for PERIOD; vect_test <="000000001111111111";
         wait for PERIOD; vect_test <="000000011111111111";
         wait for PERIOD; vect_test <="000000111111111111";
         
         wait for PERIOD; vect_test <="000001000000000001";
         wait for PERIOD; vect_test <="000001000000000011";
         wait for PERIOD; vect_test <="000000000000000111";
         wait for PERIOD; vect_test <="000010000000001111";
         wait for PERIOD; vect_test <="000000000000011111";
         wait for PERIOD; vect_test <="000010000000111111";
         wait for PERIOD; vect_test <="000100000001111111";
         wait for PERIOD; vect_test <="001000000011111111";
         wait for PERIOD; vect_test <="000100000111111111";
         wait for PERIOD; vect_test <="001000001111111111";
         wait for PERIOD; vect_test <="001100011111111111";
         wait for PERIOD; vect_test <="000000111111111111";
         
         --wait for PERIOD; vect_test <="000000000010";  --> Code avec erreur
         wait for PERIOD; vect_test <="000000010000000010";  --> Code avec erreur
         wait for PERIOD; vect_test <="000000000000000010";  --> Code avec erreur
         wait for PERIOD; vect_test <="000000000000000010";  --> Code avec erreur
         wait for PERIOD; vect_test <="000000000000000100";
         wait for PERIOD; vect_test <="000000000000000110";
         wait for PERIOD; vect_test <="000000000000101111";
         
         wait for PERIOD; vect_test <="000000111111110000";
         wait for PERIOD; vect_test <="000000100001111111";
         
         wait for PERIOD; vect_test <="000000111100011111";
         wait for PERIOD; vect_test <="000000100011111111";
         
         wait for PERIOD; vect_test <="000000111111111100";
         wait for PERIOD; vect_test <="000000111111100111";
     
                  
         WAIT; -- will wait forever
   END PROCESS;
END;


