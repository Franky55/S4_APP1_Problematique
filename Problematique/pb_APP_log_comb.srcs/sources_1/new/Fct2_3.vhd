----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2025 01:39:07 PM
-- Design Name: 
-- Module Name: Fct2_3 - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Fct2_3 is
    Port ( ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
           A2_3 : out STD_LOGIC_VECTOR (2 downto 0));
end Fct2_3;

architecture Behavioral of Fct2_3 is

signal ADC : std_logic_vector (3 downto 0) := "0000";
signal d_opa             : std_logic_vector (3 downto 0);   -- operande A
signal d_opb             : std_logic_vector (3 downto 0);   -- operande B
signal d_cin             : std_logic := '0';                         -- retenue entree
signal d_sum             : std_logic_vector (3 downto 0);   -- somme
signal d_cout            : std_logic := '0';                         -- retenue sortie

    component Add4bits is
    Port ( X : in STD_LOGIC_VECTOR (3 downto 0);
           Y : in STD_LOGIC_VECTOR (3 downto 0);
           Ci : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Co : out STD_LOGIC);
    end component;
begin
d_opa <= ADCbin;
d_opb <= std_logic_vector(unsigned(ADCbin) srl 2);

    inst_add4bits1 : Add4bits
        Port Map( 
           X    => d_opa,
           Y    => d_opb,
           Ci   => d_cin,
           S    => d_sum,
           Co   => d_cout
           );
    A2_3 <= d_sum(3 downto 1);

end Behavioral;
