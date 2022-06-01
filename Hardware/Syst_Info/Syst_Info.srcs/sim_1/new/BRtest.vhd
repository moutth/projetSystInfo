----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.04.2022 15:08:56
-- Design Name: 
-- Module Name: BRtest - Behavioral
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

entity BRtest is
end BRtest;

architecture Behavioral of BRtest is

COMPONENT BR

Port(adr_A : in STD_LOGIC_VECTOR (3 downto 0);
     adr_B : in STD_LOGIC_VECTOR (3 downto 0);
     adr_W : in STD_LOGIC_VECTOR (3 downto 0);
     W : in STD_LOGIC;
     DATA : in STD_LOGIC_VECTOR (7 downto 0);
     RST : in STD_LOGIC;
     CLK : in STD_LOGIC;
     QA : out STD_LOGIC_VECTOR (7 downto 0);
     QB : out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

--Inputs that are going to be treated
signal adr_A_test : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal adr_B_test : STD_LOGIC_VECTOR (3 downto 0) := "0001";
signal adr_W_test : STD_LOGIC_VECTOR (3 downto 0) := "0010";
signal W_test : STD_LOGIC := '1';
signal DATA_test : STD_LOGIC_VECTOR (7 downto 0) := "11111111";
signal RST_test : STD_LOGIC := '1';
signal CLK_test : STD_LOGIC := '1';

--Outputs of the test
signal QA_Test : STD_LOGIC_VECTOR (7 downto 0);
signal QB_Test : STD_LOGIC_VECTOR (7 downto 0);

-- Clock period definition
constant Clock_period: time := 10 ns;

begin

uut: BR PORT MAP(
adr_A => adr_A_test,
adr_B => adr_B_test,
adr_W => adr_W_test,
W => W_test,
DATA => DATA_test, 
RST => RST_test,
CLK => CLK_test,
QA => QA_Test,
QB => QB_Test
);

--Clock process definition 
Clock_process : process 
    
begin 
    wait for Clock_period/2;
    CLK_test <= not(CLK_test);
    
end process;

--Stimulus process 

adr_A_test <= "0000" after 20 ns, "0011" after 60 ns, "0100" after 100 ns, "0101" after 140 ns;
adr_B_test <= "0001" after 20 ns, "0111" after 60 ns, "1000" after 100 ns, "1001" after 140 ns;
adr_W_test <= "0000" after 20 ns, "0111" after 60 ns, "0100" after 100 ns, "1001" after 140 ns;

W_test <= '0' after 20 ns,'1' after 40 ns,'0' after 60 ns,'1' after 80 ns,'0' after 100 ns,'1' after 120 ns, '0' after 140 ns;
DATA_test <= "11111111";

RST_test <= '0' after 20 ns,'1' after 40 ns,'0' after 60 ns,'1' after 80 ns,'0' after 100 ns,'1' after 120 ns, '0' after 140 ns;
end Behavioral;
