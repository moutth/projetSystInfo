----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.06.2022 00:12:37
-- Design Name: 
-- Module Name: GEST_ALEA - Behavioral
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

entity GEST_ALEA is
    Port ( COMPTEUR : in integer;
           OP_1 : in STD_LOGIC_VECTOR (7 downto 0);
           OP_2 : in STD_LOGIC_VECTOR (7 downto 0);
           CLK_IN : in STD_LOGIC;
           CLK_IN2 : in time;
           CLK_OUT : out STD_LOGIC);
end GEST_ALEA;

architecture Behavioral of GEST_ALEA is

signal CLK_TRANSITOIRE : STD_LOGIC;
begin

    CLK_OUT <= CLK_TRANSITOIRE;
    
    process(CLK_IN)
    begin 
        if(((OP_1 = x"01" or OP_1 = x"02" or OP_1 = x"03" or OP_1 = x"05" or OP_1 = x"06" or OP_1 = x"08") or ((OP_1 = x"01" or OP_1 = x"01") and (OP_2 = x"01" or OP_2 = x"02" or OP_2 = x"03" or OP_2 = x"05" or OP_2 = x"06" or OP_2 = x"08"))) and (COMPTEUR = 3 and  rising_edge(CLK_IN))) then 
            CLK_TRANSITOIRE <= '1';
        elsif(OP_1 = x"07") then 
            CLK_TRANSITOIRE <= '1';
        else 
            CLK_TRANSITOIRE <= '0';
        end if;
    end process;
end Behavioral;
