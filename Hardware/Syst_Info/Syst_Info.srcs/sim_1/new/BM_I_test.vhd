----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.04.2022 12:05:21
-- Design Name: 
-- Module Name: BM_I_test - Behavioral
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

entity BM_I_test is
end BM_I_test;

architecture Behavioral of BM_I_test is

COMPONENT BM_I
Port ( ADR : in STD_LOGIC_VECTOR (7 downto 0);
       CLK : in STD_LOGIC;
       Output : out STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

--Inputs that are going to be treated
signal ADR_Test : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
signal CLK_Test : STD_LOGIC := '1';

--Outputs of the test
signal Output_Test : STD_LOGIC_VECTOR (31 downto 0);

-- Clock period definition
constant Clock_period: time := 10 ns;

begin

uut : BM_I PORT MAP(
    ADR => ADR_Test,
    CLK => CLK_Test,
    Output => Output_Test
);

--Clock process definition 
Clock_process : process 

begin 
    wait for Clock_period/2;
    CLK_test <= not(CLK_test);
    
end process;

--Stimulus process 
ADR_Test <= "00000000" after 20 ns, "00000001" after 40 ns, "00000010" after 60 ns, "00000011" after 80 ns, "00000100" after 100 ns, "00000101" after 120 ns, "00000110" after 140 ns;

end Behavioral;
