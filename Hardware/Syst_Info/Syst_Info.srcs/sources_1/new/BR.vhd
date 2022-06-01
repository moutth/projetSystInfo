----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.04.2022 11:32:38
-- Design Name: 
-- Module Name: BR - Behavioral
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

entity BR is
    Port ( adr_A : in STD_LOGIC_VECTOR (3 downto 0);
           adr_B : in STD_LOGIC_VECTOR (3 downto 0);
           adr_W : in STD_LOGIC_VECTOR (3 downto 0);
           W : in STD_LOGIC;
           DATA : in STD_LOGIC_VECTOR (7 downto 0);
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           QA : out STD_LOGIC_VECTOR (7 downto 0);
           QB : out STD_LOGIC_VECTOR (7 downto 0));
end BR;

architecture Behavioral of BR is

type Banc is array(15 downto 0) of STD_LOGIC_VECTOR (7 downto 0);
signal reg:Banc;

begin 

process 
begin

    wait until rising_edge(CLK);
    
    if (RST = '0') then  
        for I in 0 to 15 loop
            reg(I) <= X"00";
        end loop;
    else 
        if( W = '1' ) then 
            reg(to_integer(unsigned(adr_W))) <= DATA;
        end if;
    end if;
    
end process;

QA<= reg(to_integer(unsigned(adr_A)));
QB<= DATA when adr_B = adr_W and W = '1' else reg(to_integer(unsigned(adr_B)));

end Behavioral;
