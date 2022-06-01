----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.04.2022 11:40:30
-- Design Name: 
-- Module Name: BM_I - Behavioral
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
USE ieee.numeric_std.ALL; 


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BM_I is
    Port ( ADR : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (31 downto 0));
end BM_I;

architecture Behavioral of BM_I is 

type Memoire is array(255 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
signal zone:Memoire := (others => x"00000000");

begin
    zone(0) <= x"06030100"; -- AFC 3 1
    zone(1) <= x"05040300"; -- COP 4 3
    zone(2) <= x"01050403"; -- ADD 5 4 3
    zone(3) <= x"03060504"; -- SOU 6 5 4 
    zone(4) <= x"02070505"; -- MUL 7 5 5 
    zone(5) <= x"08010700"; -- STORE 1 7 
    zone(6) <= x"07080100"; -- LOAD 8 1  
    zone(7) <= x"06030100"; -- AFC 3 1
    
    process 
    begin 
    
        wait until rising_edge(CLK);
        
        Output <= zone(to_integer(unsigned(ADR)));
    
    end process;

end Behavioral;
