----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2025 01:20:32 PM
-- Design Name: 
-- Module Name: Thermo2Bin - Behavioral
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

entity Thermo2Bin is
    Port ( ADCth : in STD_LOGIC_VECTOR (11 downto 0);
           ADCbin : out STD_LOGIC_VECTOR (3 downto 0);
           erreur : out STD_LOGIC);
end Thermo2Bin;

architecture Behavioral of Thermo2Bin is

    signal out_1 : std_logic_vector (3 downto 0); 
    signal out_2 : std_logic_vector (3 downto 0); 
    signal out_3 : std_logic_vector (3 downto 0); 
    signal erreur_1 : std_logic;
    signal erreur_2 : std_logic;
    signal erreur_3 : std_logic;
    signal sum1 : std_logic_vector (3 downto 0); 
    signal carry : std_logic;
    
    
    component Thermo2Bin_4Bits is
    Port ( ADC4Bits : in STD_LOGIC_VECTOR (3 downto 0);
           ADCOut4Bits : out STD_LOGIC_VECTOR (3 downto 0);
           erreur : out STD_LOGIC);
    end component;
    
    component Add4bits is
    Port ( X : in STD_LOGIC_VECTOR (3 downto 0);
           Y : in STD_LOGIC_VECTOR (3 downto 0);
           Ci : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Co : out STD_LOGIC);
    end component;

begin

    inst_Thermo2Bin_4Bits1 : Thermo2Bin_4Bits
        Port Map( 
            ADC4Bits => ADCth(3 downto 0),
           ADCOut4Bits => out_1,
           erreur => erreur_1
           );
           
    inst_Thermo2Bin_4Bits2 : Thermo2Bin_4Bits
        Port Map( 
            ADC4Bits => ADCth(7 downto 4),
           ADCOut4Bits => out_2,
           erreur => erreur_2
           );
           
    inst_Thermo2Bin_4Bits3 : Thermo2Bin_4Bits
        Port Map( 
            ADC4Bits => ADCth(11 downto 8),
           ADCOut4Bits => out_3,
           erreur => erreur_3
           );

    inst_add4bits1 : Add4bits
        Port Map( 
           X    => out_1,
           Y    => out_2,
           Ci   => '0',
           S    => sum1,
           Co   => carry
           );
           
    inst_add4bits2 : Add4bits
        Port Map( 
           X    => sum1,
           Y    => out_3,
           Ci   => carry,
           S    => ADCbin
           );
           
    process(out_1, out_2, out_3) is
        begin
            if (out_2 /= "0000" AND out_1(3) = '0') or
               (out_3 /= "0000" AND out_2(3) = '0') then
                erreur <= '1';
            else
                erreur <= erreur_1 OR erreur_2 OR erreur_3;
            end if;
    end process;
end Behavioral;
