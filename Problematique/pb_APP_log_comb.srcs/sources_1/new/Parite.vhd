----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2025 12:58:03 PM
-- Design Name: 
-- Module Name: Parite - Behavioral
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

entity Parite is
    Port ( ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
           S1 : in STD_LOGIC;
           Parite : out STD_LOGIC);
end Parite;

architecture Behavioral of Parite is

    signal temp : std_logic;
begin

    process(S1, ADCbin) is
    begin
    
    Case ADCbin is
        when "0000" =>
            temp <= '1';
        when "0001" =>
            temp <= '0';
        when "0010" =>
            temp <= '0';
        when "0011" =>
            temp <= '1';
        when "0100" =>
            temp <= '0';
        when "0101" =>
            temp <= '1';
        when "0110" =>
            temp <= '1';
        when "0111" =>
            temp <= '0';
        when "1000" =>
            temp <= '0';
        when "1001" =>
            temp <= '1';
        when "1010" =>
            temp <= '1';
        when "1011" =>
            temp <= '0';
        when "1100" =>
            temp <= '1';
        when "1101" =>
            temp <= '0';
        when "1110" =>
            temp <= '0';
        when "1111" =>
            temp <= '1';
            
        when others =>
            temp <= '0';
        end case;
           
    end process;    
            
    Parite <= temp when S1 = '0' else not temp;

end Behavioral;
