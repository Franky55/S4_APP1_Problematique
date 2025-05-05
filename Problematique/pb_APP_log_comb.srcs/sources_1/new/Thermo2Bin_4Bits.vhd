----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2025 06:10:23 PM
-- Design Name: 
-- Module Name: Thermo2Bin_4Bits - Behavioral
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

entity Thermo2Bin_4Bits is
    Port ( ADC4Bits : in STD_LOGIC_VECTOR (3 downto 0);
           ADCOut4Bits : out STD_LOGIC_VECTOR (3 downto 0);
           erreur : out STD_LOGIC);
end Thermo2Bin_4Bits;

architecture Behavioral of Thermo2Bin_4Bits is
    
    signal A : std_logic;
    signal B : std_logic;
    signal C : std_logic;
    signal D : std_logic;
    
begin

    A <= ADC4Bits(3);
    B <= ADC4Bits(2);
    C <= ADC4Bits(1);
    D <= ADC4Bits(0);
    
    erreur <= (A AND NOT B) OR (C AND NOT D) OR (B AND NOT C);

    ADCOut4Bits(0) <= (NOT A AND B) OR (NOT C AND D);
    ADCOut4Bits(1) <= (NOT A AND C);
    ADCOut4Bits(2) <= A;
    ADCOut4Bits(3) <= '0'; 
    
    
end Behavioral;
