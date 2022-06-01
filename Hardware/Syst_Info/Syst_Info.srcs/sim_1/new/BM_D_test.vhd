----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.04.2022 12:04:07
-- Design Name: 
-- Module Name: BM_D_test - Behavioral
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

entity BM_D_test is 
end BM_D_test;

architecture Behavioral of BM_D_test is

COMPONENT BM_D
Port ( ADR : in STD_LOGIC_VECTOR (7 downto 0);
       Insert : in STD_LOGIC_VECTOR (7 downto 0);
       RW : in STD_LOGIC;
       RST : in STD_LOGIC;
       CLK : in STD_LOGIC;
       Output : out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

--Inputs that are going to be treated
signal ADR_test : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
signal Insert_test : STD_LOGIC_VECTOR (7 downto 0) := "11111111";
signal RW_test : STD_LOGIC := '1';
signal RST_test : STD_LOGIC := '1';
signal CLK_test : STD_LOGIC := '1';

--Outputs of the test
signal Output_test : STD_LOGIC_VECTOR(7 downto 0);

-- Clock period definition
constant Clock_period: time := 10 ns;

begin

uut : BM_D PORT MAP(
    ADR => ADR_test,
    Insert => Insert_test,
    RW => RW_test,
    RST => RST_test,
    CLK => CLK_test,
    Output => Output_test
);

--Clock process definition 
Clock_process : process 
    
begin 
    wait for Clock_period/2;
    CLK_test <= not(CLK_test);
    
end process;

--Stimulus process 
ADR_test <= "00000000" after 20 ns,"00000001" after 60 ns, "00000010" after 100 ns, "00000011" after 140 ns;
Insert_test <= "11111111" after 20 ns,"11111110" after 60 ns, "11111101" after 100 ns, "11111100" after 140 ns;

RW_test <= '0' after 20 ns,'1' after 40 ns,'0' after 60 ns,'1' after 80 ns,'0' after 100 ns,'1' after 120 ns,'0' after 140 ns,'1' after 160 ns;
RST_test <= '1' after 20 ns, '0' after 50 ns, '1' after 60 ns, '0' after 90 ns,'1' after 100 ns, '0' after 130 ns,'1' after 140 ns, '0' after 170 ns;

end Behavioral;
