----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2025 11:53:06 AM
-- Design Name: 
-- Module Name: Bin2DualBCD - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Bin2DualBCD is
    Port ( ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
           Dizaines : out STD_LOGIC_VECTOR (3 downto 0);
           Unites_ns : out STD_LOGIC_VECTOR (3 downto 0);
           Code_signe : out STD_LOGIC_VECTOR (3 downto 0);
           Unite_s : out STD_LOGIC_VECTOR (3 downto 0));
end Bin2DualBCD;

architecture Behavioral of Bin2DualBCD is

COMPONENT Bin2DualBCD_S
   Port ( Moins5 : in STD_LOGIC_VECTOR (3 downto 0);
           Code_signe : out STD_LOGIC_VECTOR (3 downto 0);
           Unite_s : out STD_LOGIC_VECTOR (3 downto 0));
   END COMPONENT;
 
COMPONENT Bin2DualBCD_NS
   Port ( ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
           Dizaines : out STD_LOGIC_VECTOR (3 downto 0);
           Unites_ns : out STD_LOGIC_VECTOR (3 downto 0));
   END COMPONENT;
 
 COMPONENT Moins_5
   Port ( 
               ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
               Moins5 : out STD_LOGIC_VECTOR (3 downto 0)
               );
   end component;
     signal Moins5_temp     : STD_LOGIC_VECTOR (3 downto 0);
begin

    UUT: Bin2DualBCD_NS PORT MAP(
      ADCbin => ADCbin, 
      Dizaines => Dizaines, 
      Unites_ns => Unites_ns
   );
   
   UUT2: Moins_5 PORT MAP(
      ADCbin => ADCbin, 
      Moins5 => Moins5_temp
   );
   
   UUT3: Bin2DualBCD_S PORT MAP(
      Moins5 => Moins5_temp, 
      Code_signe => Code_signe,
      Unite_s => Unite_s
   );

end Behavioral;
