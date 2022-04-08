----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2022 08:52:47
-- Design Name: 
-- Module Name: Compteur - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Compteur is
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           LOAD : in STD_LOGIC;
           Din : in STD_LOGIC_VECTOR (15 downto 0);
           ENABLE : in STD_LOGIC;
           SENS : in STD_LOGIC;
           Dout : out STD_LOGIC_VECTOR (15 downto 0));
end Compteur;

architecture Behavioral of Compteur is

Signal Aux : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');

begin

    process
    
    begin
        
        wait until CLK'event and CLK='1';
        
        if (RESET='0') then
            Aux <= (others => '0');
        elsif (LOAD='1') then
            Aux <= Din;
        elsif (ENABLE='0') then
            if (SENS = '0') then
                Aux <= Aux+1;
            else
                Aux <= Aux-1;
            end if;
        end if;
        Dout <= Aux;
        
    end process;

end Behavioral;
