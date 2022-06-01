----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2022 11:56:41
-- Design Name: 
-- Module Name: alutest - Behavioral
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

entity alutest is
end alutest;

architecture Behavioral of alutest is

COMPONENT alu

--Creating the port needed to see if the ALU is working or not
PORT(A : in STD_LOGIC_VECTOR (7 downto 0);
     B : in STD_LOGIC_VECTOR (7 downto 0);
     S : out STD_LOGIC_VECTOR (7 downto 0);
     ctrl_ALU : in STD_LOGIC_VECTOR (2 downto 0);
     N : out STD_LOGIC;
     O : out STD_LOGIC;
     Z : out STD_LOGIC;
     C : out STD_LOGIC);
END COMPONENT;

--Inputs that are going to be treated
signal A_Test:STD_LOGIC_VECTOR (7 downto 0):=(others => '0');
signal B_Test:STD_LOGIC_VECTOR (7 downto 0):=(others => '0');
signal ctrl_ALU_Test:STD_LOGIC_VECTOR (2 downto 0):=(others => '0');

--Outputs of the test
signal S_Test:STD_LOGIC_VECTOR (7 downto 0);
signal N_Test:STD_LOGIC;
signal O_Test:STD_LOGIC;
signal Z_Test:STD_LOGIC;
signal C_Test:STD_LOGIC;

begin
-- We instantiate the unit which is under test 
uut: alu PORT MAP(
A => A_Test,
B => B_Test,
ctrl_ALU => ctrl_ALU_Test,
S => S_Test,
N => N_Test,
O => O_Test,
Z => Z_Test,
C => C_Test
);

-- We are going to create a stimulus process to see the usage of the ALU
stim_proc: process
begin 

wait for 100 ns;

--Here we are inserting the stimulus 
A_Test <= "10000000";
B_Test <= "10000000";

ctrl_ALU_Test <= "000";
wait for 100 ns;
ctrl_ALU_Test <= "001";
wait for 100 ns;
ctrl_ALU_Test <= "010";

end process;


end Behavioral;
